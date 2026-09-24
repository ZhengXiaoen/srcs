
table.copy = function(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
		    copy[orig_key] = orig_value
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

table.deepcopy = function(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
	  copy = {}
	  for orig_key, orig_value in next, orig, nil do
			copy[table.deepcopy(orig_key)] = table.deepcopy(orig_value)
	  end
	  setmetatable(copy, table.deepcopy(getmetatable(orig)))
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

function string_split(str, split_char)  
	local result = {}
	local i = 1
	local substr
	local pos 
    local nLoopIndex = 0
	while true do
        pos = string.find(str, split_char, i)  
        if not pos then
        	substr  = string.sub(str, i)
        	table.insert(result, substr)
            break  
        end

        substr = string.sub(str, i, pos - 1)
        i = pos + 1
        table.insert(result, substr) 
         nLoopIndex = nLoopIndex + 1
        if nLoopIndex > 1000 then
                System.trace("LoopIndex GemExChangeStr")
                break
        end
    end
    
    return result  
end