
<?php
define('ACCESSIBLE', true);
unset($_SESSION);

@session_start();
$foldername = get_template();

$formname = 'Send Us a Message Form';
$prompt_message = '<span style="color:#ff0000;"></span>';
require_once 'wp-content/themes/'.$foldername.'/forms/config.php';
if(isset($_POST['submit_info'])){

	$robot = $_POST['Robot'];

	$ch = curl_init();
	 curl_setopt($ch, CURLOPT_URL,"https://www.google.com/recaptcha/api/siteverify");
	 curl_setopt($ch, CURLOPT_POST, 1);
	 curl_setopt($ch, CURLOPT_POSTFIELDS, "secret={$recaptcha_privite}&response={$_POST['g-recaptcha-response']}");
	 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	 $server_output = curl_exec($ch);
	 $result_recaptcha = json_decode($server_output);
	 curl_close ($ch);

	$_SESSION['Full_Name'] = (isset($_POST['Full_Name'])) ? $_POST['Full_Name'] : '';
  	$_SESSION['Email_Address'] = (isset($_POST['Email_Address'])) ? $_POST['Email_Address'] : '';
  	$_SESSION['Question_or_Comment'] = (isset($_POST['Question_or_Comment'])) ? $_POST['Question_or_Comment'] : '';
	$_SESSION['Robot'] = (isset($_POST['Robot'])) ? $_POST['Robot'] : '';
	
	if(empty($_POST['Full_Name']) ||
	empty($_POST['Email_Address'])
	) {

	$asterisk = '<span style="color:#FF0000; font-weight:bold;">*&nbsp;</span>';
	$prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>* Required Fields are empty.</span></p><br/><p class="error-close">x</p></div></div>';
	}
	else if(!preg_match("/^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i",stripslashes(trim($_POST['Email_Address']))))
		{ $prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>Please enter a valid email address.</span></p><br/><p class="error-close">x</p></div></div>'; }
	else if(!$result_recaptcha->success)
		{ $prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>Invalid reCAPTCHA</span></p><br/><p class="error-close">x</p></div></div>'; }
	else if (!empty($robot)) {
		$prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>YOU\'RE A MALICIOUS SPAMMER! STAY AWAY!</span></p><br/><p class="error-close">x</p></div></div>';
	}else if(preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",stripslashes(trim($_POST['Full_Name'])))){
		$prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>YOU\'RE A MALICIOUS SPAMMER! STAY AWAY!</span></p><br/><p class="error-close">x</p></div></div>';
	}else if(preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",stripslashes(trim($_POST['Question_or_Comment'])))){
		$prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>YOU\'RE A MALICIOUS SPAMMER! STAY AWAY!</span></p><br/><p class="error-close">x</p></div></div>';
	}else if(preg_match("/[+&@#\/%?=~_|!:,.;]/",stripslashes(trim($_POST['Full_Name'])))){
		$prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>YOU\'RE A MALICIOUS SPAMMER! STAY AWAY!</span></p><br/><p class="error-close">x</p></div></div>';
	}else if(preg_match("/(Bali|BALI|bali)/",stripslashes(trim($_POST['Full_Name'])))){
		$prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>YOU\'RE A MALICIOUS SPAMMER! STAY AWAY!</span></p><br/><p class="error-close">x</p></div></div>';
	}else if(preg_match("/(http|ftp|href)/",stripslashes(trim($_POST['Question_or_Comment'])))){
		$prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>YOU\'RE A MALICIOUS SPAMMER! STAY AWAY!</span></p><br/><p class="error-close">x</p></div></div>';
	}else if(preg_match("/(Bali|BALI|bali|Villa|VILLA|villa)/",stripslashes(trim($_POST['Question_or_Comment'])))){
		$prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>YOU\'RE A MALICIOUS SPAMMER! STAY AWAY!</span></p><br/><p class="error-close">x</p></div></div>';
	}else if(preg_match("/(bagat|store|ru|yourmail|bagat-1.ru|bagat-4.ru)/",stripslashes(trim($_POST['Email_Address'])))){
		$prompt_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>YOU\'RE A MALICIOUS SPAMMER! STAY AWAY!</span></p><br/><p class="error-close">x</p></div></div>';
	} 

	else{

		$body = '<div class="form_table" style="width:700px; height:auto; font-size:12px; color:#333333; letter-spacing:1px; line-height:20px; margin: 0 auto;">
			<div style="border:8px double #c3c3d0; padding:12px;">
			<div align="center" style="font-size:22px; font-family:Times New Roman, Times, serif; color:#051d38;">'.COMP_NAME.'</div>
			<div align="center" style="color:#990000; font-style:italic; font-size:20px; font-family:Arial; margin:bottom: 15px;">('.$formname.')</div>

			<table width="90%" cellspacing="2" cellpadding="5" align="center" style="font-family:Verdana; font-size:13px">
				';

			foreach($_POST as $key => $value){
				if($key == 'secode') continue;
				elseif($key == 'submit_info') continue;
                elseif($key == 'g-recaptcha-response') continue;
				
				if(!empty($value)){
					$key2 = str_replace('_', ' ', $key);
					if($value == ':') {
						$body .= '<tr><td colspan="2" style="background:#F0F0F0; line-height:30px"><b>'.$key2.'</b></td></tr>';
					}else if($key == "Privacy_Policy"){
					$body .= '<tr><td colspan="3" line-height:30px">

					<input type="checkbox" checked disabled /> By submitting this form you agree to the terms of the Privacy Policy.

					</td></tr>';
				} else {
						$body .= '<tr><td><b>'.$key2.'</b>:</td> <td>'.htmlspecialchars(trim($value), ENT_QUOTES).'</td></tr>';
					}
				}
			}
			$body .= '
			</table>

			</div>
			</div>';

		// for email notification
		include 'wp-content/themes/'.$foldername.'/forms/send_email_curl.php';

		// save data form on database
		include 'wp-content/themes/'.$foldername.'/forms/savedb2.php';

		// save data form on database
		$subject = $formname ;
		$attachments = array();

	 	//name of sender
		$name = $_POST['Full_Name'];
		$result = insertDB($name,$subject,$body,$attachments);

		$parameter = array(
			'body' => $body,
			'from' => $from_email,
			'from_name' => $from_name,
			'to' => $to_email,
			'subject' => 'New Message Notification',
			'attachment' => $attachments
		); 

		$success_message = '<div id="success"><div class="message"><p class="success-check"><span>THANK YOU</span><br/> <span>for sending us a message!</span><br/><span>We will be in touch with you soon.</span></p><p class="close">x</p></div></div>';
		$failed_message = '<div id="error-msg"><div class="message"><p class="fail-check"><span>Failed to send email. Please try again.</span></p><br/><p class="error-close">x</p></div></div>';
			
		$prompt_message = send_email($parameter, $success_message, $failed_message);
		unset($_SESSION);
	}

}
/*************declaration starts here************/
?>

<?php echo $prompt_message; ?>

<!-- Bottom -->
<div id="bottom1">
	<div class="wrapper">
		<div class="btm1_con">

    <?php dynamic_sidebar('btm1_info');?>

			

			<div class="btm1_boxes">

				<section class="btm1_box1 wow zoomIn" data-wow-duration="2045ms" data-wow-delay="1s">
          <?php dynamic_sidebar('btm1_box1');?>
				</section>

				<section class="btm1_box2 wow zoomIn" data-wow-duration="2045ms" data-wow-delay="1s">
          <?php dynamic_sidebar('btm1_box2');?>
				</section>

				<section class="btm1_box3 wow zoomIn" data-wow-duration="2045ms" data-wow-delay="1s">
          <?php dynamic_sidebar('btm1_box3');?>
				</section>

			</div>

		</div>
	</div>
</div>

<div id="bottom2" class="hidden">
	<div class="wrapper">
		<div class="btm2_con">
		
		</div>
	</div>
</div>

<div id="bottom3">
	<figure class="btm3_img hidden"><img src="<?php bloginfo('template_url');?>/images/btm3-img.jpg" alt="group of workers smiling"></figure>
	<div class="wrapper">
		<div class="btm3_con">

			<div class="btm_form">
				<div class="btm3_info">
          <?php dynamic_sidebar('btm3_info');?>
				</div>
				<form class="form" id="submit_formmessage" action="#bottom3" method="post">
					<div id="invalid-msg"></div>
					<input type="text" name="Robot" placeholder="Spam" value="<?php echo $_SESSION['Robot']; ?>" style="display:none;">
							<input class="form_fullname btm_input1" type="text" name="Full_Name" value="<?php echo $_SESSION['Full_Name']; ?>" placeholder="* Full Name " required="">
							<input class="form_email btm_input2" type="email" name="Email_Address" value="<?php echo $_SESSION['Email_Address']; ?>" placeholder="* Email Address " required="">
						<textarea class="btm_input3" name="Question_or_Comment" placeholder="Message(s)"></textarea>
						<div class="btn_submit">
						<div class="disclaimer">
							<p><input type="checkbox" class="form_chkbox" name="Privacy_Policy" style="-webkit-appearance:checkbox" required /> <b>By submitting this form you agree to the terms of the <a href="<?php echo get_home_url();?>/privacy-policy" target="_blank">Privacy Policy</a>.</b></p>
							</div>
							<div class="captcha-box"><div class="g-recaptcha" data-sitekey="<?php echo $recaptcha_sitekey; ?>"></div></div>
							<button type="submit" name="submit_info" class="form_btn btn-5">Submit <span class="btn_all"></span></button>
							
						</div>
				</form>
			</div>

		</div>
	</div>
</div>

<div id="bottom4">
	<div class="wrapper">
		<div class="btm4_con">

			<div class="btm4_info">
        <?php dynamic_sidebar('btm4_info');?>
			</div>

			<div class="btm4_boxes owl-carousel">

				<section class="btm4_box1">
					<figure><img src="<?php bloginfo('template_url');?>/images/btm4-img1.jpg" alt="group of workers smiling"></figure>
					<h2> <span>September 20, 2024
					</span> The Importance of General Staffing in Today’s Workforce </h2>
					<a href="javascript:;"></a>
				</section>

				<section class="btm4_box2">
					<figure><img src="<?php bloginfo('template_url');?>/images/btm4-img2.jpg" alt="four staff smiling"></figure>
					<h2> <span>November 3, 2024
					</span> Understanding the Different Types of Staffing Services </h2>
					<a href="javascript:;"></a>
				</section>

				<section class="btm4_box3">
					<figure><img src="<?php bloginfo('template_url');?>/images/btm4-img3.jpg" alt="group of people having meeting"></figure>
					<h2> <span>December 5, 2024
					</span> Top Skills Employers Look for in General Staffing Candidates </h2>
					<a href="javascript:;"></a>
				</section>

			</div>

		</div>
	</div>
</div>

<!-- End Bottom -->