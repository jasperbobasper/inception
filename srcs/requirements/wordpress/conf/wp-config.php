<?php

$db_name = getenv('$MARIADB_DATABASE');
$db_user = getenv('$MARIADB_USER');
$db_password = getenv('$MARIADB_PASSWORD');

var_dump($db_name, $db_user, $db_password);

define('DB_NAME', getenv('MARIADB_DATABASE'));
define('DB_USER', getenv('MARIADB_USER'));
define('DB_PASSWORD', getenv('MARIADB_PASSWORD'));
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

require_once(ABSPATH . 'wp-settings.php');

define('AUTH_KEY',		getenv('AUTH_KEY'));
define('SECURE_AUTH_KEY',	getenv('SECURE_AUTH_KEY'));
define('LOGGED_IN_KEY',		getenv('LOGGED_IN_KEY'));
define('NONCE_KEY',		getenv('NONCE_KEY'));
define('AUTH_SALT',		getenv('AUTH_SALT'));
define('SECURE_AUTH_SALT',	getenv('SECURE_AUTH_SALT'));
define('LOGGED_IN_SALT',	getenv('LOGGED_IN_SALT'));
define('NONCE_SALT',		getenv('NONCE_SALT'));

$table_prefix  = getenv('WORDPRESS_TABLE_PREFIX');