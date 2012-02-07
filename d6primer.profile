<?php

/**
 * @file
 *
 * An install profile for Primer theme based drupal 6 sites
 */

include_once('d6primer.tinymce.inc');
include_once('d6primer.permissions.inc');
include_once('d6primer.users.inc');
include_once('d6primer.nodewords.inc');
include_once('d6primer.backup_migrate.inc');

/**
 * Returns a description of the profile for the initial installation screen
 *
 * @return
 *  An array with keys 'name' and 'description' describing this profile,
 *  and optional 'language' to override the language selection for
 *  language specific profiles.
 */
function d6primer_profile_details() {
  return array(
    'name' => 'NC State Primer Theme Drupal 6 Website',
    'description' => 'An install profile for Primer theme based drupal 6 sites',
  );
}


/**
 * Returns an array of modules that should be enabled by default
 *
 * @return
 *  An array of modules to enable.
 */
function d6primer_profile_modules() {
  $core_modules = array(
    'block',
    'contact',
    'dblog',
    'help',
    'menu',
    'node',
    'path',
    'search',
    'system',
    'taxonomy',
    'upload',
    'user',
	'filter', 
  );
  $contrib_modules = array(
    'admin_menu',
  	'adminrole',
    'auto_nodetitle',
    'backup_migrate',
    'block_access',
    'captcha',
    'content',
    'css_injector',
    'ctools',
    'extlink',
    'features',
    'image_attach',
    'image',
    'imageapi_gd',
    'imageapi',
    'imagecache_ui',
    'imagecache',
    'imce_mkdir',
    'imce_wysiwyg',
    'imce',
    'libraries',
    'masquerade',
    'menu_block',
    'menu_breadcrumb',
    'nodewords_basic',
    'nodewords_tokens',
    'nodewords_ui',
    'nodewords',
    'path_redirect',
    'pathauto',
    'recaptcha',
  	'role_delegation',
  	'shadowbox',
  	'strongarm',
    'taxonomy',
  	'token',
    'vertical_tabs',
    'views',
  	'views_ui',
    'webform',
  	'webform_validation',
  	'wysiwyg',
  );
  $custom_modules = array(
  	'ncstatebrandingbar',
  	'ncsuphplibrary',  
    'ncsuroles',
  	'wraplogin',
  	'primer_home_page_slider',
  );
  return array_merge($core_modules, $contrib_modules, $custom_modules);
}

/**
 * List tasks that this profile supports
 *
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function d6primer_profile_task_list() {
  return array(
    'task_configure_theme' => st('Configure Theme'),
  	'task_configure_editor' => st('Configure Editor'),
  	'task_configure_variables' => st('Configure Variables'),
  	'task_configure_users' => st('Configure Users'),
  	'task_configure_nodewords' => st('Configure Nodewords'),
	'task_configure_contact' => st('Configure Contact Form'),
    'task_configure_captcha' => st('Configure Captcha/Recaptcha'),
    'task_configure_backup_migrate' => st('Configure Backup/Migrate'),
  	'task_configure_cleanup' => st('Running cleanup tasks'),
  );
}

/**
 * Perform any final installation tasks for this profile.
 *
 * @param $task
 *   The current $task of the install system. When hook_profile_tasks()
 *   is first called, this is 'profile'.
 * @param $url
 *   Complete URL to be used for a link or form action on a custom page,
 *   if providing any, to allow the user to proceed with the installation.
 *
 * @return
 *   An optional HTML string to display to the user. Only used if you
 *   modify the $task, otherwise discarded.
 */

function d6primer_profile_tasks(&$task, $url) {
  // Run 'profile' task
  if ($task == 'profile') {
    // Uninstalling the updates notification by default
    module_disable(array('update'));
    $task = 'task_configure_theme';
    watchdog('d6primer_profile', 'running profile task');
  }

  // Run 'task_configure_theme' task
  if ($task == 'task_configure_theme') {
  	configure_theme();
  	$task = 'task_configure_editor';
  }
  
  // Run 'task_configure_editor' task
  if ($task == 'task_configure_editor') {
    configure_editor();
    $task = 'task_configure_variables';
  }
  
  // Run 'task_configure_editor' task
  if ($task == 'task_configure_variables') {
    configure_variables();
    $task = 'task_configure_users';
  }
  
  // Run 'task_configure_users' task
  if ($task == 'task_configure_users') {
    configure_users();
    $task = 'task_configure_nodewords';
  }
  
  // Run 'task_configure_nodewords' task
  if ($task == 'task_configure_nodewords') {
    configure_nodewords();
    $task = 'task_configure_contact';
  }
  
  // Run 'task_configure_contact' task
  if ($task == 'task_configure_contact') {
    configure_contact();
    $task = 'task_configure_captcha';
  }

  // Run 'task_configure_contact' task
  if ($task == 'task_configure_captcha') {
    configure_captcha();
    $task = 'task_configure_backup_migrate';
  }

  // Run 'task_configure_backup_migrate' task
  if ($task == 'task_configure_backup_migrate') {
    configure_backup_migrate();
    $task = 'task_configure_cleanup';
  }
  
  // Run 'task_configure_cleanup' task
  if ($task == 'task_configure_cleanup') {
    drupal_flush_all_caches();
    drupal_cron_run();
    $task = 'profile-finished';
  }
  
}

