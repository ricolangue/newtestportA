

<!-- Header -->
<header>
	<div class="wrapper">
		<div class="header_con">
			<div class="main_logo">
			  <a href="<?php echo get_home_url(); ?>"><figure><img src="<?php bloginfo('template_url');?>/images/main-logo.png" alt="<?php echo get_bloginfo('name');?>"></figure></a>
			</div>

			<div class="head_info">
				
				<div class="header_info">
          <?php dynamic_sidebar('header_info');?>
				</div>

				<div class="g_trans">
					<?php echo do_shortcode('[gtranslate]'); ?>
				</div>
				
			</div>
		</div>
	  <div class="clearfix"></div>
	</div>
</header>
<!-- End Header -->
