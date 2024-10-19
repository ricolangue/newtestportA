<?php
defined('ACCESSIBLE') or exit('No direct script access allowed');
@session_start();

$formname = 'For Job Seekers Form';
$prompt_message = '<span class="required-info">* Required Information</span>';
if ($_POST) {
	
	$result_recaptcha = Main::recaptcha($recaptcha_privite, $_POST);

	if (
		empty($_POST['First_Name']) ||
		empty($_POST['Last_Name']) ||
		empty($_POST['Job_Applying_for']) ||
		empty($_POST['Social_Security_Number']) ||
		empty($_POST['City']) ||
		empty($_POST['Zip_Code']) ||
		empty($_POST['Phone_Number']) ||
		empty($_POST['Email_Address'])
	) {


		$asterisk = '<span style="color:#FF0000; font-weight:bold;">*&nbsp;</span>';
		$prompt_message = '<div id="error-msg"><div class="message"><span>Required Fields are empty</span><br/><p class="error-close">x</p></div></div>';
	} else if (!preg_match("/^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i", stripslashes(trim($_POST['Email_Address'])))) {
		$prompt_message = '<div id="recaptcha-error"><div class="message"><span>Please enter a valid email address</span><br/><p class="rclose">x</p></div></div>';
	} else if (!$result_recaptcha->success) {
		$prompt_message = '<div id="recaptcha-error"><div class="message"><span>Invalid <br>Recaptcha</span><p class="rclose">x</p></div></div>';
	} else {

		//include 'send_email_curl.php';
		$number = $_POST['Social_Security_Number'];
		$mask = str_pad(substr($number, -3), strlen($number), '*', STR_PAD_LEFT);


		if (MAIL_TYPE == 1) {
			$formdisclaimer = '<div style="position: relative; top: 10px; background: #eef5f8; padding: 15px 20px; border-radius: 5px; width: 660px; margin: 0 auto; text-align: center; font-family: Poppins,sans-serif; border: 1px solid #f9f9f9;  color: #6a6a6a !important;">  
					<span style="border-radius: 50%; height: 19px; display: inline-block; color: #f49d2c; font-size: 15px;   text-align: center;"></span> Please do not reply to this email. This is only a notification from your website online forms. 
					<br>To contact the person who filled out your online form, kindly use the email which is inside the form below.</div>';
		} else
			$formdisclaimer = '';



		$body = '
		
		<div class="form_table" style="width:700px; height:auto; font-size:12px; color:#6a6a6a; letter-spacing:1px; margin: 0 auto; font-family: Poppins,sans-serif;">' . $formdisclaimer . '
		<div class="container" style="background: #fff; margin-top: 30px; font-family: Poppins,sans-serif; color:#6a6a6a; box-shadow: 10px 10px 31px -7px rgba(38,38,38,0.11); -webkit-box-shadow: 10px 10px 31px -7px rgba(38,38,38,0.11); -moz-box-shadow: 10px 10px 31px -7px rgba(38,38,38,0.11);  border-radius: 5px 5px 5px 5px; border: 1px solid #eee;">
			<div class="header" style="background: #a3c7d6; padding: 30px; border-radius: 5px 5px 0px 0px; ">
				<div align="left" style="font-size:22px; font-family: Poppins,sans-serif; color:#fff; font-weight: 900;">' . $formname . '</div>
				<div align="left" style=" color: #11465E;  font-size:19px; font-family: Poppins,sans-serif;  font-style: italic; margin-top: 6px; font-weight: 900;">' . COMP_NAME . '</div>
			</div>
		<div style="padding: 13px 30px 25px 30px;">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center" style="font-family: Poppins,sans-serif;font-size:14px; padding-bottom: 20px;"> 

					';

		foreach ($_POST as $key => $value) {
			if ($key == 'submit')
				continue;
			elseif ($key == 'g-recaptcha-response')
				continue;
			elseif ($key == 'checkboxVal')
				continue;
			if (!empty($value)) {
				$key2 = str_replace('_', ' ', $key);
				if ($value == ':') {
					$body .= ' <tr margin-bottom="10px"> <td colspan="5" height="28" class="OFDPHeading" width="100%" style=" background:#F0F0F0; margin-bottom:5px;"><b style="padding-left: 4px;">' . $key2 . '</b></td></tr>';
				} else if ($key == "Desired_Salary") {
					$body .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
					<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: 125%; position:static;"><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">$' . $_POST['Desired_Salary'] . '</span></td></tr>';

				} else if ($key == 'Social_Security_Number') {
					$body .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
					<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: 125%; position:static;"><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . $mask . '</span></td></tr>';
				}else if($key == "Privacy_Policy"){
					$body .= '<tr><td colspan="3" line-height:30px">

					<input type="checkbox" checked disabled /> By submitting this form you agree to the terms of the Privacy Policy.

					</td></tr>';
				} else {
					$body .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
						<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: normal; word-wrap: anywhere; "><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . htmlspecialchars(trim($value), ENT_QUOTES) . '</span> </td></tr>';
				}
			}
		}
		$body .= '
			</table>
			</div>
			</div>';




		$body2 = '

					<div class="form_table" style="width:700px; height:auto; font-size:12px; color:#6a6a6a; letter-spacing:1px; margin: 0 auto; font-family: Poppins,sans-serif;">' . $formdisclaimer . '
					<div class="container" style="background: #fff; margin-top: 30px; font-family: Poppins,sans-serif; color:#6a6a6a; box-shadow: 10px 10px 31px -7px rgba(38,38,38,0.11); -webkit-box-shadow: 10px 10px 31px -7px rgba(38,38,38,0.11); -moz-box-shadow: 10px 10px 31px -7px rgba(38,38,38,0.11);  border-radius: 5px 5px 5px 5px; border: 1px solid #eee;">
						<div class="header" style="background: #a3c7d6; padding: 30px; border-radius: 5px 5px 0px 0px; ">
							<div align="left" style="font-size:22px; font-family: Poppins,sans-serif; color:#fff; font-weight: 900;">' . $formname . '</div>
							<div align="left" style=" color: #11465E;  font-size:19px; font-family: Poppins,sans-serif;  font-style: italic; margin-top: 6px; font-weight: 900;">' . COMP_NAME . '</div>
						</div>
					<div style="padding: 13px 30px 27px 30px;">
					<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center" style="font-family: Poppins,sans-serif;font-size:14px; padding-bottom: 20px;">

						';

		foreach ($_POST as $key => $value) {
			if ($key == 'submit')
				continue;
			elseif ($key == 'g-recaptcha-response')
				continue;
			elseif ($key == 'checkboxVal')
				continue;

			if (!empty($value)) {
				$key2 = str_replace('_', ' ', $key);
				if ($value == ':') {
					$body2 .= ' <tr margin-bottom="10px"> <td colspan="5" height="28" class="OFDPHeading" width="100%" style=" background:#F0F0F0; margin-bottom:5px;"><b style="padding-left: 4px;">' . $key2 . '</b></td></tr>';
				} else if ($key == "Desired_Salary") {
					$body2 .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
							<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: 125%; position:static;"><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">$' . $_POST['Desired_Salary'] . '</span></td></tr>';

				} else if ($key == 'Social_Security_Number') {
					$body2 .= '';
				} else if ($key == "Marital_Status") {
					$body2 .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
						<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: 125%; position:static;"><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . $_POST['Marital_Status'] . '</span></td></tr>';

				} else if ($key == "Education") {
					$body2 .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
						<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: 125%; position:static;"><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . $_POST['Education'] . '</span></td></tr>';

				} else if ($key == "Employment_Type_Desired") {
					$body2 .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
												<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: 125%; position:static;"><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . $_POST['Employment_Type_Desired'] . '</span></td></tr>';

				} else if ($key == "Days_Available_to_Work") {
					$body2 .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-top:3px;padding-bottom:3px; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
						<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: 125%; position:static;"><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . $_POST['Days_Available_to_Work'] . '</span></td></tr>';

				} else {
					$body2 .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
							<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: normal; word-wrap: anywhere; "><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . htmlspecialchars(trim($value), ENT_QUOTES) . '</span> </td></tr>';
				}
			}
		}
		$body2 .= '
				</table>
				</div>
				</div>';


		// save data form on database
		$subject = $formname;
		$attachments = array();

		// when form has attachments, uncomment code below
		if (!empty($_FILES['attachment']['name'])) {
			$attachmentsdir = ABSPATH . 'onlineforms/attachments/';
			$validextensions = array('pdf', 'doc', 'docx', 'txt', 'jpg', 'jpeg', 'png', 'zip', 'rar'); // include file type here
			for ($i = 0; $i < count($_FILES['attachment']['name']); $i++) {

				$checkfile = $attachmentsdir . $_FILES['attachment']['name'][$i];
				//$tobeuploadfile = $_FILES['attachment']['tmp_name'][$i];
				$tempfile = pathinfo($_FILES['attachment']['name'][$i]);
				if (in_array(strtolower($tempfile['extension']), $validextensions)) {
					if (file_exists($checkfile)) {
						$storedfile = $tempfile['filename'] . '-' . time() . '.' . $tempfile['extension'];
					} else {
						$storedfile = $_FILES['attachment']['name'][$i];
					}

					if (move_uploaded_file($_FILES['attachment']['tmp_name'][$i], $attachmentsdir . $storedfile)) {
						$attachments[] = $storedfile;
					}
				}
			}
		}

		if (MAIL_TYPE == 2) {

			$name = $_POST['First_Name'] . ' ' . $_POST['Last_Name'];
			$result = insertDB($name, $subject, $body, $attachments);

			$parameter = array(
				'body' => $body,
				'from' => $from_email,
				'from_name' => $from_name,
				'to' => $to_email,
				'subject' => 'New Message Notification',
				'attachment' => $attachments
			);

			$success_message = '<div id="success"><div class="message"><span>THANK YOU</span><br/> <span>for submitting an application.</span><br/><span>We\'ll get in touch with you shortly.</span><p class="close">x</p></div></div>';

			$failed_message = '<div id="error-msg"><div class="message"><span>Failed to send email. Please try again.</span><br/><p class="error-close">x</p></div></div>';

			$prompt_message = send_email($parameter, $success_message, $failed_message);
			unset($_POST);

		} else if (MAIL_TYPE == 1) {

			$name = $_POST['First_Name'] . ' ' . $_POST['Last_Name'];
			$result = insertDB($name, $subject, $body, $attachments);

			$parameter = array(
				'body' => $body2,
				'from' => $from_email,
				'from_name' => $from_name,
				'to' => $to_email,
				'subject' => 'New Message Notification',
				'attachment' => $attachments
			);

			$success_message = '<div id="success"><div class="message"><span>THANK YOU</span><br/> <span>for submitting an application.</span><br/><span>We\'ll get in touch with you shortly.</span><p class="close">x</p></div></div>';

			$failed_message = '<div id="error-msg"><div class="message"><span>Failed to send email. Please try again.</span><br/><p class="error-close">x</p></div></div>';

			$prompt_message = send_email($parameter, $success_message, $failed_message);
			unset($_POST);

		}
	}

}
/*************declaration starts here************/
$state = array('Please select state.', 'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'District Of Columbia', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Puerto Rico', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virgin Islands', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming');

