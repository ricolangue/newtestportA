<?php
ini_set('display_errors', 'off');
error_reporting(E_ALL);
define('COMP_EMAIL', 'billokyere@hotmail.com'); // clients email

define('SMTP_ENCRYPTION', 'off'); // TLS, SSL or off
define('SMTP_PORT', 587); // SMPT port number 587 or default
define('COMP_NAME', 'YAMA Services LLC'); // company name
define('MAIL_TYPE', 2); // 1 - html, 2 - txt
define('MAIL_DOMAIN', 'www.yamaservicesassistedliving.com'); // company domain
define('DEV_MODE',false); //if false = launched account , true = pages account

// Update it using a working google Site key
$recaptcha_sitekey = '6LfzkWogAAAAANvlPqAqMw4bhSTthUJ6jyuHq-l_';
// Update it using a working google Privite key
$recaptcha_privite = '6LfzkWogAAAAAA98ESXhLKAFEoiUmO-TjQO-AA1m';


// do not edit
$subject = COMP_NAME . " [" . $formname . "]";
$template = 'template';
$to_name = NULL;
$from_email = NULL;
$from_name = 'Message From Your Site';
$attachments = array();

// testing here
$testform = false;
if($testform){
	$to_email 	= array('webtest2g@gmail.com','webtest1y@yahoo.com');
	$cc = '';
	$bcc = '';
}else{
	$to_email 	= array('billokyere@hotmail.com','yamaservices@yahoo.com');
	$cc = '';
	$bcc = '';
}
