=== BridgeDD ===
Contributors: DionDesigns
Donate link: http://www.diondesigns.org/bridgedd/subscribe/
Tags: bridge,integration,phpbb
Requires at least: 3.5
Tested up to: 3.8.2
Stable tag: 1.2

BridgeDD creates a stable, resource-light bridge between WordPress and phpBB3.

== Description ==

BridgeDD is a WordPress&harr;phpBB bridge that...works.

You can log in and out from WordPress or phpBB as you always do, and you will be automatically logged in/out of both applications. When someone registers to become a member, they automatically become a member of both applications. There is no need to worry about "integrating" existing members into both applications &mdash; BridgeDD handles it automatically.

And best of all, the bridging is done using a breakthrough technology that eliminates the bloat, sluggishness, and bugs of other WordPress-based bridge plugins and phpBB-based bridge MODs.

You can obtain support by visiting the [**BridgeDD support board**](http://www.diondesigns.org/bridgedd/support/index.php) (phpBB, of course!). Becoming a member on the support board will give you access to BridgeDD Premium, an accessory plugin that provides basic cross-posting capabilities as well as a recent-topics widget. Members can also ask support questions.

Those who become a BridgeDD Subscriber will gain access to a private forum where you can download **BridgeDD PRO**, the bridge everyone has been waiting for! You will be able to add your WordPress header, footer, and widgets directly into your phpBB templates *without loading WordPress*, giving you the ability to create a lightweight, seamless bridge.

== Installation ==

1. Upload the _bridgedd.zip_ file via the Install Plugins interface
2. If you have installed a PHP cache extension such as _APC_, _OPcache_, or _XCache_, temporarily disable it
3. If a bridge plugin such as _WP-United_ or _wp-phpbb-bridge_ is activated, deactivate it
4. In a separate tab/window, log in to phpBB with your admin/founder account
5. Activate the BridgeDD plugin
6. Select your phpBB installation in BridgeDD Settings
7. Verify that the displayed URL and board preview are correct, and click **Save Changes**
8. Select the remaining BridgeDD settings options, and click **Save Changes** again
9. Close the tab/window to phpBB
10. Re-enable your PHP cache entension

== Frequently Asked Questions ==

= What are the known compatibility issues? =
There are two known compatibility issues.

The first is Tapatalk. Tapatalk installs its own PHP code and completely bypasses the phpBB code. This is why Tapatalk doesn't support phpBB MODS and a number of built-in phpBB features. (It is also why you lose all ad revenue from Tapatalk users if your phpBB boards contains ads.) Since a bridge application must load at least a part of phpBB, there will always be a compatibility issue with Tapatalk. Please consider using a mobile/responsive phpBB theme instead of Tapatalk. If Tapatalk is installed, **install BridgeDD at your own risk**.

The second is themes from RocketTheme. These themes are designed for integrating with Joomla, not WordPress, and they are well known for their compatibility issues with phpBB MODS. If you are using a RocketTheme theme, please visit the [**BridgeDD support board**](http://www.diondesigns.org/bridgedd/support/index.php) for information on how to resolve the compatibility issues.

= BridgeDD doesn't work. Why? =
The most common cause of problems is trying to activate and configure BridgeDD while cache programs are active. In order to integrate phpBB with WordPress, BridgeDD makes a number of modifications to the filesystem and database of both phpBB and WordPress. Cache programs such as APC, OPcache, or XCache can interfere with this process. Please disable these programs before before activating and configuring BridgeDD. They can be safely enabled after BridgeDD is configured and running.

= I selected my phpBB installation, but the URL and preview for my board are wrong. =
This means that the settings for your phpBB board's URL are incorrect. Since you are already logged in with your admin/founder account, go to the phpBB ACP. Click the **Server Settings** link near the bottom of the left sidebar, and in the **Server URL Settings** block, enter the correct _Domain name_ and _Script path_ for your board and click Submit. Now refresh the BridgeDD Settings page in WordPress, and you should see the correct URL and preview for your phpBB board.

= I selected my phpBB installation, things seem to be OK, but BridgeDD doesn't integrate logins and logouts. =
The WordPress and phpBB installations must be in the same domain, and WordPress must be able to save a cookie that phpBB can read. BridgeDD will not work if, for example, WordPress is installed at **http://mydomain.com** and phpBB is installed at **http://forum.mydomain.com**

= Got more questions? =
Ask them at the [**BridgeDD support board**](http://www.diondesigns.org/bridgedd/support/index.php).

== Changelog ==

= 1.2 =

* Completely rewritten session integration, resulting in less memory usage and greater compatibility with WordPress plugins and phpBB MODS
* Greatly improved method to select a phpBB installation
* Includes the Recent Board Topics widget from BridgeDD Premium
* Cleaned-up user interface
* Russian and Ukranian translations - _by Maxim Tkachenko_
* Numerous small bug fixes

= 1.1.2 =

First publicly-available version.
Spanish, French, German, Japanese, Polish, Portuguese, and Italian translations - _by [**FextraLife**](http://fextralife.com)_

== Upgrade Notice ==

= 1.2 =

Bridgedd 1.2 uses less memory than previous versions, is easier to configure, and now includes the Recent Board Topics widget from BridgeDD Premium!

== Translations ==

If you have translated this plugin into your language, feel free to post the PO file on the [**BridgeDD support board**](http://www.diondesigns.org/bridgedd/support/index.php).

The following translations were done by [**FextraLife**](http://fextralife.com):
_Spanish, French, German, Japanese, Polish, Portuguese, Italian_

The following translations were done by Maxim Tkachenko:
_Russian, Ukranian_
