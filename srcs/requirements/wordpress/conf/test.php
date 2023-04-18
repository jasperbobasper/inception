<?php
$link = mysqli_connect('127.0.0.1', 'root', '42Born2Code');
if (!$link) {
die('Could not connect: ' . mysqli_error());
}
echo 'Connected successfully';
mysqli_close($link);
?>