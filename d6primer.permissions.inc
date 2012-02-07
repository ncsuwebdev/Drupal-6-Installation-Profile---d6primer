<?php

/**
 * Permissions for Site Moderator users
 */
function get_moderator_permissions() {
  return array(
    'access administration menu',
    'administer menu',
    'administer blocks',
    'access content',
    'administer nodes',
    'revert revisions',
    'view revisions',
    'create url aliases',
    'access administration pages',
    'access content',
    'access site-wide contact form',
    'Configure all page settings',
    'Configure all specific settings',
    'Create blocks',
    'Disable all blocks',
    'Enable all blocks',
    'Move all blocks',
    'View all blocks',
    'create images',
    'delete any images',
    'delete own images',
    'edit any images',
    'edit own images',
    'view original images',
    'attach images',
    'upload files',
    'view uploaded files',
    'edit meta tags',
    'skip CAPTCHA',
  );
}

/**
 * Permissions for Anonymous Users
 */
function get_anonymous_permissions() {
  return array(
    'access content',
    'view uploaded files',
  );
}

