<?php
/*
	BridgeDD Configuration Data
	Copyright � 2014 by Dion Designs.
	All Rights Reserved.
*/
if (!defined('BRIDGEDD')) {
	die('ERROR 001');
}
/**/
/*
	If you have an established WordPress site and have just installed phpBB,
	use 'phpbb' instead of false, as shown below. Your WordPress users will
	be automatically integrated when they first visit your new	phpBB board.

define('BRIDGEDD_AUTO_INTEGRATE', 'phpbb');

	If you have an established phpBB board and have just installed WordPress,
	use 'wp' instead of false, as shown below. Your phpBB users will be
	automatically integrated when they first visit your new WordPress site.

define('BRIDGEDD_AUTO_INTEGRATE', 'wp');

	If you have established WordPress and phpBB boards, DO NOT change this
	option! Your members will see ominous error messages and may not be able
	to access one (or both) of your sites. YOU HAVE BEEN WARNED!!!
*/
define('BRIDGEDD_AUTO_INTEGRATE', false);

/*
	This option sets the number of words to display in cross-post excerpts.
	Minimum value is 50, maximum is 250.
*/
define('XPOST_EXCERPT_LENGTH', 100);

/*
	This option sets the name in the login/logout widget for the admin area.
	The default is 'Dashboard', enabled for translation. It can also be set to
	'Site Admin'. If your selected language is not English, use the form
	__('Site Admin') to have the string translated to your language.
*/
define('DASHBOARD_NAME', __('Dashboard'));