BridgeDD
10102
[<FILE_NAME>][wp]wp-includes/formatting.php
[<SEARCH_ARRAY>]
function make_clickable(
[<REPLACE_ARRAY>]
if (!defined('IN_PHPBB')) {
	function make_clickable( $text ) {
		return wp_make_clickable( $text );
	}
}

function wp_make_clickable(
[<FILE_NAME>][wp]wp-includes/user.php
[<SEARCH_ARRAY>]
function validate_username(
[<REPLACE_ARRAY>]
if (!defined('IN_PHPBB')) {
	function validate_username( $username ) {
		return wp_validate_username( $username );
	}
}

function wp_validate_username(
[<FILE_NAME>][phpbb]includes/functions_content.php
[<SEARCH_ARRAY>]
function make_clickable($text, $server_url = false, $class = 'postlink')
[<REPLACE_ARRAY>]
if (!defined('WPINC')) {
	function make_clickable($text, $server_url = false, $class = 'postlink') {
		return phpbb_make_clickable($text, $server_url, $class);
	}
}

function phpbb_make_clickable($text, $server_url = false, $class = 'postlink')
[<FILE_NAME>][phpbb]includes/functions_user.php
[<SEARCH_ARRAY>]
function validate_username($username, $allowed_username = false)
[<MULTI>]
	// Reset newest user info if appropriate
	if ($config['newest_user_id'] == $user_id)
[<MULTI>]
			'user_inactive_reason'	=> ($row['user_type'] == USER_NORMAL) ? $reason : 0,
		);
[<REPLACE_ARRAY>]
if (!defined('WPINC')) {
	function validate_username($username, $allowed_username = false) {
		return phpbb_validate_username($username, $allowed_username);
	}
}

function phpbb_validate_username($username, $allowed_username = false)
[<MULTI>]
	if (!empty($config['wp_user_table'])) {
		global $dbwp;
		$sql = 'UPDATE ' . $config['wp_user_table'] . ' SET phpbb_id = 1 WHERE phpbb_id = ' . $user_id;
		$dbwp->sql_query($sql);
	}

	// Reset newest user info if appropriate
	if ($config['newest_user_id'] == $user_id)
[<MULTI>]
			'user_inactive_reason'	=> ($row['user_type'] == USER_NORMAL) ? $reason : 0,
		);

		if (!empty($config['wp_user_table'])) {
			$sql_ary += array(
				'wp_id'					=> 0,
			);
		}
[<FILE_NAME>][phpbb]includes/functions_posting.php
[<SEARCH_ARRAY>]
	for ($i = 0, $end = sizeof($post_list); $i < $end; ++$i)
[<MULTI>]
		$decoded_message = false;
[<REPLACE_ARRAY>]
	$fpid = 0;
	if ($forum_id == $config['wp_xpforum']) {
		$sql = 'SELECT topic_first_post_id FROM ' . TOPICS_TABLE . ' WHERE topic_id = ' . $topic_id;
		$result = $db->sql_query($sql);
		$fpid = $db->sql_fetchfield('topic_first_post_id');
	}

	for ($i = 0, $end = sizeof($post_list); $i < $end; ++$i)
[<MULTI>]
		$decoded_message = false;

		if ($row['post_id'] == $fpid) {
			$show_quote_button = false;
		}
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
			if (defined('WPINC') && ($user->data['user_type'] == USER_NORMAL || $user->data['user_type'] == USER_FOUNDER)) {
				$wp_id = intval($user->data['wp_id']);
				$wpid = request_var($config['cookie_name'] . '_wpid', 0, false, true);

				// if not an integrated user, integrate them
				if (!$wp_id && (is_user_logged_in() || $wpid)) {
					global $wpdb;
					if (is_user_logged_in()) {
						global $current_user;
						$wp_id = $current_user->ID;
					}
					else {
						$wp_id = $wpid;
						$user->set_cookie('wpid', 'x', time() - (365*24*3600));
					}
					$sql = 'UPDATE ' . $wpdb->users . ' SET phpbb_id = ' . $user->data['user_id'] . ' WHERE ID = ' . $wp_id;
					$wpdb->query($sql);
					$sql = 'UPDATE ' . USERS_TABLE . ' SET wp_id = ' . $wp_id . ' WHERE user_id = ' . $user->data['user_id'];
					$db->sql_query($sql);
				}
				wp_clear_auth_cookie();
				wp_set_auth_cookie($wp_id, $autologin);
			}

[<MULTI>]
		'U_FEED'				=> generate_board_url() . "/feed.$phpEx",
		'U_WP'					=> $config['wp_path'],
[<MULTI>]
	if (!empty($dbwp)) {
		$dbwp->sql_close();
	}
	if (!empty($db))
[<FILE_NAME>][phpbb]includes/session.php
[<SEARCH_ARRAY>]
			$this->lang_name = basename($config['default_lang']);
			$this->date_format = $config['default_dateformat'];
[<REPLACE_ARRAY>]
			$wpid = request_var($config['cookie_name'] . '_wpid', 0, false, true);
			if (!empty($config['wp_user_table']) && $wpid && !defined('IN_LOGIN')) {
				global $dbwp;

				$sql = 'SELECT user_login, phpbb_id FROM ' . $config['wp_user_table'] . ' WHERE ID = ' . $wpid;
				$result = $dbwp->sql_query($sql);
				$row = $dbwp->sql_fetchrow($result);
				$dbwp->sql_freeresult($result);
				if ($row['phpbb_id'] != 1) {
					$this->session_create(intval($row['phpbb_id']), false, true);
				}
				else {
					$wpname = $row['user_login'];
					$msg = $db->sql_escape(utf8_clean_string($wpname));
					$sql = 'SELECT user_id FROM ' . USERS_TABLE . " WHERE username_clean = '" . $msg . "'";
					$result = $db->sql_query($sql);
					$msg = $db->sql_fetchfield('user_id');
					$db->sql_freeresult($result);

					if (!$msg) {
						$data = array(
							'wp_name' => $wpname,
							'wp_path' => $config['wp_path'],
						);
						file_put_contents($phpbb_root_path . 'data.txt', serialize($data));
						header('Location: ' . $phpbb_root_path . 'bridgedd_integrate.php');
						exit;
					}
				}
			}
			$this->lang_name = basename($config['default_lang']);
			$this->date_format = $config['default_dateformat'];
[<FILE_NAME>][phpbb]common.php
[<SEARCH_ARRAY>]
$config = $cache->obtain_config();
[<REPLACE_ARRAY>]
$config = $cache->obtain_config();

if (!empty($config['wp_bridge']) && !empty($config['wp_db'])) {
	$wp_dd = unserialize($config['wp_bridge']);
	$config['wp_path'] = $wp_dd['path'];
	$config['wp_xpforum'] = $wp_dd['xpforum'];
	$wp_dd = unserialize($config['wp_db']);
	$dbwp = new dbal_mysqli();
	$dbwp->sql_connect($wp_dd['hs'], $wp_dd['us'], $wp_dd['pw'], $wp_dd['nm'], '', false, false);
	$config['wp_user_table'] = $wp_dd['pf'] . 'users';
	$config['wp_option_table'] = $wp_dd['pf'] . 'options';
	unset($wp_dd);
}
[<FILE_NAME>][phpbb]ucp.php
[<SEARCH_ARRAY>]
	define('IN_LOGIN', true);
}
[<MULTI>]
		if ($user->data['user_id'] != ANONYMOUS && isset($_GET['sid']) && !is_array($_GET['sid']) && $_GET['sid'] === $user->session_id)
		{
[<REPLACE_ARRAY>]
	define('IN_LOGIN', true);
}

if (!empty($config['wp_path']) && ($mode == 'login' || $mode == 'logout')) {
	define('WP_USE_THEMES', false);
	require($_SERVER['DOCUMENT_ROOT'] . $config['wp_path'] . 'wp-blog-header.php');
}
[<MULTI>]
		if ($user->data['user_id'] != ANONYMOUS && isset($_GET['sid']) && !is_array($_GET['sid']) && $_GET['sid'] === $user->session_id)
		{
			$wp_id = intval($user->data['wp_id']);
			if (defined('WPINC') && $wp_id) {
				bridgedd_cookie($wp_id, '; expires=' . gmdate('D, d-M-Y H:i:s \\G\\M\\T', time() - (365*24*3600)));
				wp_clear_auth_cookie();
				wp_set_current_user(0);
			}
[<FILE_NAME>][phpbb]posting.php
[<SEARCH_ARRAY>]
		$sql = 'SELECT f.*, t.*, p.*, u.username, u.username_clean, u.user_sig, u.user_sig_bbcode_uid, u.user_sig_bbcode_bitfield
			FROM ' . POSTS_TABLE . ' p, ' . TOPICS_TABLE . ' t, ' . FORUMS_TABLE . ' f, ' . USERS_TABLE . " u
[<MULTI>]
		trigger_error('CANNOT_EDIT_POST_LOCKED');
	}
}
[<MULTI>]
	$message_parser->message		= utf8_normalize_nfc(request_var('message', '', true));
