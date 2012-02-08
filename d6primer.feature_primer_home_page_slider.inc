<?php 

/**
 * Enabled home page slider, generates the taxonomy term(s) required
 */
function enable_feature_primer_home_page_slider() {
    $enable_modules = array(
  		'primer_home_page_slider',
  	);
  	
  	module_enable($enable_modules);
  	
  	$vocab_object = get_vocabulary_by_name("Syndication");
	$myVid = $vocab_object->vid;
  	
  	$term = array(
            'vid' => $myVid, // Voacabulary ID
            'name' => 'Home Page Slider', // Term Name
            'synonyms' => NULL, // (Optional) Synonym of this term
            'parent' => NULL, // (Optional) Term ID of a parent term
            'relations' => NULL, // (Optional) Related Term IDs
          );
	taxonomy_save_term($term);
          
	return true;
	
};


function get_vocabulary_by_name($vocabulary_name) {
  $vocabs = taxonomy_get_vocabularies(NULL);
  foreach ($vocabs as $vocab_object) {
    if ($vocab_object->name == $vocabulary_name) {
      return $vocab_object;
    }
  }
  return NULL;
}


  	
