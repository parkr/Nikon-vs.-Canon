<?php

if( isset($_GET) && isset($_GET['id']) ){
	$id = filter_input(INPUT_GET, "id", FILTER_VALIDATE_INT);

	require_once("db.php");
	
	mysql_query("DELETE FROM `".TABLE."` WHERE `id` = $id") or die(mysql_error());
	header("Location: /nikon-vs-canon/");
	
}else{
	header("Content-Type: text/plain");
	echo "BITCH\n";
	print_r($_GET);
}

?>