/**
 * Configure Theme Task
 */
function configure_theme() {

  $system_themes = system_theme_data();
  $theme = 'primer';

  if (array_key_exists($theme, $system_themes)) {
    system_initialize_theme_blocks($theme);
    db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' and name = ('%s')", $theme);
    variable_set('theme_default', $theme);
  };
  // Disables garland theme
  db_query("UPDATE {system} SET status = 0 WHERE type = 'theme' and name = ('garland')");
  watchdog('d6primer_profile', 'Configured theme');

  
  // Disable all default blocks
  db_query("UPDATE {blocks} SET status = 0 where theme = '%s'", $theme);

  $blocks = array(
    'search' => array(
      'module' => 'search',
      'delta' => '0',
      'theme' => $theme,
      'status' => 1,
      'region' => 'header_search',
      'title' => 'Search',
      'weight' => '-10',
    ),
    'wraplogin_block' => array(
      'module' => 'wraplogin',
      'delta' => '0',
      'theme' => $theme,
      'status' => 1,
      'region' => 'left_below_menu',
      'title' => 'UNITY/WRAP LOGIN',
      'weight' => '-6',
    ),
  );

  foreach ($blocks as $block) {
    // Inserts the block into the block menu
    drupal_write_record('blocks', $block);
    
  }
  watchdog('d6primer_profile', 'Configured blocks');
}

/**
 * Configure Editor Task
 */
function configure_editor() {
  $tiny_conf = get_tinymce_conf();

  $result = db_query("INSERT INTO {wysiwyg}
                      (format, editor, settings)
                      VALUES (%d, '%s', '%s')",
                      1, 'tinymce', serialize($tiny_conf));

  $result = db_query("INSERT INTO {wysiwyg}
                      (format, editor, settings)
                      VALUES (%d, '%s', '%s')",
                      2, 'tinymce', serialize($tiny_conf));
  watchdog('d6primer_profile', 'Configured tinymce');

  $imce_roles_profiles = array(
    3 => array('pid' => 1),
    2 => array('pid' => 2),
    1 => array('pid' => 0),
  );
  variable_set('imce_roles_profiles', $imce_roles_profiles);

  $imce_profiles = array(
    1 => array(
      'name'=> 'User-1',
      'usertab'=> 1,
      'filesize'=> 0,
      'quota'=> 0,
      'tuquota'=> 0,
      'extensions'=> '*',
      'dimensions'=> 0,
      'filenum'=> 0,
      'directories'=> array(
        0 => array(
          'name' => '.',
          'subnav' => 1,
          'browse' => 1,
          'upload' => 1,
          'thumb' => 1,
          'delete' => 1,
          'resize' => 1,
          'mkdir' => 1,
          'rmdir' => 1,
      )),
      'thumbnails' => array(),
      'mkdirnum' => 0
    ),
    2 => array(
      'name'=> 'Global',
      'usertab'=> 1,
      'filesize'=> 0,
      'quota'=> 500,
      'tuquota'=> 500,
      'extensions'=> '*',
      'dimensions'=> 0,
      'filenum'=> 0,
      'directories'=> array(
        0 => array(
          'name' => '.',
          'subnav' => 1,
          'browse' => 1,
          'upload' => 1,
          'thumb' => 1,
          'delete' => 1,
          'resize' => 1,
          'mkdir' => 1,
          'rmdir' => 1,
      )),
      'thumbnails' => array(),
      'mkdirnum' => 0
    ),
  );
  variable_set('imce_profiles', $imce_profiles);
  watchdog('d6primer_profile', 'Configured imce');

}

/**
 * Configure Variables Task
 */