?>
<!DOCTYPE html>
<html class="no-js" lang="en-US">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>
		<?php echo $formname; ?>
	</title>

	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
	<link rel="stylesheet" href="../assets/style.min.css?ver23asas">
	<link rel="stylesheet" href="../assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="../assets/css/media.min.css?ver24as">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/dd.min.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
	<link rel="stylesheet" href="../assets/css/datepicker.min.css">
	<link rel="stylesheet" href="../assets/css/jquery.datepick.min.css" type="text/css" media="screen" />

	<link rel="stylesheet" type="text/css" href="../assets/assets/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../assets/dist/bootstrap-clockpicker.min.css">
	<link rel="stylesheet" type="text/css" href="../assets/assets/css/github.min.css">

	<link rel="stylesheet" href="../assets/css/proweaverPhone.css?ver=<?php echo time(); ?>">
	<link rel="stylesheet" href="../assets/css/flag.min.css" type="text/css" />

	<script src='https://www.google.com/recaptcha/api.js'></script>
	<style>
		.form_head {
			border-radius: 10px;
		}

		.form_head p.title_head:nth-child(1) {
			background: #ff3f3f;
			margin: 0;
			padding: 10px;
			color: #fff;
			font-weight: bold;
			border-top-right-radius: 8px;
			border-top-left-radius: 8px;
		}

		.form_head .form_box .form_box_col1 p {
			margin-bottom: 4px;
		}

		.form_head .form_box {
			margin: 0;
			padding: 25px 28px;
			border: 2px solid #ddd;
			border-top: none;
			border-bottom-right-radius: 8px;
			border-bottom-left-radius: 8px;
		}

		.amount {
			padding: 10px 75px;
		}

		#icon {
			position: absolute;
			padding: 14px 33px 0px 10px;
			background: #c9c9c9;
			height: 63px;
			color: #fff;
			font-size: 31px;
			border-top-left-radius: 15px;
			border-bottom-left-radius: 15px;
		}

		.fa-dollar-sign::before {
			content: "\f155";
			position: relative;
			left: 11px;
			top: 2px;
		}


		.radio tr td {
			margin: 5px 0;
		}

		@media only screen and (min-width: 780px) and (max-width : 1530px) {
			.email_shift {
				column-count: 1;
			}
		}

		@media only screen and (min-width: 100px) and (max-width : 1000px) {
			.time-mobi tr td {
				width: 100% !important;
			}
		}

		@media only screen and (min-width: 100px) and (max-width : 780px) {
			.email_shift tr td {
				width: 100% !important;
			}
		}

		@media only screen and (min-width: 110px) and (max-width : 1490px) {
			.radio tr td {
				width: 100%;
				margin-right: 0;
			}

			.radio tr td:last-child {
				width: 100%;
				margin-right: 0;
			}
		}

		@media only screen and (max-width : 500px) {
			.amount {
				padding: 9px 10px 9px 68px;
			}
		}

		@media only screen and (max-width : 740px) {

			.radio tr td,
			.radio tr td:last-child {
				width: 100%;
				display: block;
			}

			.radioLine div {
				width: 100%;
				float: none;
			}
		}
	</style>
