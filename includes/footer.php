

<!--Footer -->
<footer>
<div class="footer_top">
	<div class="wrapper">
		<div class="footer_top_con">

			<div class="contact_info">
				<div class="contact_info_heading">
          <?php dynamic_sidebar('contact_info_heading');?>
				</div>
				<div class="contact_info_list">
					<div class="contact_info_list1">
            <?php dynamic_sidebar('contact_info_list1');?>
					</div>
					<div class="contact_info_list2">
            <?php dynamic_sidebar('contact_info_list2');?>
					</div>
				</div>

				<div class="footer_right">
					<div class="footer_logo">
						<a href="<?php echo get_home_url(); ?>"><figure><img src="<?php bloginfo('template_url');?>/images/footer-logo.png" alt="<?php echo get_bloginfo('name');?>"></figure></a>
					</div>
					<div class="copyright">
						&copy; Copyright
							<?php
							$start_year = '2024';
							$current_year = date('Y');
							$copyright = ($current_year == $start_year) ? $start_year : $start_year.' - '.$current_year;
							echo $copyright;
							?>
						<span class="footer_comp"><?php //echo get_bloginfo('name');?><a class="privacy_pol" href="privacy-policy">Privacy Policy </a></span>
						<a class="copyrigh_text">Designed by</a> Proweaver
					</div>

					<div class="social_media jello-horizontal">
						<ul>
							<li><a href="https://www.facebook.com" target="_blank"><figure><img src="<?php bloginfo('template_url');?>/images/icons/fb-icon.png" alt="facebook"></figure></a></li>
							<li><a href="https://www.twitter.com" target="_blank"><figure><img src="<?php bloginfo('template_url');?>/images/icons/twitter-icon.png" alt="twitter"></figure></a></li>
						</ul>
					</div>
				</div>

			</div>

			<div class="footer_nav">
          <?php wp_nav_menu( array('theme_location' => 'secondary' ) ); ?>
				</div>
			
		</div>
	</div>
</div>

<div class="footer_btm">
  <div class="wrapper">
			<div class="footer_btm_con">
        

			</div>
		</div>
</div>
</footer>

	<span class="back_top"></span>

  </div> <!-- End Clearfix -->
  </div> <!-- End Protect Me -->

  <?php get_includes('ie');?>

  <!--
  Solved HTML5 & CSS IE Issues
  -->
  <script src="<?php bloginfo('template_url');?>/js/modernizr-custom-v2.7.1.min.js"></script>
	<script src="<?php bloginfo('template_url');?>/js/jquery-3.7.1.min.js"></script>
	<script src="<?php bloginfo('template_url');?>/js/jquery-migrate-3.5.0.min.js"></script>
	

  <!--
  Solved Psuedo Elements IE Issues
  -->
  <script src="<?php bloginfo('template_url');?>/js/calcheight.min.js"></script>
  <script src="<?php bloginfo('template_url');?>/js/jquery.easing.1.3.js"></script>
  <script src="<?php bloginfo('template_url');?>/js/jquery.skitter.min.js"></script>
  <script src="<?php bloginfo('template_url');?>/js/responsiveslides.min.js"></script>
  <script src="<?php bloginfo('template_url');?>/js/plugins.min.js"></script>
  <script src="<?php bloginfo('template_url');?>/js/wow.min.js"></script>
	<script src="<?php bloginfo('template_url');?>/js/owl.carousel.min.js"></script>
  <script src='https://www.google.com/recaptcha/api.js'></script>
  <?php wp_footer(); ?>
</body>
</html>
<!-- End Footer -->
