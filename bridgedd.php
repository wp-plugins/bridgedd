<?php
/*
Plugin Name: BridgeDD
Plugin URI: http://diondesigns.org/bridgedd/
Version: 1.3.10
Author: Dion Designs
Author URI: http://dion-designs.com
Text Domain: bridgedd
Domain Path: /languages/
Description: Creates a bridge between phpBB and WordPress
*/
if (!defined('WPINC')) {
	die('ERROR 000');
}

@ini_set('open_basedir', '');
define('BRIDGEDD', 10310);
define('BDD_MIN', '.min');
define('BDD_SEP', (defined('DIRECTORY_SEPARATOR') && DIRECTORY_SEPARATOR != '') ? DIRECTORY_SEPARATOR : '/');
require(dirname(__FILE__) . BDD_SEP . 'bridgedd_driver' . BDD_MIN . '.addon');
register_activation_hook(__FILE__, 'bridgedd_activate');
register_deactivation_hook(__FILE__, 'bridgedd_deactivate');
register_uninstall_hook(__FILE__, 'bridgedd_uninstall');
