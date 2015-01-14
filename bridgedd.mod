All code in this file is used by phpBB and not by WordPress!

[<FILE_NAME>][phpbb]includes/functions_content.php
[<SEARCH_ARRAY>]
function make_clickable($text, $server_url = false, $class = 'postlink')
[<REPLACE_ARRAY>]
if (!defined('WPINC') && !defined('USING_WP')) {
	function make_clickable($text, $server_url = false, $class = 'postlink') {
		return phpbb_make_clickable($text, $server_url, $class);
	}
}

function phpbb_make_clickable($text, $server_url = false, $class = 'postlink')
[<FILE_NAME>][phpbb]includes/acp/acp_users.php
[<SEARCH_ARRAY>]
							add_log('user', $user_id, 'LOG_USER_NEW_PASSWORD', $user_row['username']);
[<REPLACE_ARRAY>]
							$sql = 'SELECT wp_id FROM bridgedd_xuser WHERE phpbb_id = ' . $user_id;
							$result = $db->sql_query($sql);
							$wp_id = (int) $db->sql_fetchfield('wp_id');
							$db->sql_freeresult($result);
							if ($wp_id) {
								global $dbwp;
								$sql = 'UPDATE ' . $config['wp_user_table'] . " SET user_pass = '" . $sql_ary['user_password'] . "' WHERE ID = " . $wp_id;
								$dbwp->sql_query($sql);
							}
							add_log('user', $user_id, 'LOG_USER_NEW_PASSWORD', $user_row['username']);
[<FILE_NAME>][phpbb]includes/ucp/ucp_profile.php
[<SEARCH_ARRAY>]
							add_log('user', $user->data['user_id'], 'LOG_USER_NEW_PASSWORD', $data['username']);
[<REPLACE_ARRAY>]
							$sql = 'SELECT wp_id FROM bridgedd_xuser WHERE phpbb_id = ' . $user->data['user_id'];
							$result = $db->sql_query($sql);
							$wp_id = (int) $db->sql_fetchfield('wp_id');
							$db->sql_freeresult($result);
							if ($wp_id) {
								global $dbwp;
								$sql = 'UPDATE ' . $config['wp_user_table'] . " SET user_pass = '" . $sql_ary['user_password'] . "' WHERE ID = " . $wp_id;
								$dbwp->sql_query($sql);
							}
							add_log('user', $user->data['user_id'], 'LOG_USER_NEW_PASSWORD', $data['username']);
[<FILE_NAME>][phpbb]includes/ucp/ucp_activate.php
[<SEARCH_ARRAY>]
			add_log('user', $user_row['user_id'], 'LOG_USER_NEW_PASSWORD', $user_row['username']);
[<REPLACE_ARRAY>]
			$sql = "SELECT wp_id FROM bridgedd_xuser WHERE phpbb_id = {$user_row['user_id']}";
			$result = $db->sql_query($sql);
			$wp_id = $db->sql_fetchfield('wp_id');
			$db->sql_freeresult($result);
			if ($wp_id) {
				global $dbwp;
				$sql = "UPDATE {$config['wp_user_table']} SET user_pass = '{$user_row['user_newpasswd']}' WHERE ID = $wp_id";
				$dbwp->sql_query($sql);
			}

			add_log('user', $user_row['user_id'], 'LOG_USER_NEW_PASSWORD', $user_row['username']);
[<FILE_NAME>][phpbb]includes/ucp/ucp_register.php
[<SEARCH_ARRAY>]
					array('username', '')),
[<MULTI>]
			$cp->submit_cp_field('register', $user->get_iso_lang_id(), $cp_data, $error);
[<MULTI>]
				if ($coppa && $config['email_enable'])
[<REPLACE_ARRAY>]
					array('phpbb_username', '')),
