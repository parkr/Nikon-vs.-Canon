<?php

if($_SERVER["HTTP_HOST"] == "localhost"){
	$host = "localhost";
	$username = "root";
	$password = "";
	$db = "test";
	define('TABLE', "nikon-canon");
	define('COMPARISONS', "nikon-canon-comparisons");
}else{
	# Ahh, later.
	include "secretdatabaseissecret.php";
}

mysql_connect($host, $username, $password) or die(mysql_error());
mysql_select_db($db) or die(mysql_error());

?>