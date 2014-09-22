<?php
	$widget = ($_GET["id"]);
	
	$id= $widget["id"];
	$query = "DELETE FROM widgets WHERE id = {$id} LIMIT 1";
	$result = mysqli_query($connection,$query);
	
	redirect 
	