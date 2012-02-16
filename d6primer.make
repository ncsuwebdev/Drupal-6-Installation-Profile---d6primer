; ************************
; CORE
; ************************

core = "6.x"
api = "2"

projects[drupal][version] = 6.24

; ************************
; CONTRIB MODULES
; ************************

projects[admin_menu][subdir] = contrib
projects[adminrole][subdir] = contrib
projects[advanced_help][subdir] = contrib
projects[cck][subdir] = contrib
projects[ctools][subdir] = contrib
projects[date][subdir] = contrib
projects[email][subdir] = contrib
projects[filefield][subdir] = contrib
projects[google_analytics][subdir] = contrib
projects[globalredirect][subdir] = contrib
projects[image][subdir] = contrib
projects[imageapi][subdir] = contrib
projects[imagecache][subdir] = contrib
projects[imagecache_profiles][subdir] = contrib
projects[imagefield][subdir] = contrib
projects[wysiwyg][subdir] = contrib
projects[imce][subdir] = contrib
projects[imce_wysiwyg][subdir] = contrib
projects[imce_mkdir][subdir] = contrib
projects[link][subdir] = contrib
projects[menu_block][subdir] = contrib
projects[mimemail][subdir] = contrib
projects[nodereference_url][subdir] = contrib
projects[nodewords][subdir] = contrib
projects[nodewords][version] = "2.x-dev"
projects[nodeaccess][subdir] = contrib
projects[pathauto][subdir] = contrib
projects[path_redirect][subdir] = contrib
projects[token][subdir] = contrib
projects[captcha][subdir] = contrib
projects[recaptcha][subdir] = contrib
projects[role_delegation][subdir] = contrib
projects[shadowbox][subdir] = contrib
projects[shadowbox][version] = 4.x-dev
projects[vertical_tabs][subdir] = contrib
projects[views][subdir] = contrib
projects[views_hacks][subdir] = contrib
projects[views_accordion][subdir] = contrib
projects[views_calc][subdir] = contrib
projects[views_customfield][subdir] = contrib
projects[views_data_export][subdir] = contrib
projects[views_datasource][subdir] = contrib
projects[views_fluid_grid][subdir] = contrib
projects[views_slideshow][subdir] = contrib
projects[webform][subdir] = contrib
projects[webform_validation][subdir] = contrib
projects[masquerade][subdir] = contrib
projects[block_access][subdir] = contrib
projects[libraries][subdir] = contrib
projects[jquery_ui][subdir] = contrib
projects[auto_nodetitle][subdir] = contrib
projects[calendar][subdir] = contrib
projects[menu_breadcrumb][subdir] = contrib
projects[feeds][subdir] = contrib
projects[css_injector][subdir] = contrib
projects[extlink][subdir] = contrib
projects[backup_migrate][subdir] = contrib
projects[strongarm][subdir] = contrib
projects[features][subdir] = contrib
projects[gcal_events][subdir] = contrib
projects[readonlymode][subdir] = contrib
projects[context][subdir] = contrib


; ************************
; LIBRARIES
; ************************

libraries[tinymce][download][type] = "get"
libraries[tinymce][download][url] = "http://drupal.ncsu.edu/resources/libraries/tinymce/tinymce_3.4.7.zip"
libraries[tinymce][directory_name] = "tinymce"

libraries[jquery.ui][download][type] = "file"
libraries[jquery.ui][download][url] = "http://drupal.ncsu.edu/resources/libraries/jquery.ui/jquery-ui-1.7.3.zip"

libraries[simplepie][download][type] = "file"
libraries[simplepie][download][url] = "http://drupal.ncsu.edu/resources/libraries/simplepie/simplepie-1.2.1.zip"

; ************************
; NC STATE MODULES & THEMES
; ************************

projects[primer][subdir] = "ncstate"
projects[primer][location] = "http://drupal.ncsu.edu/features/fserver"

projects[wraplogin][subdir] = "ncstate"
projects[wraplogin][location] = "http://drupal.ncsu.edu/features/fserver"

projects[ncstatebrandingbar][subdir] = "ncstate"
projects[ncstatebrandingbar][location] = "http://drupal.ncsu.edu/features/fserver"

projects[ncsuphplibrary][subdir] = "ncstate"
projects[ncsuphplibrary][location] = "http://drupal.ncsu.edu/features/fserver"

projects[ncsuroles][subdir] = "ncstate"
projects[ncsuroles][location] = "http://drupal.ncsu.edu/features/fserver"

; ************************
; NC STATE FEATURES
; ************************

projects[primer_home_page_slider][subdir] = "ncstate/features"
projects[primer_home_page_slider][location] = http://drupal.ncsu.edu/features/fserver

projects[primer_photo_gallery][subdir] = "ncstate/features"
projects[primer_photo_gallery][location] = http://drupal.ncsu.edu/features/fserver
