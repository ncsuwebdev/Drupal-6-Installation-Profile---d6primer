<?php 

/**
 * Enabled home page slider, generates the taxonomy term(s) required
 */
function enable_feature_primer_home_page_slider() {
    $enable_modules = array(
  		'primer_home_page_slider',
  	);
  	
  	module_enable($enable_modules);
  	
	$name = 'Syndication';
	$limit = 1;
	$query = db_query("SELECT * FROM {vocabulary} WHERE name = '%s' LIMIT %d", $type, $limit);    
	while ($row = db_fetch_array($query)) { // this returns the row as an array, use db_fetch_object to get an object
	  $vid = $row['vid'];
	}
  	
  	$term = array(
		'vid' => $vid, // Vocabulary ID
		'name' => 'Home Page Slider', // Term Name
	);
	
	taxonomy_save_term($term);
          
};
  	
