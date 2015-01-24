=== BridgeDD ===
Contributors: DionDesigns
Donate link: http://diondesigns.org/bridgedd/subscribe/
Tags: bridge,integration,phpbb
Requires at least: 3.5
Tested up to: 4.1
Stable tag: trunk

BridgeDD creates a stable, resource-light bridge between WordPress and phpBB3.

== Description ==

> ### BridgeDD is a WordPress&harr;phpBB bridge that...works. <br />
>
> You can log in and out from WordPress or phpBB as you always do, and you will be automatically logged in/out of both applications. New members in one application become members in the other application just by browsing to that application. There is no need to worry about "integrating" existing members into both applications &mdash; BridgeDD handles it automatically.
> 
> And best of all, the bridging is done using a breakthrough technology that eliminates the bloat, sluggishness, and bugs of other WordPress-based bridge plugins and phpBB-based bridge MODs.
>
> You can obtain support by visiting the [**BridgeDD support board**](http://diondesigns.org/bridgedd/support/index.php)
>
> Those who become a BridgeDD Subscriber will gain access to a private forum where you can download **BridgeDD PRO**, the bridge everyone has been waiting for! You will be able to add your WordPress menus and widgets directly into your phpBB templates *without loading WordPress*, giving you the ability to create an integrated site that looks great and...works.
>
> ### BridgeDD PRO supports phpBB 3.1. <br />

== Installation ==

> Read the [**READ ME FIRST**](http://diondesigns.org/bridgedd/support/viewtopic.php?f=24&t=107) guide before installing BridgeDD!

BridgeDD requires WordPress 3.5 or later, phpBB 3.0.9 - 3.0.13, PHP 5.3.0 or later, and the **mysqli** (Improved MySQL) PHP extension. This extension is bundled into PHP by default, and unless you have disabled it manually, it will be available.

= Installation notes =
BridgeDD modifies phpBB files, and you should take the same precautions before installing BridgeDD as you do before installing a phpBB MOD through AutoMOD.

BridgeDD will create a new directory on your system called **bridgedd**, and it will be at the same directory level as the WordPress **wp-content** directory. This directory will contain files that allow BridgeDD to upgrade you to new versions without the hassles you would encounter when upgrading other bridge plugins.

### Installation instructions <br />

> 1. If a bridge plugin such as _WP-United_ or _wp-phpbb-bridge_ is activated, follow its instructions to **deactivate it**
> 2. **If you have installed the _XCache_ or _eAccelerator_ PHP cache extension, disable it!**
> 3. Upload the _bridgedd.latest.zip_ file via the Install Plugins interface
> 4. Activate the BridgeDD plugin
> 5. Select your phpBB installation in BridgeDD Settings
> 6. Verify that the displayed URL and board preview are correct, and click **Save Changes**
> 7. Select the remaining BridgeDD settings options, and click **Save Changes** again
> 8. Re-enable _XCache_ or _eAccelerator_

== Frequently Asked Questions ==

> The [**READ ME FIRST**](http://diondesigns.org/bridgedd/support/viewtopic.php?t=107) guide contains important information about compatibility of various plugins/MODs/etc with BridgeDD.

= BridgeDD doesn't work. =
The most common cause of problems is trying to activate and configure BridgeDD while cache extensions are active. In order to integrate phpBB with WordPress, BridgeDD makes a number of modifications to the filesystem and database of both phpBB and WordPress. PHP cache extensions such as XCache or eAccelerator can interfere with this process. Please disable these extensions before before activating and configuring BridgeDD. They can be safely enabled after BridgeDD is configured and running.

> You must also disable these cache extensions before you deactivate BridgeDD. <br />
> **OPcache and APC are supported by BridgeDD 1.2.4 and later.**

= I selected my phpBB installation, but the URL and preview for my board are wrong. =
This means that the phpBB settings for your board's URL are incorrect. Since you are already logged in with your admin/founder account, go to the phpBB ACP. Click the **Server Settings** link near the bottom of the left sidebar, and in the **Server URL Settings** block, enter the correct _Domain name_ and _Script path_ for your board and click Submit. Now refresh the BridgeDD Settings page in WordPress, and you should see the correct URL and preview for your phpBB board.

= I selected my phpBB installation, things seem to be OK, but BridgeDD doesn't integrate logins and logouts. =
The WordPress and phpBB installations must be in the same domain, and WordPress must be able to save a cookie that phpBB can read. BridgeDD will not work if, for example, WordPress is installed at **http://mydomain.com** and phpBB is installed at **http://forum.mydomain.com**

### Got more questions?
Ask them at the [**BridgeDD support board**](http://diondesigns.org/bridgedd/support/index.php).

== Changelog ==

= 1.3.4 =
* Bug fix: Access to remote WordPress database results in fatal phpBB error
* New widget: phpBB Login/Logout
* _View the Discussion_ link restored in cross-posted articles

= 1.3.3 =
* Bug fix: Conflict when registration is set to WordPress
* Bug fix: Incorrect button and select/dropdown alignment on RTL languages
* Arabic translation - _by mohamedh_

= 1.3.2 =

* New configuration options available through **bridgedd_config.php** file

= 1.3.1 =

* Bug fix: user profiles not updating properly in WordPress

= 1.3 =

* Cross-post addon included with BridgeDD
* Rewritten settings interface - addons have their own settings panel
* BridgeDD can be completely uninstalled - the first bridge to offer this capability
* Much improved compatibility with Windows IIS servers and WAMP localhost installs
* Brazilian Portuguese translation - _by Juliana Cristine_
* More than 80 bug fixes and code optimizations

= 1.2.7 =

* Improvements to update procedure
* Bug fix: incorrect sync of banned/deactivated users

= 1.2.6 =

* Logins through the login/logout widget will now always redirect to the site home page
* Bug fix: fix PHP error in admin login

= 1.2.5 =

* Minor display enhancements in WordPress admin area
* Bug fix: logins not possible in phpBB if username contained characters invalid in WordPress usernames

= 1.2.4 =

* New download and update procedures
* Added support for APC and OPcache PHP cache extensions
* Fixed bug in login/logout process in phpBB

= 1.2.3 =

* BridgeDD now requires PHP 5.3.0 or later
* Completely rewritten update process
* Includes the Login/Logout widget from BridgeDD Premium
* Passwords can now be changed in phpBB, and the new password will be migrated to WordPress
* All supported translations are now complete (no missing translation strings)
* Eliminated all modifications to WordPress core code
* Reduced memory usage
* Bug fix: Selecting a new phpBB installation without first deactivating BridgeDD would break BridgeDD

= 1.2.2 =

* Fixed issues with GoDaddy (and other) hosting that define selected $_SERVER globals incorrectly
* New update process
* Several bug fixes with translation text

= 1.2.1 =

* Added support for phpBBex and Advanced Block phpBB MOD
* Added support for GoDaddy (and other) hosting that define selected $_SERVER globals incorrectly
* Tapatalk is officially unsupported
* Bug fix: Recent Board Topics widget could be selected when BridgeDD was activated but not configured
* Bug fix: PHP error message displayed when admin bar is active and user is on home page
* Much more detailed FAQ
* Minor bug fixes and display enhancements

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

= 1.3.4 =

The BridgeDD 1.3 major update has arrived on wordpress.org!

= 1.2.7 =

A minor update to prepare for the BridgeDD 1.3 major update

= 1.2.5 =

BridgeDD 1.2.5 fixes a serious bug in phpBB logins. If you have phpBB registration set to allow "any character" in usernames, this is a **mandatory** upgrade!

This is also the final version which will be available through the "brain-dead" plugin auto-update process used here on wordpress.org. From now until forever, the version of BridgeDD which will be displayed in the download button will be 1.2.5. The only way to update BridgeDD will be to use the official update plugin. You will see an update notice on the plugins page when a new version of BridgeDD is available.

= 1.2.4 =

### BridgeDD 1.2.4 is a MANDATORY update!

From this point forward, the only way to update BridgeDD 1.2.3 and earlier will be to download and activate the [**BridgeDD Update Plugin**](https://github.com/wp-plugins/bridgedd/archive/update.zip). If you attempt to update BridgeDD 1.2.3 to any future version of BridgeDD through wordpress.org, **it will potentially corrupt your phpBB installation**.

= 1.2.3 =

BridgeDD 1.2.3 is a signiticant upgrade from previous versions. Those using earlier versions of BridgeDD should immediately update to this version!

= 1.2.2 =

BridgeDD 1.2.2 is a bug fix update. If you use GoDaddy for hosting, this update is mandatory!

= 1.2.1 =

BridgeDD 1.2.1 resolves several compatibility problems (GoDaddy hosting, phpBBex, several phpBB MODs), and fixes a number of bugs.

= 1.2 =

BridgeDD 1.2 uses less memory than previous versions, is easier to configure, and now includes the Recent Board Topics widget from BridgeDD Premium!

== Translations ==

If you have translated this plugin into your language, feel free to post the PO file on the [**BridgeDD support board**](http://diondesigns.org/bridgedd/support/index.php).

The following translations were done by [**FextraLife**](http://fextralife.com): _Spanish, French, German, Japanese, Polish, Portuguese, Italian_

The following translations were done by Maxim Tkachenko: _Russian, Ukranian_

The following translation was done by Juliana Cristine: _Brazilian Portuguese_

The following translation was done by [mohamedh](http://animefn.com): _Arabic_