</head>

<body>
	<div class="clearfix">
		<div class="wrapper">
			<div id="contact_us_form_1" class="template_form">
				<div class="form_frame_b">
					<div class="form_content">
						<?php if ($testform): ?>
							<div class="test-mode">
								<div class="ar"><i class="fas fa-info-circle"></i><span>You are in test mode!</span></div>
									<button class="toggle-labels" title="Hide Labels">
									<i class="fas fa-eye"></i> 
								</button>
							</div>
						<?php endif; ?>

						<form id="submitform" name="contact" method="post" enctype="multipart/form-data" action="">
							<?php echo $prompt_message; ?>



							<div class="form_box">
								<div class="form_box_col1">
									<?php
									// @param field name, required, class, replaceholder, rename, id, attrib, value
									$input->masterfield('Job Applying for', '*', 'form_field');
									?>
								</div>
							</div>

							<div class="clearfix"></div>

							<div class="form_box">
								<div class="form_box_col3">
									<?php
									// @param field name, required, class, replaceholder, rename, id, attrib, value
									$input->masterfield('First Name', '*', 'form_field');
									$input->masterfield('Middle Initial', '', 'form_field', 'Enter middle initial here');
									$input->masterfield('Last Name', '*', 'form_field');
									?>
								</div>
							</div>

							<div class="form_box">
								<div class="form_box_col2">
									<div class="group">
										<?php
										$input->label('Social Security Number', '*');
										// @param field name, required, class, replaceholder, rename, id, attrib, value
										?>
										<input type="text" class="form_field Alphanumeric" name="Social_Security_Number"
											placeholder='Enter number here'>
									</div>
									<?php
									// @param field name, required, class, replaceholder, rename, id, attrib, value
									$input->masterdatepicker('Date of Birth', '', 'form_field');
									?>
								</div>
							</div>

							<div class="form_box">
								<div class="form_box_col1">
									<div class="group">
										<?php
										// @param label-name, if required
										$input->label('Address', '*');
										// @param field name, class, id and attribute
										$input->fields('Address', 'form_field', 'Address', 'placeholder="Enter address here"');
										?>
									</div>
								</div>
							</div>

							<div class="form_box">
								<div class="form_box_col3">
									<div class="group">
										<?php
										// @param label-name, if required
										$input->label('City', '*');
										// @param field name, class, id and attribute
										$input->fields('City', 'form_field', 'City', 'placeholder="Enter city here"');
										?>
									</div>
									<div class="group">
										<?php
										// @param label-name, if required
										$input->label('State', '');
										// @param field name, class, id and attribute
										$input->select('State', 'form_field', $state);
										?>
									</div>
									<div class="group">
										<?php
										// @param label-name, if required
										$input->label('Zip Code', '*');
										// @param field name, class, id and attribute
										$input->fields('Zip_Code', 'form_field', 'Zip_Code', 'placeholder="Enter zip code here"');
										?>
									</div>
								</div>
							</div>

							<div class="form_box">
								<div class="form_box_col2">
									<div class="group">
										<?php
										$input->label('Phone Number', '*');
										$input->phoneInput('Phone_Number', 'form_field', 'Phone_Number', 'placeholder="Enter phone number here"');
										?>
									</div>
									<div class="group">
										<?php
										$input->label('Email Address', '*');
										$input->fields('Email_Address', 'form_field', 'Email_Address', 'placeholder="example@domain.com"');
										?>
									</div>

								</div>
							</div>



							<div class="form_box">
								<div class="form_box_col1">
									<div class="group">
										<?php
										// @param field name, required, class, options, id, attribute
										$input->label('Marital Status', '');
										$input->radio('Marital_Status', array('Single', 'Married', 'Annulled', 'Separated', 'Widowed'), '', '', '3');
										?>
									</div>
								</div>
							</div>

							<div class="form_box">
								<div class="form_box_col1">
									<div class="group">
										<?php
										// @param field name, required, class, options, id, attribute
										$input->label('Education', '*');
										$input->radio('Education', array('High School', 'Vocational-technical', 'College', 'Post Graduate'), '', '', '4');
										?>
									</div>
								</div>
							</div>



							<div class="form_box">
								<div class="form_box_col1">
									<div class="group">
										<?php
										// @param field name, required, class, options, id, attribute
										$input->label('Employment Type Desired', '*');
										$input->radio('Employment_Type_Desired', array('Full-Time', 'Part-Time'), '', '', '2');
										?>
									</div>
								</div>
							</div>
							<div class="form_box">
								<div class="form_box_col1">
									<div class="group">
										<?php
										// @param label-name, if required
										$input->label('Days Available to Work', '*');
										// @param field name, class, id and attribute
										$input->chkboxVal('Days_Available_to_Work', array('Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'), '', '', '7');
										?>
									</div>
								</div>
							</div>
							<div class="form_box">
								<div class="form_box_col1">
									<div class="group">
										<?php
										// @param field name, required, class, options, id, attribute
										$input->label('Number of Hours Available to Work', '*');
										$input->fields('Number_of_Hours_Available_to_Work', 'form_field', 'Number_of_Hours_Available_to_Work', 'placeholder="Enter number of hours here"');
										?>
									</div>
								</div>
							</div>

							<div class="form_box">
								<div class="form_box_col1">
									<div class="group">
										<?php
										// @param field name, required, class, options, id, attribute
										$input->label('Would you be available to work overtime, if necessary?', '');
										$input->radio('Available_to_work_overtime', array('Yes', 'No'), '', '', '2');
										?>
									</div>
								</div>
							</div>

							<div class="form_box">
								<div class="form_box_col1">
									<div class="group">
										<?php
										// @param field name, required, class, options, id, attribute
										$input->label('Skills (Separate with comma)', '*');
										$input->fields('Skills', 'form_field', 'Skills', 'placeholder="Enter skills here"');
										?>
									</div>
								</div>
							</div>

							<div class="form_box">
								<div class="form_box_col2">
									<div class="group">
										<?php
										// @param field name, required, class, options, id, attribute
										$input->label('If hired, on what date can you start work?', '*');
										$input->fields('Date_to_start_work', 'form_field Date', 'Date_to_start_work', 'placeholder="Enter date here"');
										?>
									</div>
									<div class="group">
										<?php
										$input->label('Desired Salary (Hourly Rate)', '*');
										$input->amount('Desired_Salary', 'form_field', 'Desired_Salary', 'placeholder="Enter desired salary here"');
										?>
									</div>
								</div>
							</div>

							<div class="form_box">
								<div class="form_box_col1">
									<div class="group">
										<?php
										// @param label-name, if required
										$input->label('Attach Resume <span style="font-style: italic; font-size: 13px; text-transform: lowercase; color:#b1b1b1;">(accepted file formats: .doc, .docx, .pdf | Max: 10MB)</span>', '*');
										?>
										<input type="file" name="attachment[]" id="file" class="input-file">
										<label for="file" class="btn btn-tertiary js-labelFile">
											<span class="js-fileName">Choose a file</span>
											<span class="icon"><i class="fas fa-plus-circle"></i></span>
										</label>
									</div>
								</div>
							</div>

							<div id="error-message" class="valid_Extension_Message"><i
									class="fas fa-info-circle"></i><span>Upload Error!</span> <span class="suberror">
								</span> </div>

							<div class="disclaimer">
							<p><input type="checkbox" name="Privacy_Policy" style="-webkit-appearance:checkbox" /> <b>By submitting this form you agree to the terms of the <a href="<?php echo get_home_url();?>/privacy-policy" target="_blank">Privacy Policy</a>.</b></p>
							</div>

							<div class="form_box5 secode_box">
								<div class="inner_form_box1 recapBtn">
									<div class="g-recaptcha" data-sitekey="<?php echo $recaptcha_sitekey; ?>"></div>
									<div class="btn-submit"><input type="submit" class="form_button" value="SUBMIT" />
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php $input->phone(true); ?>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="../assets/js/city_state.min.js"></script>
	<script type="text/javascript" src="../assets/js/addressFunctionality.min.js"></script>
	<script type="text/javascript" src="../assets/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../assets/dist/jquery-clockpicker-customized.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../assets/js/jquery.datepick.min.js"></script>
	<script src="../assets/js/datepicker.js"></script>
	<script src="../assets/js/plugins.min.js"></script>
	<script src="../assets/js/jquery.mask.min.js"></script>
	<script src="../assets/js/proweaverPhone.js"></script>

	<script type="text/javascript">
		$(document).ready(function () {
			// validate signup form on keyup and submit

			$("#submitform").validate({
				rules: {
					First_Name: "required",
					Last_Name: "required",
					Job_Applying_for: "required",
					Social_Security_Number: "required",
					Address: "required",
					City: "required",
					Zip_Code: "required",
					Phone_Number: "required",
					Email_Address: { required: true, email: true },
					Employment_Type_Desired: "required",
					Number_of_Hours_Available_to_Work: "required",
					Date_to_start_work: "required",
					Desired_Salary: "required",
					Skills: "required",
					Education: "required",
					Days_Available_to_Work: "required",
					Privacy_Policy: "required",
					"attachment[]": "required"
				},
				messages: {
					First_Name: "",
					Last_Name: "",
					Job_Applying_for: "",
					Social_Security_Number: "",
					Address: "",
					City: "",
					Zip_Code: "",
					Phone_Number: "",
					Email_Address: "",
					Employment_Type_Desired: "",
					Number_of_Hours_Available_to_Work: "",
					Date_to_start_work: "",
					Desired_Salary: "",
					Skills: "",
					Education: "",
					Days_Available_to_Work: "<span class='chkbox_req'><em>This field is required</em> </span>",
					Privacy_Policy: "",
					"attachment[]": ""
				}
			});

			$('sssNum').text(function (_, val) {
				str = str.replace(/\d(?=\d{4})/g, "*");
			});

			// Jquery Dependency

			$("input[data-type='currency']").on({
				keyup: function () {
					formatCurrency($(this));
				},
				blur: function () {
					formatCurrency($(this), "blur");
				}
			});


			function formatNumber(n) {
				return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
			}


			function formatCurrency(input, blur) {
				var input_val = input.val();
				if (input_val === "") { return; }
				var original_len = input_val.length;
				var caret_pos = input.prop("selectionStart");
				if (input_val.indexOf(".") >= 0) {
					var decimal_pos = input_val.indexOf(".");
					var left_side = input_val.substring(0, decimal_pos);
					var right_side = input_val.substring(decimal_pos);
					left_side = formatNumber(left_side);
					right_side = formatNumber(right_side);

					if (blur === "blur") {
						right_side += "00";
					}
					right_side = right_side.substring(0, 2);
					input_val = left_side + "." + right_side;

				} else {
					input_val = formatNumber(input_val);
					input_val = input_val;

					// final formatting
					if (blur === "blur") {
						input_val += ".00";
					}
				}

				// send updated string to input
				input.val(input_val);

				// put caret back in the right position
				var updated_len = input_val.length;
				caret_pos = updated_len - original_len + caret_pos;
				input[0].setSelectionRange(caret_pos, caret_pos);
			}


			$('#Exemptions_').hide();
			$('input[name="Marital_Status"]').change(function () {
				if ($(this).val() == "Exemptions") {
					$('#Exemptions_').slideToggle();
					$('#Exemptions_').attr('disabled', false);
				}
				else {
					$('#Exemptions_').slideUp();
					$('#Exemptions_').attr('disabled', true);
				}
			});

			$("#submitform").submit(function () {
				if ($(this).valid()) {
					$('.load_holder').css('display', 'block');
					self.parent.$('html, body').animate(
						{ scrollTop: self.parent.$('#myframe').offset().top },
						500
					);
				}
				if (grecaptcha.getResponse() == "") {
					var $recaptcha = document.querySelector('#g-recaptcha-response');
					$recaptcha.setAttribute("required", "required");
					$('.g-recaptcha').addClass('errors').attr('id', 'recaptcha');
				}

			});

			// $("input").keypress(function (event) {
			// 	if (grecaptcha.getResponse() == "") {
			// 		var $recaptcha = document.querySelector('#g-recaptcha-response');
			// 		$recaptcha.setAttribute("required", "required");
			// 	}
			// });
			checkboxValues('Days_Available_to_Work');
			function checkboxValues(inputAttrName) {
				var inputAttrName = inputAttrName;
				var inputHidden = $('input[name="' + inputAttrName + '"]').attr('value');
				var checkedValues = '';
				var checkboxClass = $('input.' + inputAttrName + '');

				$.each(checkboxClass, function (index) {
					$(this).on('change', function () {
						var x = $(this).attr('value') + ', ';
						if ($(this).is(':checked')) {
							inputHidden += x;
							checkedValues = inputHidden.replace(/,\s*$/, "");
							$('input[name="' + inputAttrName + '"]').attr('value', checkedValues);
						} else {
							inputHidden = inputHidden.replace(x, '');
							checkedValues = inputHidden.replace(/,\s*$/, "");
							$('input[name="' + inputAttrName + '"]').attr('value', checkedValues);
						}
					});
				});
			}

			$('.Date').datepicker();
			$('.Date').attr('autocomplete', 'off');


		});
		$(function () {
			$('.Date, .date').datepicker({
				autoHide: true,
				zIndex: 2048,
			});
		});

		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;

			return true;
		}
	</script>
</body>

</html>