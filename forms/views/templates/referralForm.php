<?php
defined('ACCESSIBLE') or exit('No direct script access allowed');
@session_start();

$formname = 'Send Your Referrals Form';
$prompt_message = '<span class="required-info">* Required Information</span>';
if ($_POST) {

	$result_recaptcha = Main::recaptcha($recaptcha_privite, $_POST);

	if (
		empty($_POST['Name_of_Referrer']) ||
		empty($_POST['Email_Address'])
	) {


		$asterisk = '<span style="color:#FF0000; font-weight:bold;">*&nbsp;</span>';
		$prompt_message = '<div id="error-msg"><div class="message"><span>Required Fields are empty</span><br/><p class="error-close">x</p></div></div>';
	} else if (!preg_match("/^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i", stripslashes(trim($_POST['Email_Address'])))) {
		$prompt_message = '<div id="recaptcha-error"><div class="message"><span>Please enter a valid email address</span><br/><p class="rclose">x</p></div></div>';
	} else if (!$result_recaptcha->success) {
		$prompt_message = '<div id="recaptcha-error"><div class="message"><span>Invalid <br>Recaptcha</span><p class="rclose">x</p></div></div>';
	} else {

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
				<div style="padding: 13px 30px 27px 30px;">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center" style="font-family: Poppins,sans-serif;font-size:14px; padding-bottom: 20px;"> 
	
					';

		if ($_POST['referralCount'] >= 1)
			$multipleref = 1;
		else
			$multipleref = 0;

		foreach ($_POST as $key => $value) {

			if ($key == 'submit')
				continue;
			elseif ($key == 'g-recaptcha-response')
				continue;
			elseif ($key == 'referralCount')
				continue;

			if (!empty($value)) {
				$key2 = str_replace('_', ' ', $key);
				if ($value == ':') {
					$body .= ' <tr margin-bottom="10px"> <td colspan="5" height="28" class="OFDPHeading" width="100%" style=" background:#F0F0F0; margin-bottom:5px;"><b style="padding-left: 4px;">' . $key2 . '</b></td></tr>';

				} else if ($key == 'Name' && $multipleref == 1) {
					$body .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
						<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: normal; word-wrap: anywhere; "><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . htmlspecialchars(trim($value), ENT_QUOTES) . '</span> </td></tr>';

				} else if ($key == '_Email_Address' && $multipleref == 1) {
					$body .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
						<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: normal; word-wrap: anywhere; "><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . htmlspecialchars(trim($value), ENT_QUOTES) . '</span> </td></tr>';

				} else if ($key == 'Contact_Number' && $multipleref == 1) {
					$body .= '<tr><td class="Values1"colspan="2" height="28" align="left" width="40%" padding="100" style="line-height: normal; padding-left: 4px;text-justify: inter-word; word-wrap: anywhere; padding-right: 28px;">
						<span style="position:relative !important;"><b>' . $key2 . '</b></span >:</td> <td class="Values2"colspan="2" height="28" align="left" width="50%" padding="10" style="line-height: normal; word-wrap: anywhere; "><span style="margin-top: 7px; position:relative;margin-left: 7px; border-collapse: collapse; display: inline-block;margin-bottom: 5px;margin-right: 7px;">' . htmlspecialchars(trim($value), ENT_QUOTES) . '</span> </td></tr>';
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

		// save data form on database
		$subject = $formname;
		$attachments = array();


		$name = $_POST['Name_of_Referrer'];
		$result = insertDB($name, $subject, $body, $attachments);

		$parameter = array(
			'body' => $body,
			'from' => $from_email,
			'from_name' => $from_name,
			'to' => $to_email,
			'subject' => 'New Message Notification',
			'attachment' => $attachments
		);

		$prompt_message = send_email($parameter, $success_msg, $error_msg);
		unset($_POST);
	}

}
/*************declaration starts here************/

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

	<!-- <style media="screen">
		.message {
			padding: 71px !important;
		}

		label.error {
			display: none !important;
		}

		.disclaimer {
				margin: 10px 0 10px 0px;
				width: 100%;
				}
	</style> -->

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
									<i class="fas fa-eye"></i> </button>
							</div>
							
						<?php endif; ?>

						<form id="submitform" name="contact" method="post" enctype="multipart/form-data" action="">
							<?php echo $prompt_message; ?>

							<div class="form_box">
								<div class="form_box_col2">
									<div class="group">
										<?php
										// @param label-name, if required
										$input->label('Name of Referrer', '*');
										// @param field name, class, id and attribute
										$input->fields('Name_of_Referrer', 'form_field', 'Name_of_Referrer', 'placeholder="Enter name of referrer here"');
										?>
									</div>
									<div class="group">
										<?php
										// @param label-name, if required
										$input->label('Email Address', '*');
										// @param field name, class, id and attribute
										$input->fields('Email_Address', 'form_field', 'Email_Address', 'placeholder="example@domain.com"');
										?>
									</div>
								</div>

							</div>

							<div class="form_box">
								<p class="strong_head">Referral(s)</p>
								<input type="hidden" name="Referral(s)" value=":" />
							</div>

							<div class="cloneField">
								<div class="form_box">
									<div class="form_box_col1 referral_name">
										<div class="group">
											<?php
											// @param label-name, if required
											$input->label('Name');
											// @param field name, class, id and attribute
											$input->fields('Name', 'form_field', 'Name', 'placeholder="Enter name here"');
											?>
										</div>
									</div>
								</div>
								<div class="form_box">
									<div class="form_box_col2">
										<div class="group">
											<div class="referral_email">
												<?php
												// @param label-name, if required
												$input->label('Email Address');
												// @param field name, class, id and attribute
												
												?>
												<input type="text" name="_Email_Address" id="_Email_Address"
													class="form_field" placeholder="example@domain.com">
											</div>
										</div>
										<div class="group">
											<div class="referral_phone">
												<?php
												// @param label-name, if required
												$input->label('Contact Number');
												// @param field name, class, id and attribute
												?>
												<input type="text" class="form_field" name="Contact_Number" maxlength=""
													onkeypress="return isNumberKey(event)"
													placeholder='Enter number here'>
											</div>
										</div>
										<div class="referral_count">
											<input type="text" name="referralCount" id="count" hidden>
											<!--don't delete-->
										</div>
									</div>
								</div>

							</div>
							<hr>
							<div class="addreferral">
							</div>

							<div class="addMore"><i class="fas fa-plus-circle"></i> Add more referrals...</div>

							<div class="disclaimer">
							<p><input type="checkbox" name="Privacy_Policy" style="-webkit-appearance:checkbox" /> <b>By submitting this form you agree to the terms of the <a href="<?php echo get_home_url();?>/privacy-policy" target="_blank">Privacy Policy</a>.</b></p>
							</div>



							<div class="form_box5 secode_box">
								<div class="group">
									<div class="inner_form_box1 recapBtn">
										<div class="g-recaptcha" data-sitekey="<?php echo $recaptcha_sitekey; ?>"></div>
										<div class="btn-submit"><input type="submit" class="form_button"
												value="SUBMIT" /></div>
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
				ignore: ":hidden",
				rules: {
					Name_of_Referrer: "required",
					Privacy_Policy:  "required",
					Prayer_Request: "required",
					Email_Address: {
						required: true,
						email: true
					},
					_Email_Address: {
						email: true
					}
				},
				messages: {
					Name_of_Referrer: "",
					Privacy_Policy: "",
					Prayer_Request: "",
					Email_Address: "",
					_Email_Address: ""
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

				if ($('.referral_count input:text').val().length == 0) {
					$(".addreferral input").each(function () {
						if ($(this).val() == "") {
							$('.referral_count input:text').val(0);
						} else
							$('.referral_count input:text').val(1);
					});
				}


			});


			// $("input").keypress(function (event) {
			// 	if (grecaptcha.getResponse() == "") {
			// 		var $recaptcha = document.querySelector('#g-recaptcha-response');
			// 		$recaptcha.setAttribute("required", "required");
			// 	}
			// });


		});

		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;

			return true;
		}

		function removeHTML(id) {
			$('#mainCloneCount_' + id).remove();
		}
	</script>


</body>

</html>