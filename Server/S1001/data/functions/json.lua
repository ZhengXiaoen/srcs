json = {}

json.NONE      = -1
json.ANY       = 0
json.OBJECT    = 1
json.ARRAY     = 2
json.STRING    = 3
json.NUMBER    = 4
json.BOOLEAN   = 5
json.NULL      = 6
json.EOF       = 7


JSON_OPEN_ARRAY   = 0x5B
JSON_CLOSE_ARRAY  = 0x5D
JSON_OPEN_OBJECT  = 0x7B
JSON_CLOSE_OBJECT = 0x7D
JSON_NAME_SEP     = 0x3A -- colon
JSON_VALUE_SEP    = 0x2C -- comma
JSON_ESC_CHAR     = 0x5C -- backslash
JSON_QUOTE        = 0x22 -- "
JSON_TRUE_FIRST   = 0x74 -- t
JSON_FALSE_FIRST  = 0x66 -- f
JSON_NULL_FIRST   = 0x6E -- n

Walker = {}

function json_current_char(walker)
  return string.byte(walker.data, walker.position)
end

function json_advance(walker, num)
  walker.position = walker.position + (num or 1)
end

-- Walk beyond all space
function json_eat_space(walker)
  local pos = walker.position
  while true do
    local char = string.byte(walker.data, pos)
    -- ¿Õ¸ñ \t \n \r
    if char == 0x20 or char == 0x09 or char == 0x0A or char == 0x0D then
      pos = pos + 1
    else
      walker.position = pos
      return
    end
  end
end

function json_advance_space(walker, num)
  json_advance(walker, num)
  json_eat_space(walker)
end

function json.walk(data)
  local walker = { position = 1, data = data }
  setmetatable(walker, { __index = Walker })
  json_eat_space(walker)
  return walker
end

function Walker:fork()
  local walker = { position = self.position, data = self.data }
  setmetatable(walker, { __index = Walker })
  return walker
end

