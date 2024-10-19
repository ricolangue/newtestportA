<!DOCTYPE html>
<!--[if lt IE 10]>      <html class="no-js lt-ie11 lt-ie10 lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 10]>         <html class="no-js lt-ie11 lt-ie10 lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 11]>         <html class="no-js lt-ie11"> <![endif]-->
<!--[if gt IE 11]><!-->
<html class="no-js" lang="en-US"> <!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->

	<title><?php echo get_bloginfo('name'); ?></title>

	<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/style.min.css">
	<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/hamburgers.min.css">
	<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/media.min.css">
	<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/rslides.min.css">
	<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/font-awesome.min.css">
	<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/skitter.styles.min.css" type="text/css"
		media="all">
	<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/animate.min.css">
	<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/css/owl.carousel.min.css">

	<!-- Blog CSS -->
	<?php if (is_home() || is_author() || is_category() || is_tag() || is_archive()) { ?>
		<link rel="stylesheet" href="<?php bloginfo("template_url") ?>/css/blog_css/blog-page.min.css">
	<?php } ?>

	<?php if (is_single()) { ?>
		<link rel="stylesheet" href="<?php bloginfo("template_url") ?>/css/blog_css/blog-single.min.css">
	<?php } ?>
	<!-- End of Blog CSS -->

	<?php if (is_page('15')): ?>
		<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/nh_about/about-styles.min.css">
	<?php endif; ?>

	<?php if (is_page('14')): ?>
		<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/nh_services/serv-style.min.css">
	<?php endif; ?>

	<?php if (is_user_logged_in()) { ?>
		<style>
			@media only screen and (max-width : 800px) {
				nav.toggle_right_style {
					top: 32px;
				}
			}

			@media only screen and (max-width : 782px) {
				nav.toggle_right_style {
					top: 46px;
				}
			}
		</style>
	<?php } ?>

	<?php wp_head(); ?>
</head>

<body>
	<div class="protect-me">
		<div class="clearfix">