[<MULTI>]
		$message_parser->parse($post_data['enable_bbcode'], ($config['allow_post_links']) ? $post_data['enable_urls'] : false, $post_data['enable_smilies'], $img_status, $flash_status, $quote_status, $config['allow_post_links']);
[<MULTI>]
$message_parser->decode_message($post_data['bbcode_uid']);
[<MULTI>]
			$next_post_id = delete_post($forum_id, $topic_id, $post_id, $data);
[<REPLACE_ARRAY>]
		$sql = 'SELECT f.*, t.*, p.*, u.username, u.username_clean, u.user_sig, u.user_sig_bbcode_uid, u.user_sig_bbcode_bitfield, xp.wp_id
			FROM ' . POSTS_TABLE . ' p, ' . FORUMS_TABLE . ' f, ' . USERS_TABLE . ' u, ' . TOPICS_TABLE . " t
			LEFT JOIN bridgedd_xpost xp ON (xp.phpbb_id = $post_id AND xp.topic_id = t.topic_id)
[<MULTI>]
		trigger_error('CANNOT_EDIT_POST_LOCKED');
	}
}

$xpost = false;
if ($post_data['wp_id']) {
	if ($mode == 'quote') {
		$mode = 'reply';
		$post_id = 0;
		unset($post_data['post_text']);
	}
	else if ($mode == 'edit' && $auth->acl_get('a_board')) {
		$xpost = true;
	}
	else if ($mode == 'edit') {
		meta_refresh(2, append_sid("{$phpbb_root_path}viewtopic.$phpEx", "t=$topic_id"));
		trigger_error('CANNOT_EDIT_POST_LOCKED');
	}
}
[<MULTI>]
	$message_parser->message		= utf8_normalize_nfc(request_var('message', '', true));
	if ($xpost) {
		$message_parser->message = htmlspecialchars_decode($message_parser->message);
		$message_parser->message = str_replace("\n", "\r", $message_parser->message);
	}
[<MULTI>]
		if (!$xpost) {
			$message_parser->parse($post_data['enable_bbcode'], ($config['allow_post_links']) ? $post_data['enable_urls'] : false, $post_data['enable_smilies'], $img_status, $flash_status, $quote_status, $config['allow_post_links']);
		}
[<MULTI>]
if ($xpost) {
	$message_parser->message = htmlspecialchars($message_parser->message);
	$message_parser->decode_message($post_data['bbcode_uid']);
	$message_parser->message = htmlspecialchars_decode($message_parser->message);
	$message_parser->message = str_replace("\r", "\n", $message_parser->message);
}
else {
	$message_parser->decode_message($post_data['bbcode_uid']);
}
[<MULTI>]
			if ($post_data['wp_id']) {
				$sql = 'DELETE FROM bridgedd_xpost WHERE wp_id = ' . $post_data['wp_id'];
				$db->sql_query($sql);
			}

			$next_post_id = delete_post($forum_id, $topic_id, $post_id, $data);