function Walker:type()
  local char = json_current_char(self)
  if char == JSON_OPEN_OBJECT then -- {
    return json.OBJECT
  elseif char == JSON_OPEN_ARRAY then
    return json.ARRAY
  elseif char == JSON_QUOTE then
    return json.STRING
  elseif char == JSON_TRUE_FIRST or char == JSON_FALSE_FIRST then
    return json.BOOLEAN
  elseif char == JSON_NULL_FIRST then
    return json.NULL
  elseif char == nil then
    return json.EOF
  else
    -- Don't bother checking if it's really a number. handle_number()
    -- will throw an exception when it fails to parse it.
    return json.NUMBER
  end
end

---- Handlers
-- All of these handlers are optimistic: They assume that you are
-- indeeed positioned at the current place.

function json_handle_boolean(self, skip)
  local char = json_current_char(self)
  local is_true = (char == JSON_TRUE_FIRST)

  -- Assume valid JSON
  local length = (is_true and 4 or 5)
  json_advance_space(self, length)

  if not skip then
    return is_true
  end
end

function json_handle_null(self)
  json_advance_space(self, 4)
end

function json_handle_number(self, skip)
  local start = self.position
  local _, stop = string.find(self.data, '^-?%d+', start)
  assert(stop, 'expected number')

  -- Look for fractions
  local _, frac_stop = string.find(self.data, '^%.%d+', stop+1)
  stop = frac_stop or stop

  -- Look for exponents
  local _, exp_stop = string.find(self.data, '^[eE][+-]?%d+', stop+1)
  stop = exp_stop or stop

  self.position = stop + 1
  json_eat_space(self)

  if not skip then
    return tonumber(string.sub(self.data, start, stop))
  end
end

function json_handle_string(self, skip)
  local start = self.position+1
  local pos = start
  local parts

  if not skip then
    -- TODO: Optimize string buffer for LuaJIT
    parts = {}
  end

  while true do
    local char = string.byte(self.data, pos)
    assert(char, "unclosed string")

    if char == JSON_QUOTE or char == JSON_ESC_CHAR then
      if not skip then
        table.insert(parts, string.sub(self.data, start, pos-1))
      end

      if char == JSON_QUOTE then break end

      -- Handle escape sequence
      local esc_char = string.byte(self.data, pos+1)
      local extra_char

      -- Advance two steps: once for the \ and once for the next char.
      pos = pos + 2

      if esc_char == 0x62 then
        extra_char = '\b'
      elseif esc_char == 0x66 then
        extra_char = '\f'
      elseif esc_char == 0x6E then
        extra_char = '\n'
      elseif esc_char == 0x72 then
        extra_char = '\r'
      elseif esc_char == 0x74 then
        extra_char = '\t'
      elseif esc_char == 0x75 then
        local hex_string = string.sub(self.data, pos, pos+3)
        local char_code = tonumber(hex_string, 16)
        -- TODO: Convert to proper UTF-8
        extra_char = string.char(char_code)
        pos = pos + 4
      else
        -- Don't ignore the character
        pos = pos - 1
      end

      if not skip and extra_char then
        table.insert(parts, extra_char)
      end

      start = pos
    end

    pos = pos + 1
  end

  self.position = pos + 1
  json_eat_space(self)

  if not skip then
    return table.concat(parts)
  end
end

function json_handle_key(self, skip)
  local key = json_handle_string(self, skip)
  assert(json_current_char(self) == JSON_NAME_SEP)
  json_advance_space(self)
  return key
end

function json_handle_object(self, skip)
  local obj = (not skip) and {}

  while self:next_item() do
    local key = json_handle_key(self, skip)

    if skip then
      self:skip()
    else
      obj[key] = self:read()
    end
  end

  return obj
end

function json_handle_array(self, skip)
  local arr = (not skip) and {}

  while self:next_item() do
    if skip then
      self:skip()
    else
      table.insert(arr, self:read())
    end
  end

  return arr
end

-- Generic handler. Checks the current type and invokes the correct
-- handler. You can pass in the expected type in +exp_t+.
function json_handle(self, exp_t)
  local t = self:type()
  local skip = (exp_t ~= json.ANY) and (t ~= exp_t)

  if t == json.OBJECT then
    return json_handle_object(self, skip)
  elseif t == json.ARRAY then
    return json_handle_array(self, skip)
  elseif t == json.STRING then
    return json_handle_string(self, skip)
  elseif t == json.NUMBER then
    return json_handle_number(self, skip)
  elseif t == json.BOOLEAN then
    return json_handle_boolean(self, skip)
  elseif t == json.NULL then
    -- Doesn't really matter what we return here
    json_handle_null(self)
  end
end

function Walker:read()
  return json_handle(self, json.ANY)
end

function Walker:read_boolean()
  return json_handle(self, json.BOOLEAN)
end

function Walker:read_null()
  local is_null = (self:type() == json.NULL)
  json_handle(self, json.NONE) -- skip the value
  return is_null
end

function Walker:read_number()
  return json_handle(self, json.NUMBER)
end

function Walker:read_string()
  return json_handle(self, json.STRING)
end

function Walker:read_object()
  return json_handle(self, json.OBJECT)
end

function Walker:read_array()
  return json_handle(self, json.ARRAY)
end

function Walker:read_key()
  return json_handle_key(self)
end

function Walker:skip_key()
  return json_handle_key(self, true)
end

function Walker:skip()
  json_handle(self, json.NONE)
end

function Walker:next_item()
  local char = json_current_char(self)

  json_advance_space(self)

  if char == JSON_CLOSE_OBJECT or char == JSON_CLOSE_ARRAY then
    return false
  end

  assert(char == JSON_OPEN_OBJECT or char == JSON_OPEN_ARRAY or char == JSON_VALUE_SEP)
  return true
end

function Walker:iter_object()
  return function()
    if self:next_item() then
      return self:read_key()
    end
  end
end

function Walker:iter_array()
  local i = 0
  return function()
    i = i + 1
    if self:next_item() then
      return i
    end
  end
end

function json.decode(data)
  return json.walk(data):read()
end

