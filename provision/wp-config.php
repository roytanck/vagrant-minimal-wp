<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wp');

/** MySQL database username */
define('DB_USER', 'wpuser');

/** MySQL database password */
define('DB_PASSWORD', '12345678');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'qDw=UR%q)4MLPDqF*a^Dugct%qX36[uVfi<Y}+Wfr;{@+mAdfSnWaI9T]k)Clxx!');
define('SECURE_AUTH_KEY',  '(8 @&ud>i}8D{n[X{%=.qcb}mbfJ/MYPY$/6<0}<xygk<6e^J*Crta{J/p@UG_s=');
define('LOGGED_IN_KEY',    ' 7W-oq(E4S9yt}8*@jo=A8),Lh@y+TZF4/J0o?uCgZS%@k=}[Wz)WFdhZ~4^B^qz');
define('NONCE_KEY',        'JG+~3|-!qwF@mJ8v2a0nCI?TMM-,&`P0>F%n?U_=M^r?!RB!2X4N6.F-qo2.v#(>');
define('AUTH_SALT',        'J,GoQDls gSuler:vKcsBH96mOUaZEfhi&1x;B:zP17@qZ6w_P=^)M4e)u%6}+LV');
define('SECURE_AUTH_SALT', '{Lz9+ir9p0M^Z=8!U&sl1j~H:=+e+!AB:Xi5.g%a>0<,q;Gjwux$kfLI{x-AKSZ=');
define('LOGGED_IN_SALT',   'fzZSLX]W,}Wa:eeEN<fkO+YRV ~~}C]4#ko-=^S7br f*I|r*eL7as~w@C#`gt>T');
define('NONCE_SALT',       'A5CnTc68j-dmoKIU4Trk]q#:}Yt.bzG;8#L[vl)~n)@PVzYj*u;]M%J4WVDkO:7d');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
