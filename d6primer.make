; ************************
; CORE
; ************************

core = 6.x
api = 2

projects[drupal][version] = 6.26

; ************************
; CONTRIB MODULES
; ************************

projects[admin_menu][subdir] = contrib
projects[admin_menu][version] = 1.8

projects[adminrole][subdir] = contrib
projects[adminrole][version] = 1.3

projects[advanced_help][subdir] = contrib
projects[advanced_help][version] = 1.2

projects[auto_nodetitle][subdir] = contrib
projects[auto_nodetitle][version] = 1.2

projects[backup_migrate][subdir] = contrib
projects[backup_migrate][version] = 2.5

projects[block_access][subdir] = contrib
projects[block_access][version] = 2.9

projects[calendar][subdir] = contrib
projects[calendar][version] = 2.4

projects[captcha][subdir] = contrib
projects[captcha][version] = 2.4

projects[cck][subdir] = contrib
projects[cck][version] = 2.9

projects[context][subdir] = contrib
projects[context][version] = 3.0

projects[css_injector][subdir] = contrib
projects[css_injector][version] = 1.4

projects[ctools][subdir] = contrib
projects[ctools][version] = 1.8

projects[date][subdir] = contrib
projects[date][version] = 2.8

projects[disable_messages][subdir] = contrib
projects[disable_messages][version] = 1.1

projects[email][subdir] = contrib
projects[email][version] = 1.2

projects[extlink][subdir] = contrib
projects[extlink][version] = 1.11

projects[features][subdir] = contrib
projects[features][version] = 1.2

projects[feeds][subdir] = contrib
projects[feeds][version] = 1.0-beta11

projects[filefield][subdir] = contrib
projects[filefield][version] = 3.10

projects[gcal_events][subdir] = contrib
projects[gcal_events][version] = 1.x-dev

projects[globalredirect][subdir] = contrib
projects[globalredirect][version] = 1.4

projects[google_analytics][subdir] = contrib
projects[google_analytics][version] = 3.3

projects[image][subdir] = contrib
projects[image][version] = 1.2

projects[imageapi][subdir] = contrib
projects[imageapi][version] = 1.10

projects[imagecache_profiles][subdir] = contrib
projects[imagecache_profiles][version] = 1.4-rc1

projects[imagecache][subdir] = contrib
projects[imagecache][version] = 2.0-beta12

projects[imagefield][subdir] = contrib
projects[imagefield][version] = 3.10

projects[imce_mkdir][subdir] = contrib
projects[imce_mkdir][version] = 1.2

projects[imce_wysiwyg][subdir] = contrib
projects[imce_wysiwyg][version] = 1.1

projects[imce][subdir] = contrib
projects[imce][version] = 2.3

projects[jquery_ui][subdir] = contrib
projects[jquery_ui][version] = 1.5

projects[js_injector][subdir] = contrib
projects[js_injector][version] = 1.1

projects[libraries][subdir] = contrib
projects[libraries][version] = 1.0

projects[link][subdir] = contrib
projects[link][version] = 2.9

projects[masquerade][subdir] = contrib
projects[masquerade][version] = 1.7

projects[menu_admin_per_menu][subdir] = contrib
projects[menu_admin_per_menu][version] = 1.4

projects[menu_block][subdir] = contrib
projects[menu_block][version] = 2.4

projects[menu_breadcrumb][subdir] = contrib
projects[menu_breadcrumb][version] = 1.3

projects[mimemail][subdir] = contrib
projects[mimemail][version] = 1.0

projects[module_filter][subdir] = contrib
projects[module_filter][version] = 1.7

projects[nodeaccess][subdir] = contrib
projects[nodeaccess][version] = 1.3

projects[nodereference_url][subdir] = contrib
projects[nodereference_url][version] = 1.11

projects[nodewords][subdir] = contrib
projects[nodewords][version] = 2.x-dev

projects[path_redirect][subdir] = contrib
projects[path_redirect][version] = 1.0-rc2

projects[pathauto][subdir] = contrib
projects[pathauto][version] = 1.6

