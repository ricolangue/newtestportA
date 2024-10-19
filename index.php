<?php @session_start();
get_includes('head');
get_includes('header');
get_includes('nav');
get_includes('banner');
?>
<?php if ( is_front_page() ) { get_includes('middle'); }?>

<!-- Main -->
<div id="main_area">
	<div class="wrapper">
		<div class="main_con">
			<main>
        
        <?php if(!is_front_page()) { ?>
          <?php if ( function_exists('yoast_breadcrumb') ) {
          yoast_breadcrumb( '<p id="breadcrumbs">','</p>' );
          }
          ?>
          <?php }?>

        <?php get_template_part( 'loop', 'home' ); ?>
			</main>
			<figure class="main_humans hidden"><img src="<?php bloginfo('template_url');?>/images/main-humans.png" alt="workers smiling"></figure>
		</div>

	<div class="clearfix"></div>
	</div>
</div>
<!-- End Main -->

<?php if ( is_front_page() ) { get_includes('bottom'); }?>
<?php get_includes('footer'); ?>