[<MULTI>]
			$cp->submit_cp_field('register', $user->get_iso_lang_id(), $cp_data, $error);

			if (!sizeof($error)) {
				define('WP_INSTALLING', $phpbb_root_path);
				require($config['wp_abspath'] . 'wp-load.php');
				$phpbb_root_path = WP_INSTALLING;
				$table_prefix = PHPBB_PREFIX;

				if (!sanitize_title($data['username'])) {
					$error[] = $user->lang['INVALID_CHARS'];
				}
				else if (username_exists($data['username'])) {
					$error[] = $user->lang['USERNAME_TAKEN'];
				}
				if (email_exists($data['email'])) {
					$error[] = $user->lang['EMAIL_TAKEN'];
				}
			}
[<MULTI>]
				add_filter('sanitize_user', 'bridgedd_approve_username', 999, 2);
				$userdata = array(
					'user_login'			=> $data['username'],
					'user_pass'				=> '',
					'user_email'			=> '',
				);
				$wp_id = wp_insert_user($userdata);
				$wp_password = ($user_actkey) ? '' : phpbb_hash($data['new_password']);
				$wp_email = ($user_actkey) ? phpbb_hash($data['new_password']) : $data['email'];

				global $dbwp;
				$sql = "UPDATE {$config['wp_user_table']} SET user_pass = '{$wp_password}', user_email = '{$wp_email}' WHERE ID = $wp_id";
				$dbwp->sql_query($sql);

				$sql = "INSERT INTO bridgedd_xuser VALUES ({$wp_id},{$user_id})";
				$db->sql_query($sql);

				if ($coppa && $config['email_enable'])
[<FILE_NAME>][phpbb]includes/functions_user.php
[<SEARCH_ARRAY>]
function validate_username($username, $allowed_username = false)
[<MULTI>]
	// Delete the user_id from the zebra table
[<MULTI>]
	$sql = 'SELECT user_id, group_id, user_type, user_inactive_reason
		FROM ' . USERS_TABLE . '
		WHERE ' . $db->sql_in_set('user_id', $user_id_ary);
