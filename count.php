<?php

require "db.php";


// Require GET "id"
$winner = filter_input(INPUT_GET, "m", FILTER_VALIDATE_INT);
$canon = filter_input(INPUT_GET, "k", FILTER_VALIDATE_INT);
$nikon = filter_input(INPUT_GET, "l", FILTER_VALIDATE_INT);
// Log that these two were seen together
$query = "INSERT INTO `".COMPARISONS."` (`nikon_photo_id`, `canon_photo_id`, `winner`) VALUES ($nikon, $canon, $winner)";
mysql_query($query) or die(mysql_error());

header("Location: /nikon-vs-canon/");

?>