<?php
/*
Plugin Name: BridgeDD
Plugin URI: http://www.diondesigns.org/bridgedd/
Version: 1.1.2
Author: Dion Designs
Author URI: http://www.dion-designs.com
Text Domain: bridgedd
Domain Path: /languages/
Description: Creates a bridge between phpBB and WordPress
*/
if (!defined('WPINC')) {
	exit;
}

define('BRIDGEDD', 10102);
require('bridgedd.plugin');
register_activation_hook(__FILE__, 'bridgedd_activate');
register_deactivation_hook(__FILE__, 'bridgedd_deactivate');
?>
