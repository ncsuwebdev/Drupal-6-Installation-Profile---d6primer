<?php

/**
 * @file
 *
 * An install profile for Primer theme based drupal 6 sites
 */

include_once('d6primer.tinymce.inc');
include_once('d6primer.permissions.inc');
include_once('d6primer.users.inc');
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
  	'strongarm',
    'token',
    'vertical_tabs',
    'views',
  	'views_ui',
    'webform',
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
