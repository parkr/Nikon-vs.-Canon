<?php

require "db.php";
require "bacon_ipsum.php";

function url($photo){
	// Return the URL
	if($photo["url"] != ""){
		return $photo["url"];
	}else{
		// URL isn't there. Can I build it?
		return "no_url_available.jpg";
	}
}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Nikon vs. Canon: Which is Better?</title>
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
		<h1>Nikon vs. Canon</h1>
		<h2>Which is better?</h2>
		<?php
			// Get 2 photos of different brand. Randomize!!
			$get_canon = "SELECT * FROM `nikon-canon` WHERE `brand` = \"Canon\" ORDER BY RAND() LIMIT 0,1";
			$get_nikon = "SELECT * FROM `nikon-canon` WHERE `brand` = \"Nikon\" ORDER BY RAND() LIMIT 0,1";
			// Get results
			$canon = mysql_fetch_assoc(mysql_query($get_canon));
			$nikon = mysql_fetch_assoc(mysql_query($get_nikon));
			$photos = array($canon, $nikon);
			shuffle(&$photos);
			
			// Log the views of these images
			mysql_query("UPDATE `nikon-canon` SET view_count=view_count+1 WHERE photo_id = ".$nikon["photo_id"]." OR photo_id = ".$canon["photo_id"]) or die(mysql_error());
			
			for($i=0; $i<count($photos); $i++):
		?><div id="photo<?=($i+1)?>" class="photo" data-flickr-id="<?=($photos[$i]["photo_id"])?>">
			<a href="count.php?k=<?=$canon["photo_id"]?>&l=<?=$nikon["photo_id"]?>&m=<?=$photos[$i]["photo_id"]?>">
				<img src="<?=url($photos[$i])?>" alt="<?php echo $bacon_ipsum[array_rand($bacon_ipsum)]; ?>" width="490">
			</a>
			<p>
				Problem? <a href="delete.php?id=<?=$photos[$i]["photo_id"]?>" title="Cuz it suckz">Delete this image.</a>
			</p>
		</div>
	<? endfor; ?></div>
</body>
</html>
