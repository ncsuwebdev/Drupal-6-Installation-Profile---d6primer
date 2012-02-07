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
    'wysiwyg',
  );
  $custom_modules = array(
  	'ncstatebrandingbar',
  	'ncsuphplibrary',  
    'ncsuroles',
  	'wraplogin',
  );
  return array_merge($core_modules, $contrib_modules, $custom_modules);
}