function configure_variables() {
  
  // Configuring date formats
  variable_set('date_default_timezone', '-14400');
  variable_set('date_first_day', '0');
  variable_set('date_format_long', 'l, F j, Y - g:ia');
  variable_set('date_format_long_custom', 'l, F j, Y - H:i');
  variable_set('date_format_medium', 'D, m/d/Y - g:ia');
  variable_set('date_format_medium_custom', 'D, m/d/Y - H:i');
  variable_set('date_format_short', 'm/d/Y - g:ia');
  variable_set('date_format_short_custom', 'm/d/Y - H:i');
  watchdog('d6primer_profile', 'Configured date/time formats');

  // Configures file system 
  variable_set('file_directory_temp', '/tmp');
  variable_set('upload_uploadsize_default', 5);
  variable_set('upload_usersize_default', 1024);
  watchdog('d6primer_profile', 'Configured file system settings');

  // Configures cache settings
  variable_set('page_compression', '0');
  variable_set('block_cache', '0');
  variable_set('cache', '0');
  watchdog('d6primer_profile', 'Configured cache settings');

  // Configure user registration
  variable_set('user_email_verification', 0);
  variable_set('user_register', 0);
  variable_set('user_mail_status_activated_notify', 0);
  watchdog('d6primer_profile', 'Configured users');

  // Configure path auto patterns
  variable_set('pathauto_node_pattern', '[menupath-raw]');
  watchdog('d6primer_profile', 'Configured path auto settings');

  // Setting 404 page
  variable_set('site_404', 'notfound');
  watchdog('d6primer_profile', 'Configured 404 page');

  // Create the menu block for secondary navigation
  variable_set('menu_block_ids', array(0 => 1));
  variable_set('menu_block_1_admin_title', 'Primary links (levels 2+)');
  variable_set('menu_block_1_depth', '0');
  variable_set('menu_block_1_expanded', 0);
  variable_set('menu_block_1_follow', 0);
  variable_set('menu_block_1_level', "2");
  variable_set('menu_block_1_parent', "primary-links:0");
  variable_set('menu_block_1_sort', 0);
  variable_set('menu_block_1_title_link', 0);
  watchdog('d6primer_profile', 'Configured menu blocks');

  // Concigure input formats
  variable_set('allowed_html_1', '<a> <em> <strong> <cite> <code> <ul> <ol> <li> <dl> <dt> <dd> <p> <span> <img> <div> <h3> <h4> <h5> <h6> <br> <blockquote> <table> <tbody> <tr> <th> <td> <sup> <sub>');
  watchdog('d6primer_profile', 'Configured input formats');

  // Configure shadowbox settings
  variable_set('shadowbox_location', 'profiles/d6primer/libraries/shadowbox');
  watchdog('d6primer_profile', 'Configured shadowbox library');

  // Configure view settings
  variable_set('views_hide_help_message', "1");
  watchdog('d6primer_profile', 'Configured views settings');

  // Configure menu_breadcrumb settings
  variable_set('menu_breadcrumb_append_node_url', 0);
  watchdog('d6primer_profile', 'Configured menu_breadcrumb settings');

  // Configure extlinks settings
  variable_set('extlink_target', '_blank');
  variable_set('extlink_subdomains', 1);
  watchdog('d6primer_profile', 'Configured extlinks settings');

}

/**
 * Configure Users Task
 */
function configure_users() {
  $permissions = array(
    'moderator' => get_moderator_permissions(),
    'anonymous user' => get_anonymous_permissions(),
  );
  foreach ($permissions as $role => $perms) {
    // Add the role and get the role id.
    if ($role != 'anonymous user') {
      db_query("INSERT INTO {role} (name) VALUES ('%s')", $role);
    }
    $rid = db_result(db_query("SELECT rid FROM {role} WHERE name = '%s'", $role));
    
    // Remove any existing permissions
    db_query('DELETE FROM {permission} WHERE rid = %d', $rid);

    // Add new permissions
    db_query("INSERT INTO {permission} (rid, perm) VALUES (%d, '%s')", $rid, implode(', ', $perms));
  }

  $users = array(
    'njyoung.ncsu.edu' => array(
      'name' => 'njyoung.ncsu.edu',
      'pass' => '762142b0ed2513b3c4106536a0328278',
      'email' => 'njyoung@ncsu.edu'
    ),
    'jmriehle.ncsu.edu' => array(
      'name' => 'jmriehle.ncsu.edu',
      'pass' => '762142b0ed2513b3c4106536a0328278',
      'email' => 'jmriehle@ncsu.edu'
    ),
  );

  foreach ($users as $user) {
    create_new_admin_user($user['name'], $user['pass'], $user['email']);
  };

  // Creates default users
  watchdog('d6primer_profile', 'running task_configure_users task');
}

