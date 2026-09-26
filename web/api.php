<?php
ob_start();
session_start();
$key='differofzjcqha';
$game_name='散人传说';
$InterfaceKey =$_GET['username'];
$paswd=$_GET['username'];//密码账号
$loginVerify_md5=md5($paswd);
$ttime=time();
$username=$_GET['username'];
$sid=$_GET['sid'];
$Spid='wyi';
$flag_plant="user=".$username."&sid=".$sid."&Spid=".$Spid."&Key=".$InterfaceKey."&Time=".$time;
$flag=md5($flag_plant);
$LANGUAGE='zh-cn';
$webUrl='http://127.0.0.1';
$client=1;
$dlq=$_GET['dlq'];
$ver= max(filemtime(dirname(__FILE__).'/GameFrame.swf'), filemtime(dirname(__FILE__).'/v2/lang/zh-cn/zh-cn.dat'));
$payUrl='http://www.2021gm.com';
$ip='127.0.0.1';
//分区端口，每区一行
$serverPorts=
[
13001,//1区
13002,//2区




];
$index =$sid-1;
$serverrow= $serverPorts[$index];
echo $serverrow;
//$serverrow='13906';
$ressite='http://127.0.0.1/v2/';
//$servername='一区';

$database='cq_account'; 
$conn = @mysql_connect("127.0.0.1","root","123456abc") or die ("服务器维护中~详情联系 www.cn121.com。");
@mysql_select_db("$database",$conn) or die ("数据库表不存在或者未连接。请联系管理员 。");
mysql_query("set names utf8"); //使用文件编码，防止出错

$sql=mysql_query("select * from $database.globaluser where account ='$username'",$conn);
$row =mysql_num_rows($sql);

 if(!$row){
$sql = mysql_query("insert into $database.globaluser(account,passwd)values('$username','$loginVerify_md5')",$conn);
//$RepUS = ($row[0] == '2') ? "true" : "false";
 }
//file_put_contents('log.txt',date("Y-m-d H:i:s",time()).'|'.$sql.'|'.$row['cid'].PHP_EOL,FILE_APPEND);
//}else{
//	exit("效验错误");
//}





$flash_vars="srvaddr=".$ip."&srvport=".$serverrow."&time=".$ttime."&sessionKey=".$key."&sign=".$flag."&srvid=".$sid."&spid=".$Spid."&ressite=".$ressite."&rankurl=rank/rankingserver.php&payurl=".$payUrl."&map=2&user=".$username."&spverify=".$loginVerify_md5."&gameName=".$gameName."&lang=zh-cn&repus=false&frameRate=60&homeURL=".$webUrl."&client=".$client."&clienURL=".$dlq;

$flash_vars=base64_encode(sampleEncodeParam($flash_vars));
$v=$flash_vars;




function sampleEncodeParam($s)
{
	$hexchars = '0123456789ABCDEF';
	if ( !$s || strlen($s) <= 0 )
	{
		echo "null string.";
		return "";
	}
	$len = strlen($s);
	$ret = '';
	$curc = 0;
	$nextc = ord(substr($s, 0, 1));
	for ($i=1; $i<$len; $i++ )
	{
		$curc = $nextc;
		$nextc = ord(substr($s, $i, 1));
		$curc ^= $nextc;
		//echo '<br> 0x'. substr($hexchars, ($curc & 0xF0) >> 4, 1) . substr($hexchars, $curc & 0x0F, 1);
		$ret .= substr($hexchars, ($curc & 0xF0) >> 4, 1);
		$ret .= substr($hexchars, $curc & 0x0F, 1);
	}
	$curc = $nextc ^ 0x7C;
	$ret .= substr($hexchars, ($curc & 0xF0) >> 4, 1);
	$ret .= substr($hexchars, $curc & 0x0F, 1);
	return $ret;
}
function GetloginUrl(){
	return LOGINURL;
}
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
*{margin:0px; padding:0px; overflow:hidden;}
html, body, #swfContainer, #swfContent{height:100%;}
body{background:#000;}
body, div{font-family: 宋体;	font-size: 0px; color: #FFFFFF;}
#navBar{text-align:right; padding:0px;}
</style>
<script type="text/javascript" src="js/rightClick.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/swfobject.js"></script>
<script type="text/javascript">

function loaded(){
	//alert("onloaded");
	resize();
	var flashvars = {
		gp:'<?=$v?>',
		ver:<?=$ver?>		};
	var params = {
		allowScriptAccess: "always",
		menu:"false",
		wmode:"window"}; //需设置该属性为'always'};
	var attributes = {
		id:"gameSwf",
		menu:"false",
		wmode:"window"};
	swfobject.embedSWF("LoadGame.swf?v=<?=$ver?>", "swfContent", "100%", "100%", "10.0.0", false, flashvars, params, attributes);
}
function resize(){
	var clientH = document.body.clientHeight;
	var navH = 0;
	var flashvars = getParams();
	//如果是端登陆，则把 中间嵌入的删除
	if(flashvars["client"] =="1"  )
	{
		var nav = document.getElementById("navBar");
		if ( nav != null)
		{
			nav.parentNode.removeChild( nav);
		}

	}
	else
	{
		navH= $("navBar").offsetHeight;
	}
	
	$('swfContainer').style.height = (clientH - navH) + "px";
	//alert("clientHeight:" + clientH + ", navHeight:" + navH + ", swfHeight:" + $('swfContainer').style.height);
}

function addBookmark_game()
{
	addBookmark("《刀剑如梦》", "http://www.521g.com/miros/wwy/jxjh/game.html");
}
</script>
</head>
<body id="GameFrameContainer" onload="loaded();RightClick.init();" onresize="resize();">
<div id="navBar"></div>
<div id="swfContainer"><div id="swfContent"></div></div>
</body>
</html>
