<?php 

/**
 * Enabled home page slider, generates the taxonomy term(s) required
 */
function enable_feature_primer_home_page_slider() {
    $enable_modules = array(
  		'primer_home_page_slider',
  	);
  	
  	module_enable($enable_modules);
  	
  	$vid = db_query("SELECT vid FROM {vocabulary} WHERE name = 'Syndication'")->fetchField();
  	
  	$term = array(
		'vid' => $vid, // Vocabulary ID
		'name' => 'Home Page Slider', // Term Name
	);
	return taxonomy_save_term($term);
          
};
  	