/**
 * Configures nodewords
 */
function configure_nodewords() {

  $tables = array(
    'canonical' => array(
      'value' => '[node-url]',
    ),
    'abstract' => array(
      'value' => '',
    ),
    'copyright' => array(
      'value' => 'Copyright [site-date-yyyy] North Carolina State University. All rights reserved.',
    ),
    'description' => array(
      'value' => '',
    ),
    'keywords' => array(
      'value' => '',
    ),
    'revisit-after' => array(
      'value' => '5',
    ),
    'robots' => array(
      'index_follow' => 'index,follow',
      'value' => array(
        'noarchive' => 0,
        'noodp' => 0,
        'nosnippet' => 0,
        'noydir' => 0,
      ),
    ),
  );

  foreach($tables as $name => $value) {
    $result = db_query("INSERT INTO {nodewords}
                        (type, id, name, content)
                        VALUES (%d, %d, '%s', '%s')",
                        1, 0, $name, serialize($value));
  }

  $nodewords_head = array(
    'canonical' => 'canonical',
    'copyright' => 'copyright',
    'description' => 'description',
    'keywords' => 'keywords',
    'revisit-after' => 'revisit-after',
    'robots' => 'robots',
    'abstract' => '0',
  );
  variable_set('nodewords_head', $nodewords_head);

  $nodewords_ui_edit = array(
    'description' => 'description',
    'keywords' => 'keywords',
    'revisit-after' => 'revisit-after',
    'abstract' => 0,
    'canonical' => 0,
    'copyright' => 0,
    'robots' => 0,
  );
  variable_set('nodewords_ui_edit', $nodewords_ui_edit);
  variable_set('nodewords_ui_use_default_value_canonical', 'always');
  variable_set('nodewords_ui_use_default_value_copyright', 'always');
  variable_set('nodewords_use_alt_attribute', '1');

  watchdog('d6primer_profile', 'running task_configure_nodewords task');
}

/**
 * Configures contact form
 */
function configure_contact() {
  $result = db_query("INSERT INTO {contact}
                      (category, recipients, selected)
                      VALUES ('%s', '%s', %d)",
                      'Website Administrator', 'njyoung+d6primer_contact_form@ncsu.edu', 1);

  watchdog('d6primer_profile', 'Configured contact form');
}

/**
 * Configures captcha and recaptcha
 */
function configure_captcha() {

  // Configure captcha/recaptcha settings
  variable_set('captcha_add_captcha_description', 0);
  variable_set('captcha_allow_on_admin_pages', 0);
  variable_set('captcha_default_challenge', 'recaptcha/reCAPTCHA');
  variable_set('captcha_default_validation', 1);
  variable_set('captcha_administration_mode', 0);
  variable_set('recaptcha_ajax_api', 1);
  variable_set('recaptcha_private_key', '6LdvWc0SAAAAAHytAais_ARotfgOpYx9320JSsrK');
  variable_set('recaptcha_public_key', '6LdvWc0SAAAAAJZF0eyUtotIiq9bBWFBh3CuJGgx');
  variable_set('recaptcha_theme', 'white');

  $types = array(
    array(
      'form_id' => 'comment_form',
      'captcha_type' => 'default',
    ),
    array(
      'form_id' => 'contact_mail_page',
      'captcha_type' => 'default',
    ),
    array(
      'form_id' => 'contact_mail_user',
      'captcha_type' => 'default',
    ),
  );

  // Clear everything from the table because i'm lazy and don't want to write any
  // SQL update scripts
  db_query("TRUNCATE TABLE {captcha_points}");
  foreach ($types as $type) {
    $result = db_query("INSERT INTO {captcha_points}
                        (form_id, captcha_type)
                        VALUES ('%s', '%s')",
                        $type['form_id'], $type['captcha_type']);
  };
  watchdog('d6primer_profile', 'Configured captcha');
}

/**
 * Configures backup and migrate
 */
function configure_backup_migrate() {
  gen_backup_migrate_profile();
  gen_backup_migrate_destinations();
  gen_backup_migrate_schedules();
  watchdog('d6primer_profile', 'Configured backup and migrate');
}
