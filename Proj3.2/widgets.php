<?
$mysqli = new mysqli("crcp3320db.humanoriented.com", "agarner", "Crcp3320", "agarner");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

echo $mysqli->host_info . "\n";

$results = $mysqli->query("SELECT id, title FROM examples;");

?>

<!DOCTYPE html><!-- HTML5 doctype -->
<html lang = "en-us">
<head>
	<title>Widgets-R-Us</title>
</head>
<body>

<h1>Widgets-R-Us</h1>
<a href="new_widget.php">[+] Add Widget</a>
<!--<p>Widget 1</p>
<p>Widget 2</p> -->

<? while($row = $results->fetch_assoc()) { ?>
<li><?= $row["id"]	. " " . $row["title"]?></li>
<? } ?>
</li>	
</body>
</html>
<?$mysqli->close();?>

