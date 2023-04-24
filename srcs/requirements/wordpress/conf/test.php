<?php
$link = mysqli_connect('127.0.0.1', 'jpfannku', 'Inception42');
if (!$link) {
die('Could not connect: ');
}
echo 'Connected successfully';
mysqli_close($link);
?>