[<MULTI>]
			$activated++;
		}
		else
		{
			$deactivated++;
[<MULTI>]
	if (sizeof($sql_statements))
[<REPLACE_ARRAY>]
if (!defined('WPINC') && !defined('USING_WP')) {
	function validate_username($username, $allowed_username = false) {
		return validate_phpbb_username($username, $allowed_username);
	}
}

function validate_phpbb_username($username, $allowed_username = false)
[<MULTI>]
	$sql = 'DELETE FROM bridgedd_xuser WHERE phpbb_id = ' . $user_id;
	$db->sql_query($sql);

	// Delete the user_id from the zebra table
[<MULTI>]
	global $dbwp;
	$wp_sql_ary = array();
	$sql = 'SELECT xu.wp_id, u.user_email, u.user_id, u.group_id, u.user_type, u.user_inactive_reason
		FROM ' . USERS_TABLE . ' u
		LEFT JOIN bridgedd_xuser xu ON (xu.phpbb_id = u.user_id)
		WHERE ' . $db->sql_in_set('u.user_id', $user_id_ary);
[<MULTI>]
			$activated++;
			if (!empty($row['wp_id'])) {
				$wp_sql_ary[] = "UPDATE {$config['wp_user_table']} SET user_pass = user_email, user_email = '{$row['user_email']}' WHERE ID = {$row['wp_id']}";
			}
		}
		else
		{
			$deactivated++;
			if (!empty($row['wp_id'])) {
				$wp_sql_ary[] = "UPDATE {$config['wp_user_table']} SET user_email = user_pass, user_pass = '' WHERE ID = {$row['wp_id']}";
			}
[<MULTI>]
	if (!empty($wp_sql_ary)) {
		foreach ($wp_sql_ary as $sql) {
			$dbwp->sql_query($sql);
		}
	}

	if (sizeof($sql_statements))
[<FILE_NAME>][phpbb]includes/functions_admin.php
[<SEARCH_ARRAY>]
	$table_ary = array(BOOKMARKS_TABLE, TOPICS_TRACK_TABLE, TOPICS_POSTED_TABLE, POLL_VOTES_TABLE, POLL_OPTIONS_TABLE, TOPICS_WATCH_TABLE, TOPICS_TABLE);
[<MULTI>]
	$db->sql_transaction('begin');

	$table_ary = array(POSTS_TABLE, REPORTS_TABLE);
[<REPLACE_ARRAY>]
	$table_ary = array(BOOKMARKS_TABLE, TOPICS_TRACK_TABLE, TOPICS_POSTED_TABLE, POLL_VOTES_TABLE, POLL_OPTIONS_TABLE, TOPICS_WATCH_TABLE, TOPICS_TABLE, 'bridgedd_xpost');
[<MULTI>]
	$sql = 'DELETE FROM bridgedd_xpost WHERE ' . $db->sql_in_set('phpbb_id', $post_ids);
	$db->sql_query($sql);

	$db->sql_transaction('begin');

	$table_ary = array(POSTS_TABLE, REPORTS_TABLE);
[<FILE_NAME>][phpbb]includes/functions.php
[<SEARCH_ARRAY>]
		// The result parameter is always an array, holding the relevant information...
		if ($result['status'] == LOGIN_SUCCESS)
		{
[<MULTI>]
		'U_FEED'				=> generate_board_url() . "/feed.$phpEx",
[<MULTI>]
	if (!empty($db))
[<REPLACE_ARRAY>]
		// The result parameter is always an array, holding the relevant information...
		if ($result['status'] == LOGIN_SUCCESS)
		{
			if (!empty($config['wp_path']) && !$admin && ($user->data['user_type'] == USER_NORMAL || $user->data['user_type'] == USER_FOUNDER)) {
				$sql = 'SELECT wp_id FROM bridgedd_xuser WHERE phpbb_id = ' . $user->data['user_id'];
				$result2 = $db->sql_query($sql);
				$wp_id = (int) $db->sql_fetchfield('wp_id');
				$db->sql_freeresult($result2);

				// if not an integrated user, integrate them
				if (!$wp_id && is_user_logged_in()) {
					global $current_user;
					$wp_id = $current_user->ID;
					$sql = "INSERT INTO bridgedd_xuser VALUES({$wp_id},{$user->data['user_id']})";
					$db->sql_query($sql);
					wp_clear_auth_cookie();
					wp_set_auth_cookie($wp_id, $autologin);
				}
			}

[<MULTI>]
		'U_FEED'				=> generate_board_url() . "/feed.$phpEx",
		'U_WP'					=> $config['wp_url'],
[<MULTI>]
	if (!empty($dbwp)) {
		$dbwp->sql_close();
	}
	if (!empty($db))
[<FILE_NAME>][phpbb]includes/session.php
[<SEARCH_ARRAY>]
			$sql = 'SELECT u.*, s.*
				FROM ' . SESSIONS_TABLE . ' s, ' . USERS_TABLE . " u
[<MULTI>]
			$sql = 'SELECT u.*
				FROM ' . USERS_TABLE . ' u, ' . SESSIONS_KEYS_TABLE . ' k
[<MULTI>]
			$this->cookie_data['u'] = $user_id;

			$sql = 'SELECT *
				FROM ' . USERS_TABLE . '
[<REPLACE_ARRAY>]
			$sql = 'SELECT xu.wp_id, u.*, s.*
				FROM ' . SESSIONS_TABLE . ' s, ' . USERS_TABLE . " u
				LEFT JOIN bridgedd_xuser xu ON (xu.phpbb_id = u.user_id)
[<MULTI>]
			$sql = 'SELECT xu.wp_id, u.*
				FROM ' . USERS_TABLE . ' u, ' . SESSIONS_KEYS_TABLE . ' k
				LEFT JOIN bridgedd_xuser xu ON (xu.phpbb_id = k.user_id)
[<MULTI>]
			$this->cookie_data['u'] = $user_id;

			$sql = 'SELECT xu.wp_id, u.*
				FROM ' . USERS_TABLE . ' u
				LEFT JOIN bridgedd_xuser xu ON (xu.phpbb_id = u.user_id)
[<FILE_NAME>][phpbb]common.php
[<SEARCH_ARRAY>]
$config = $cache->obtain_config();
[<REPLACE_ARRAY>]
$config = $cache->obtain_config();

if (!empty($config['wp_bridge']) && !empty($config['wp_db'])) {
	@ini_set('open_basedir', '');
	define('SERVER_DOCUMENT_ROOT', substr(getenv('SCRIPT_FILENAME'), 0, strpos(getenv('SCRIPT_FILENAME'), getenv('SCRIPT_NAME'))));
	define('PHPBB_PREFIX', $table_prefix);
	$wp_dd = unserialize($config['wp_bridge']);
	$config['wp_url'] = $wp_dd['path'];
	$config['wp_path'] = substr($config['wp_url'], strpos($config['wp_url'], '//') + 2);
	$config['wp_path'] = substr($config['wp_path'], strpos($config['wp_path'], '/'));
	$config['wp_prefix'] = $wp_dd['pf'];
	$config['wp_user_table'] = $wp_dd['pf'] . 'users';
	$config['wp_option_table'] = $wp_dd['pf'] . 'options';
	$wp_dd = unserialize($config['wp_db']);
	$host = $wp_dd['hs'];
	$port = '';
	if (strpos($host, ':')) {
		list($host, $port) = explode(':', $host);
	}
	include_once($phpbb_root_path . 'includes/db/mysqli.' . $phpEx);
	$dbwp = new dbal_mysqli();
	$dbwp->sql_connect($host, $wp_dd['us'], $wp_dd['pw'], $wp_dd['nm'], $port, false, false);
	unset($wp_dd);

	function bridgedd_approve_username($garbage, $username) {
		return $username;
	}
}
[<FILE_NAME>][phpbb]ucp.php
[<SEARCH_ARRAY>]
require($phpbb_root_path . 'common.' . $phpEx);
[<MULTI>]
		login_box(request_var('redirect', "index.$phpEx"));
[<MULTI>]
		if ($user->data['user_id'] != ANONYMOUS && isset($_GET['sid']) && !is_array($_GET['sid']) && $_GET['sid'] === $user->session_id)
		{
[<REPLACE_ARRAY>]

if (isset($_REQUEST['mode']) && ($_REQUEST['mode'] == 'login' || $_REQUEST['mode'] == 'logout' || $_REQUEST['mode'] == 'register')) {
	define('USING_WP', true);
}

require($phpbb_root_path . 'common.' . $phpEx);
[<MULTI>]
		if(!request_var('bridgedd', '')) {
			define('WP_INSTALLING', $phpbb_root_path);
			require_once($config['wp_abspath'] . 'wp-load.php');
			$phpbb_root_path = WP_INSTALLING;
			$table_prefix = PHPBB_PREFIX;
			global $current_user;
			if (is_user_logged_in() && !validate_phpbb_username($current_user->user_login) && !validate_email($current_user->user_email)) {
				header('Location: ' . $config['wp_url'] . 'index.php?bridgedd=true');
				exit;
			}
		}

		login_box(request_var('redirect', "index.$phpEx"));
[<MULTI>]
		if ($user->data['user_id'] != ANONYMOUS && isset($_GET['sid']) && !is_array($_GET['sid']) && $_GET['sid'] === $user->session_id)
		{
			$sql = 'SELECT wp_id FROM bridgedd_xuser WHERE phpbb_id = ' . $user->data['user_id'];
			$result = $db->sql_query($sql);
			$wp_id = (int) $db->sql_fetchfield('wp_id');
			$db->sql_freeresult($result);
			if (!empty($config['wp_path']) && $wp_id) {
				define('WP_INSTALLING', $phpbb_root_path);
				require_once($config['wp_abspath'] . 'wp-load.php');
				$phpbb_root_path = WP_INSTALLING;
				$table_prefix = PHPBB_PREFIX;
				wp_clear_auth_cookie();
				$user->set_cookie('wpid', 'x', time() - (365*24*3600));
			}
