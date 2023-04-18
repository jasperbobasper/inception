<?php

$env_vars = parse_ini_file('/tmp/env_vars');

// $db_name = $env_vars['MARIADB_DATABASE'];
// $db_user = $env_vars['MARIADB_USER'];
// $db_password = $env_vars['MARIADB_PASSWORD'];

// var_dump($db_name, $db_user, $db_password);

define('DB_NAME', 'wordpress' );
// print "here is the db name:";
// print DB_NAME;
define('DB_USER', 'jpfannku' );
// print "here is the db user:";
// print DB_USER;
define('DB_PASSWORD', 'Inception42' );
// print "here is the db password:";
// print DB_PASSWORD;
define('DB_HOST', '127.0.0.1');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once(ABSPATH . 'wp-settings.php');

// define('AUTH_KEY',		$env_vars['AUTH_KEY'] );
// define('SECURE_AUTH_KEY',	$env_vars['SECURE_AUTH_KEY'] );
// define('LOGGED_IN_KEY',		$env_vars['LOGGED_IN_KEY'] );
// define('NONCE_KEY',		$env_vars['NONCE_KEY'] );
// define('AUTH_SALT',		$env_vars['AUTH_SALT'] );
// define('SECURE_AUTH_SALT',	$env_vars['SECURE_AUTH_SALT'] );
// define('LOGGED_IN_SALT',	$env_vars['LOGGED_IN_SALT'] );
// define('NONCE_SALT',		$env_vars['NONCE_SALT'] );

//$table_prefix  = $env_vars['WORDPRESS_TABLE_PREFIX'];

?>
