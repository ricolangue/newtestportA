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
				} else if ($key == "Privacy_Policy") {
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

									<div class="group">

										<?php

										$input->label('Full Name', '*');

										$input->fields('First_Name', 'form_field', 'First_Name', 'placeholder="First Name"');

										?>

									</div>

									<div class="group lbl">

										<?php

										$input->label('&nbsp;', '');

										$input->fields('Middle Initial', 'form_field', 'Middle Initial', 'placeholder="Middle Initial"');

										?>

									</div>

									<div class="group lbl">

										<?php

										$input->label('&nbsp;', '');

										$input->fields('Last_Name', 'form_field', 'Last_Name', 'placeholder="Last Name"');

										?>

									</div>

								</div>

							</div>



							<div class="form_box">

								<div class="form_box_col2">

									<div class="group">

										<?php

										// @param label-name, if required
										
										$input->label('Address (City and State)', '*');

										// @param field name, class, id and attribute
										
										$input->fields('Address', 'form_field', 'Address', 'placeholder="Enter address here"');

										?>

									</div>

									<div class="group">

										<?php

										// @param label-name, if required
										
										$input->label('Birth Date', '');

										// @param field name, class, id and attribute
										
										$input->fields('Birth_Date', 'form_field Date', 'Birth_Date', 'placeholder="Enter date here"');

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
										
										$input->label('Employment Type Desired', '*');

										$input->radio('Employment_Type_Desired', array('Full-Time', 'Part-Time', 'Per Diem'), '', '', '3');

										?>

									</div>

								</div>

							</div>







							<div class="form_box" id="Are_you_a_citizen_of_the_United_Statesno">

								<div class="form_box_col1">

									<div class="group">

										<?php

										$input->label('Are you over the age of 18?', '*');

										// @param field name, class, id and attribute
										
										$input->radio('Are_you_over_the_age_of_18', array('Yes', 'No'), '', '', '2');

										?>

									</div>

								</div>

							</div>



							<div class="form_box" id="Are_you_a_citizen_of_the_United_Statesno">

								<div class="form_box_col1">

									<div class="group">

										<?php

										$input->label('Are you authorized to work in the U.S.?', '*');

										// @param field name, class, id and attribute
										
										$input->radio('Are_you_authorized_to_work_in_the_U_S', array('Yes', 'No'), '', '', '2');

										?>

									</div>

								</div>

							</div>



							<div class="fieldheader">Education History</div><input type="hidden"
								name="Education History" value=":">





							<div class="form_box">

								<div class="form_box_col2">

									<div class="group">



										<div class="education_history_high_school_name">

											<?php

											// @param label-name, if required
											
											$input->label('High School Name', '');

											// @param field name, class, id and attribute
											
											$input->fields('High_School_Name', 'form_field', 'High_School_Name', 'placeholder="Enter high school name here"');

											?>

										</div>

									</div>



									<div class="group">

										<div class="education_history_address">

											<?php

											// @param label-name, if required
											
											$input->label('Address (City and State)', '');

											// @param field name, class, id and attribute
											
											$input->fields('Address____', 'form_field', 'Address____', 'placeholder="Enter address here"');

											?>

										</div>



									</div>

								</div>

							</div>



							<div class="form_box">

								<div class="form_box_col1">

									<div class="group">

										<div class="education_history_did_you_graduate">

											<?php

											// @param label-name, if required
											
											$input->label('Did you graduate?', '');

											// @param field name, class, id and attribute
											
											$input->radio('_Did_you_graduate', array('Yes', 'No'), '', '', '2');

											?>

										</div>

									</div>

								</div>

							</div>







							<div class="cloneFieldd">

								<hr>

								<div class="form_box">

									<div class="form_box_col2">

										<div class="group">

											<div class="education_history_college_name">

												<?php

												// @param label-name, if required
												
												$input->label('College/University', '');

												// @param field name, class, id and attribute
												
												$input->fields('College_or_University', 'form_field', 'College_or_University', 'placeholder="Enter college or univesity here"');

												?>

											</div>

										</div>

										<div class="group">

											<div class="education_history_address1">

												<?php

												// @param label-name, if required
												
												$input->label('Address (City and State)', '');

												// @param field name, class, id and attribute
												
												$input->fields('Address_____', 'form_field', 'Address_____', 'placeholder="Enter address here"');

												?>

											</div>

										</div>

									</div>

								</div>







								<div class="form_box">

									<div class="form_box_col2">

										<div class="group">



											<div class="education_history_did_you_graduate1">





												<?php

												// @param label-name, if required
												
												$input->label('Did you graduate?', '');

												// @param field name, class, id and attribute
												
												//$input->radio('Did_you_graduate_', array('Yes', 'No'), '', '', '2');
												
												?>

												<table class="radio" cellspacing="0" cellpadding="0" border="0">
													<tbody>
														<tr>
															<td style="width: 49.75%;" class="item_type1">
																<input type="radio" name="Did_you_graduate" value="Yes"
																	id="Did_you_graduate0">
																<label for="Did_you_graduate0"
																	style="font-weight:normal;">Yes
																</label>
															</td>
															<td style="width: 49.75%;" class="item_type2">
																<input type="radio" name="Did_you_graduate" value="No"
																	id="Did_you_graduate1">
																<label for="Did_you_graduate1"
																	style="font-weight:normal;">No
																</label>
															</td>
														</tr>
													</tbody>
												</table>


											</div>



										</div>

										<div class="group">



											<div class="education_history_diploma1">

												<?php

												// @param label-name, if required
												
												$input->label('Degree', '');

												// @param field name, class, id and attribute
												
												$input->fields('Degree_', 'form_field', 'Diploma_', 'placeholder="Enter degree here"');

												?>

											</div>

										</div>

									</div>

								</div>

							</div>





							<div class="referral_count">

								<input type="text" name="referralCount" id="count" hidden>

								<!--don't delete-->

							</div>



							<div class="addWorkExp"></div>



							<div class="addMoree"><i class="fas fa-plus-circle"></i> Add more education history...</div>


							<p class="fieldheader">Certifications</p>

							<div class="clearfix"></div>
							<br />

							<input type="hidden" name="Certifications___" value=":">

							<div class="form_box">

								<div class="form_box_col1">

									<div class="education_history_certifications_">

										<div class="group">

											<?php

											// @param label-name, if required
											
											$input->label('Certifications', '');

											// @param field name, class, id and attribute
											
											$input->chkboxVal('Certifications', array('BLS', 'ACLS', 'CALS', 'CCRN', 'NIHSS', 'Other'), '', '', '3');

											//$input->fields('Other', 'form_field option','Other','placeholder="Enter other here"');
											
											?>

										</div>

										<div class="group" id="ifOther1">

											<?php

											$input->fields('Other', 'form_field option', 'Other', 'placeholder="Please specify here"');

											?>

										</div>

									</div>

								</div>

							</div>

							<hr>

							<p class="fieldheader">Licensure</p>

							<input type="hidden" name="Licensure" value=":">


							<div class="clearfix"></div>
							<br />


							<div class="cloneField__">

								<div class="form_box">

									<div class="form_box_col2">



										<div class="group">

											<div class="add_type_number">

												<?php

												// @param label-name, if required
												
												$input->label('Type or Number', '');

												// @param field name, class, id and attribute
												
												$input->fields('Type_or_Number', 'form_field', 'Type_or_Number', 'placeholder="Enter details here"');

												?>

											</div>

										</div>



										<div class="group">

											<div class="add_State">

												<?php

												// @param label-name, if required
												
												$input->label('State', '');

												// @param field name, class, id and attribute
												
												$input->select('State__', 'form_field', $state, 'State__');

												?>

											</div>

										</div>

									</div>

								</div>

								<hr>

							</div>

							<div class="referral_count">

								<input type="text" name="referralCount" id="count" hidden>

								<!--don't delete-->

							</div>

							<div class="addWorkLicensure"></div>



							<div class="addMoresss"><i class="fas fa-plus-circle"></i> Add more License</div>



							<hr>

							<p class="fieldheader">Work History</p>

							<input type="hidden" name="Work History" value=":">



							<div class="cloneField">



								<div class="form_box">

									<div class="form_box_col2">



										<div class="group">



											<div class="work_history_company">

												<?php

												$input->label('Company', '');

												$input->fields('_Company', 'form_field', '_Company', 'placeholder="Enter company here"');

												?>

											</div>

										</div>



										<div class="group">

											<div class="work_history_phone">

												<?php

												$input->label('Phone', '');

												$input->phoneInput('_Phone', 'form_field', '_Phone', 'placeholder="Enter phone here"');

												?>

											</div>

										</div>

									</div>



								</div>







								<div class="form_box">

									<div class="form_box_col1">



										<div class="group">

											<div class="work_history_address">

												<?php

												$input->label(' Address (City and State)', '');

												$input->fields('_Address', 'form_field', '_Address', 'placeholder="Enter address here"');

												?>

											</div>

										</div>



									</div>

								</div>



								<div class="form_box">

									<div class="form_box_col1">

										<!--

								<div class="group">

								<div class ="work_history_supervisor">

									< ?php

										$input->label('Supervisor', '');

										$input->fields('_Supervisor', 'form_field','_Supervisor','placeholder="Enter supervisor here"');

									?>

								</div>

				</div> -->



										<div class="group">

											<div class="work_history_job_title">

												<?php

												$input->label('Job Title', '');

												$input->fields('_Job_Title', 'form_field', '_Job_Title', 'placeholder="Enter job title here"');

												?>

											</div>

										</div>

									</div>



								</div>





								<div class="form_box">

									<div class="form_box_col1">



										<div class="group">

											<div class="work_history_responsibilities">

												<?php

												$input->label('Responsibilities', '');

												$input->textarea('_Responsibilities', 'form_field', '_Responsibilities', 'placeholder="Enter responsibilities here"');

												?>

											</div>

										</div>

									</div>



								</div>







								<div class="form_box">

									<div class="form_box_col2">



										<div class="group">

											<div class="work_history_from">

												<?php

												$input->label('From', '');

												$input->fields('_From', 'form_field Date', '_From', 'placeholder="Enter from here"');

												?>

											</div>

										</div>



										<div class="group">

											<div class="work_history_to">

												<?php

												$input->label('To', '');

												$input->fields('_To', 'form_field Date', '_To', 'placeholder="Enter to here"');

												?>

											</div>

										</div>

									</div>



								</div>





								<div class="form_box">

									<div class="form_box_col1">

										<div class="group">

											<div class="work_history_reason_for_leaving">

												<?php

												$input->label('Reason for Leaving', '');

												$input->textarea('Reason_for_Leaving_', 'form_field', 'Reason_for_Leaving_', 'placeholder="Enter reason for leaving here"');

												?>

											</div>

										</div>

									</div>



								</div>



							</div>





							<div class="referral_count">

								<input type="text" name="referralCount" id="count" hidden>

								<!--don't delete-->

							</div>

							<hr>



							<div class="work_history"></div>



							<div class="addMore"><i class="fas fa-plus-circle"></i> Add more work history...</div>



							<hr>



							<div class="form_box">

								<div class="form_box_col1">

									<div class="group">

										<?php

										$input->label('Have you ever been convicted as a felony?', '');

										// @param field name, class, id and attribute
										
										$input->radio('Have_you_ever_been_convicted_as_a_felony', array('Yes', 'No'), '', '', '2');

										?>

									</div>

								</div>

							</div>



							<div class="form_box" id="ifOther">

								<div class="form_box_col1">

									<div class="group">

										<?php

										$input->fields('Why_have_you_ever_been_convicted_as_a_felony', 'form_field', 'Why_have_you_ever_been_convicted_as_a_felony', 'placeholder="Please explain here"');

										?>

									</div>

								</div>

							</div>







							<p class="fieldheader">3 Professional References</p>

							<input type="hidden" name="Professional References" value=":">



							<div class="cloneField_">









								<div class="form_box">

									<div class="form_box_col1">



										<div class="group">

											<div class="professional_references_full_name">

												<?php

												$input->label('Name', '');

												$input->fields('Name_', 'form_field', 'Name_', 'placeholder="Enter full name here"');

												?>

											</div>

										</div>

										<!-- <div class="group">

								<div class ="professional_references_relationship_">

									< ?php

										$input->label('Relationship', '');

										$input->fields('Relationship_', 'form_field','Relationship_','placeholder="Enter relationship here"');

									?>

								</div>

						</div> -->

									</div>

								</div>





								<div class="form_box">

									<div class="form_box_col2">



										<div class="group">

											<div class="professional_references_company_">

												<?php

												$input->label('Email Address', '');

												$input->fields('Email_Address_', 'form_field', 'Email_Address_', 'placeholder="Example@domain.com"');

												?>

											</div>

										</div>



										<div class="group">

											<div class="professional_references_phone_">

												<?php

												$input->label('Phone', '');

												$input->phoneInput('Phone_', 'form_field', 'Phone_', 'placeholder="Enter phone here"');

												?>

											</div>

										</div>

									</div>



								</div>





								<div class="form_box">

									<div class="form_box_col1">





										<div class="group">

											<div class="professional_references_address____">

												<?php

												$input->label('Position or Title', '');

												$input->fields('Position_or_Title', 'form_field', 'Position_or_Title', 'placeholder="Enter position or title here"');

												?>

											</div>

										</div>

									</div>



								</div>



							</div>



							<div class="referral_count">

								<input type="text" name="referralCount" id="count" hidden>

								<!--don't delete-->

							</div>

							<hr>



							<div class="professional_references"></div>



							<div class="addMores"><i class="fas fa-plus-circle"></i> Add more professional references...
							</div>



							<hr>











							<p class="fieldheader">MILITARY SERVICE</p>

							<input type="hidden" name="MILITARY SERVICE" value=":">

							<div class="clearfix"></div>
							<br />



							<div class="form_box">



								<div class="form_box_col2">

									<div class="group">

										<?php

										$input->label('Military Service', '');

										$input->radio('Military_Service', array('Yes', 'No'), '', '', '2');

										?>

									</div>



									<div class="group">

										<?php

										$input->label('Branch', '');

										$input->fields('Branch', 'form_field', 'Branch', 'placeholder="Enter branch here"');

										?>

									</div>

								</div>



							</div>







							<div class="form_box">



								<div class="form_box_col1">

									<div class="group">

										<?php

										$input->label('', '');

										$input->radio('Military_Service_', array('Active', 'Inactive'), '', '', '2');

										?>

									</div>



								</div>



							</div>



							<div class="form_box">

								<div class="form_box_col1">

									<div class="group">

										<?php

										// @param label-name, if required
										
										$input->label('Upload resume here <span style="font-style: italic; font-size: 13px; text-transform: lowercase; color:#b1b1b1;">(accepted file formats: .doc, .docx, .pdf | Max: 10MB)</span>', '');

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
									class="fas fa-info-circle"></i><span>Upload

									Error!</span> <span class="suberror"> </span>
							</div>


							<div class="clearfix"></div>

							<div class="disclaimer">
								<p><input type="checkbox" name="Privacy_Policy" style="-webkit-appearance:checkbox" />
									<b>By submitting this form you agree to the terms of the <a
											href="<?php echo get_home_url(); ?>/privacy-policy" target="_blank">Privacy
											Policy</a>.</b>
								</p>
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
					Job_Applying_for: "required",
					First_Name: "required",
					Last_Name: "required",
					Address: "required",
					Phone_Number: "required",
					Employment_Type_Desired: "required",
					Are_you_over_the_age_of_18: "required",
					Are_you_authorized_to_work_in_the_U_S: "required",
					Email_Address: {
						required: true,
						email: true
					},
					Privacy_Policy: "required"
				},
				messages: {
					Job_Applying_for: "",
					First_Name: "",
					Last_Name: "",
					Address: "",
					Phone_Number: "",
					Employment_Type_Desired: "",
					Are_you_over_the_age_of_18: "",
					Are_you_authorized_to_work_in_the_U_S: "",
					Email_Address: "",
					Privacy_Policy: ""
					//Available_Shift_Times: "<span class='chkbox_req'><em>This field is required</em> </span>",
					//Days_Available: "<span class='chkbox_req'><em>This field is required</em> </span>",
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
				if (input_val === "") {
					return;
				}
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
				} else {
					$('#Exemptions_').slideUp();
					$('#Exemptions_').attr('disabled', true);
				}
			});

			$("#submitform").submit(function () {
				if ($(this).valid()) {
					$('.load_holder').css('display', 'block');
					self.parent.$('html, body').animate({
						scrollTop: self.parent.$('#myframe').offset().top
					},
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
			// }); Certifications
			checkboxValues('Days_Available_to_Work');
			checkboxValues('Certifications');

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

			$("#ifOther1").hide();
			$("#Certifications_6").change(function () {
				if ($(this).is(':checked')) {
					$("#ifOther1").fadeIn();
					$("#ifOther1").find(':input').attr('disabled', false);
				} else {
					$("#ifOther1").fadeOut();
					$("#ifOther1").find(':input').attr('disabled', 'disabled');
				}
			});

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