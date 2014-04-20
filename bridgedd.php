<?php
/*
Plugin Name: BridgeDD
Plugin URI: http://www.diondesigns.org/bridgedd/
Version: 1.2.1
Author: Dion Designs
Author URI: http://www.dion-designs.com
Text Domain: bridgedd
Domain Path: /languages/
Description: Creates a bridge between phpBB and WordPress
*/
if (!defined('WPINC')) {
	exit;
}

if (!defined('IN_BRIDGEDD')) {
	define('BRIDGEDD', 10201);
	@ini_set('open_basedir', '');
	require(dirname(__FILE__) . '/bridgedd.min.plugin');
	register_activation_hook(__FILE__, 'bridgedd_activate');
	register_deactivation_hook(__FILE__, 'bridgedd_deactivate');
}
?>
