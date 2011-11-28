<?php

$nikon = 0;
$canon = 0;

require_once("db.php");

$r = mysql_query("SELECT * FROM `".COMPARISONS."`") or die(mysql_error());

while($comp = mysql_fetch_assoc($r)){
	if($comp['nikon_photo_id'] == $comp['winner'])
		$nikon++;
	else
		$canon++;
}

?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Who the winner be?</title>
	<style type="text/css" media="screen">
		@import url(http://fonts.googleapis.com/css?family=Signika:400,600,700,300);
		html, body {
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
			background-color: #eeeeee;
			font-family: "Signika", sans-serif;
		}
		#container {
			width: 1000px;
			height: 100%;
			margin: 0 auto;
			text-align: center;
		}
		.photo {
			/*width: 450px;*/
			float: left;
			height: auto;
			margin-right: 10px;
		}
	</style>
</head>
<body>
	<div id="container">
		<h1 id="the_winner">WHO BE THE WINNER?</h1>
		<p>
			<h2>NIKON = <?=$nikon?> votes</h2>
		</p>
		<p>
			<h2>CANON = <?=$canon?> votes</h2>
		</p>
		<p>
			IDEA: OVERLAY THE NUMBERS OVER AN IMAGE OF THE BRAND'S LOGO!!
		</p>
	</div>
</body>
</html>