projects[phone][subdir] = contrib
projects[phone][version] = 2.18

projects[readonlymode][subdir] = contrib
projects[readonlymode][version] = 1.1

projects[recaptcha][subdir] = contrib
projects[recaptcha][version] = 1.7

projects[role_delegation][subdir] = contrib
projects[role_delegation][version] = 1.4

projects[scheduler][subdir] = contrib
projects[scheduler][version] = 1.8

projects[shadowbox][subdir] = contrib
projects[shadowbox][version] = 4.x-dev

projects[strongarm][subdir] = contrib
projects[strongarm][version] = 2.1

projects[system_perm][subdir] = contrib
projects[system_perm][version] = 1.0

projects[tinymce_node_picker][subdir] = contrib
projects[tinymce_node_picker][version] = 2.1

projects[token][subdir] = contrib
projects[token][version] = 1.18

projects[video_filter][subdir] = contrib
projects[video_filter][version] = 3.0

projects[vertical_tabs][subdir] = contrib
projects[vertical_tabs][version] = 1.0-rc2

projects[views_accordion][subdir] = contrib
projects[views_accordion][version] = 1.5

projects[views_calc][subdir] = contrib
projects[views_calc][version] = 1.3

projects[views_customfield][subdir] = contrib
projects[views_customfield][version] = 1.0

projects[views_data_export][subdir] = contrib
projects[views_data_export][version] = 2.0-beta5

projects[views_datasource][subdir] = contrib
projects[views_datasource][version] = 1.0-beta2

projects[views_fluid_grid][subdir] = contrib
projects[views_fluid_grid][version] = 1.1

projects[views_hacks][subdir] = contrib
projects[views_hacks][version] = 1.0-beta2

projects[views_slideshow][subdir] = contrib
projects[views_slideshow][version] = 3.0

projects[views][subdir] = contrib
projects[views][version] = 2.16

projects[webform_validation][subdir] = contrib
projects[webform_validation][version] = 1.5

projects[webform][subdir] = contrib
projects[webform][version] = 3.18

projects[wysiwyg][subdir] = contrib
projects[wysiwyg][version] = 2.4


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

projects[primer][subdir] = ncstate
projects[primer][version] = 3.7
projects[primer][location] = http://drupal.ncsu.edu/features/fserver

projects[primermanager][subdir] = ncstate
projects[primermanager][version] = 1.0
projects[primermanager][location] = http://drupal.ncsu.edu/features/fserver

projects[wraplogin][subdir] = ncstate
projects[wraplogin][version] = 2.0
projects[wraplogin][location] = http://drupal.ncsu.edu/features/fserver

projects[ncstatebrandingbar][subdir] = ncstate
projects[ncstatebrandingbar][version] = 1.6
projects[ncstatebrandingbar][location] = http://drupal.ncsu.edu/features/fserver

projects[ncsuphplibrary][subdir] = ncstate
projects[ncsuphplibrary][version] = 1.0-2
projects[ncsuphplibrary][location] = http://drupal.ncsu.edu/features/fserver

projects[ncsuroles][subdir] = ncstate
projects[ncsuroles][version] = 1.2
projects[ncsuroles][location] = http://drupal.ncsu.edu/features/fserver

projects[d6primergeneralfeature][type] = module
projects[d6primergeneralfeature][subdir] = ncstate
projects[d6primergeneralfeature][download][type] = git
projects[d6primergeneralfeature][download][url] = git://github.com/ncsuwebdev/Drupal-6-Installation-Profile---General-Feature-Module.git
projects[d6primergeneralfeature][download][branch] = 6.x-1.10

; ************************
; NC STATE FEATURES
; ************************

projects[primer_home_page_slider][subdir] = ncstate/features
projects[primer_home_page_slider][version] = 1.1
projects[primer_home_page_slider][location] = http://drupal.ncsu.edu/features/fserver

projects[primer_photo_gallery][subdir] = ncstate/features
projects[primer_photo_gallery][version] = 1.1
projects[primer_photo_gallery][location] = http://drupal.ncsu.edu/features/fserver
