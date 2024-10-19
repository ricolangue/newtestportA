<?php
defined('ACCESSIBLE') or exit('No direct script access allowed');
ini_set('display_errors', 'off');
error_reporting(E_ALL);
define('COMP_EMAIL', 'traceylynnallen31@gmail.com'); // clients email

define('SMTP_ENCRYPTION', 'off'); // TLS, SSL or off
define('SMTP_PORT', 587); // SMPT port number 587 or default
define('COMP_NAME', 'Unlimited Staffing Network'); // company name
define('MAIL_TYPE', 2); // 1 - html, 2 - txt
define('MAIL_DOMAIN', 'w15428.proweaversite15.com'); // company domain
define('TEMPLATE_TEST', false); //if false = launched account , true = pages account

// Update it using a working google Site key
$recaptcha_sitekey = '6LfKvFkqAAAAAL_GFTamN0LPRvH6d0c2kkBDNzT-';
// Update it using a working google Privite key
$recaptcha_privite = '6LfKvFkqAAAAACDzRNaMqXuvUgsI3T-Rua1AwxmC';

// do not edit
$subject = COMP_NAME . " [" . $formname . "]";
$template = 'template';
$to_name = NULL;
$from_email = 'noreply@link2newsite.com';
$from_name = 'Message From Your Site';
$attachments = array();

// testing here
$testform = true;
if ($testform) {
	$to_email = array('webtest2g@gmail.com');
	$cc = '';
	$bcc = '';
} else {
	$to_email = array('traceylynnallen31@gmail.com');
	$cc = '';
	$bcc = '';
}