<?php
/*
Plugin Name: BridgeDD Update
Plugin URI: http://www.diondesigns.org/bridgedd/support/
Version: 1.2.4
Author: Dion Designs
Author URI: http://www.dion-designs.com
Description: BridgeDD 1.2.4 Update
*/
if (!defined('WPINC')) {
	exit;
}

define('BRIDGEDD_UPDATE', 10204);

function bridgedd_update_copy_files($source = false) {
	if ($source) {
		$target = str_replace('/bridgedd-update/', '/bridgedd/', $source);
		if (is_dir($source)) {
			if (!is_dir($target)) {
				mkdir($target);
			}
			$files = glob($source . '/*');
			foreach($files as $file) {
				bridgedd_update_copy_files($file);
			}
		}
		else {
			copy($source, $target);
		}
	}
}

function bridgedd_update_delete_files($target = false) {
	if ($target) {
		if (is_dir($target)) {
			$files = glob($target . '/*');
			foreach($files as $file) {
				bridgedd_update_delete_files($file);
			}
			rmdir($target);
		}
		else {
			@unlink($target);
		}
	}
}

function bridgedd_update_cache_reset() {
	if (function_exists('apc_clear_cache')) {
		apc_clear_cache();
	}
	else if (function_exists('opcache_reset')) {
		opcache_reset();
	}
}

function bridgedd_update_check() {
	global $phpbb_path;

	$active = get_option('active_plugins');
	$key = array_search('bridgedd-update/bridgedd-update.php', $active);
	unset($active[$key]);
	update_option('active_plugins', $active);

	if (defined('BRIDGEDD') && BRIDGEDD >= 10200 && BRIDGEDD <= BRIDGEDD_UPDATE && $phpbb_path) {
		bridgedd_modfiles('uninstall', WP_PLUGIN_DIR . '/bridgedd/bridgedd.mod');
		bridgedd_update_cache_reset();
	}
	else {
		wp_die('<div style="text-align:center"><div style="color:#600;font-size:17px;line-height:24px">Your version of BridgeDD is not active, or it is incompatible with this upgrade. Please contact Dion Designs on the <a href="http://diondesigns.org/bridgedd/support/index.php"><strong>BridgeDD Support Board</strong></a> for assistance.</div><br /><br /><a class="button" href="plugins.php">' . sprintf(__('&larr; Back to %s'), __('Plugins')) . '</a></div>');
	}

	if (!defined('BRIDGEDD_PATH')) {
		define('BRIDGEDD_PATH', ABSPATH . 'bridgedd');
		mkdir(BRIDGEDD_PATH);
	}

	@copy(dirname(__FILE__) . '/bridgedd_check.min.dd', BRIDGEDD_PATH . '/bridgedd_check.php');
	@copy(dirname(__FILE__) . '/bridgedd_integrate.dd', $phpbb_path . 'bridgedd_integrate.php');
	@copy(dirname(__FILE__) . '/xpost_min.dd', $phpbb_path . 'xpost.php');

	if (defined('BRIDGEDD_PREMIUM')) {
		@copy(dirname(__FILE__) . '/bridgedd-premium.dd', dirname(__FILE__) . '/bridgedd.php');
	}
	else {
		@copy(dirname(__FILE__) . '/bridgedd.dd', dirname(__FILE__) . '/bridgedd.php');
	}
	@unlink(dirname(__FILE__) . '/bridgedd.dd');
	@unlink(dirname(__FILE__) . '/bridgedd-premium.dd');

	bridgedd_modfiles('install', dirname(__FILE__) . '/bridgedd.mod');

	bridgedd_update_copy_files(dirname(__FILE__));
	bridgedd_update_delete_files(dirname(__FILE__));
	@unlink(WP_PLUGIN_DIR . '/bridgedd/bridgedd-update.php');
	@unlink(WP_PLUGIN_DIR . '/bridgedd/bridgedd_widgets.addon');
	bridgedd_update_cache_reset();

	$delete_ary = get_option('bridgedd_delete');
	if (!$delete_ary) {
		$delete_ary = array();
	}
	$delete_ary[] = array('f', __FILE__);
	$delete_ary[] = array('d', dirname(__FILE__));

	update_option('bridgedd_delete', $delete_ary);
	update_option('bridgedd', strval(BRIDGEDD_UPDATE));

	header('Location: plugins.php');
	exit;
}

add_action('plugins_loaded', 'bridgedd_update_check');
?>
