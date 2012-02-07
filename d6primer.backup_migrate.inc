<?php


/**
 * Generates the configuration for backup_migrate
 */
function gen_backup_migrate_profile() {
  $profile_id = 'default';
  $name = 'Default Settings';
  $filename = '[site-name]';
  $append_timestamp = 1;
  $timestamp_format = 'Y-m-d\TH-i-s';
  $filters = array(
    'compression' => 'gzip',
    'notify_success_enable' => 0,
    'notify_success_email' => 'njyoung@ncsu.edu',
    'notify_failure_enable' => 1,
    'notify_failure_email' => 'njyoung@ncsu.edu',
    'utils_site_offline' => 0,
    'utils_site_offline_message' => 'This site is temporarily unavailble due to backup maintenance',
    'exclude_tables' => array(),
    'nodata_tables' => array(
      'cache' => 'cache',
      'cache_block' => 'cache_block',
      'cache_filter' => 'cache_filter',
      'cache_form' => 'cache_form',
      'cache_menu' => 'cache_menu',
      'cache_page' => 'cache_page',
      'cache_update' => 'cache_update',
      'sessions' => 'sessions',
      'watchdog' => 'watchdog',
    ),
    'utils_lock_tables' => 0,
  );

  db_query("INSERT INTO {backup_migrate_profiles} 
            (profile_id, name, filename, append_timestamp, timestamp_format, filters)
            VALUES ('%s', '%s', '%s', %d, '%s', '%s')",
            $profile_id, $name, $filename, $append_timestamp, $timestamp_format, serialize($filters));
  watchdog('gen_backup_migrate_profile', 'Created backup_migrate_profile.');
};

function gen_backup_migrate_destinations() {
  $destination_id = 'hourly';
  $name = 'Hourly Backups Directory';
  $type = 'file';
  $location = 'sites/default/files/backup_migrate/hourly';
  $settings = array(
    'chmod' => '',
    'chgrp' => ''
  );

  db_query("INSERT INTO {backup_migrate_destinations}
            (destination_id, name, type, location, settings)
            VALUES ('%s', '%s', '%s', '%s', '%s')",
            $destination_id, $name, $type, $location, serialize($settings));
  watchdog('gen_backup_migrate_destinations', 'Created backup_migrate_destinations');
}

function gen_backup_migrate_schedules() {
  $schedule_id = 'hourly_schedule';
  $name = 'Hourly Schedule';
  $source_id = 'db';
  $destination_id = 'hourly';
  $profile_id = 'default';
  $keep = 48;
  $period = 3600;
  $enabled = 1;

  db_query("INSERT INTO {backup_migrate_schedules}
            (schedule_id, name, source_id, destination_id, profile_id, keep, period, enabled)
            VALUES ('%s', '%s', '%s', '%s', '%s', %d, %d, %d)",
            $schedule_id, $name, $source_id, $destination_id, $profile_id, $keep, $period, $enabled);
  watchdog('gen_backup_migrate_schedules', 'Created backup_migrate_schedules');
}

