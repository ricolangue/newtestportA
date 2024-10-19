<?php
/**
 * Template Name: Premium About Us
 *
 * A custom page template without sidebar.
 *
 * The "Template Name:" bit above allows this to be selectable
 * from a dropdown menu on the edit page screen.
 *
 * @package WordPress
 * @subpackage Twenty_Ten
 * @since Twenty Ten 1.0
 */

?>

<?php @session_start();
    get_includes('head');
    get_includes('header');
    get_includes('nav');
    get_includes('banner');
?>

<div id="about_con">
    <div class="wrapper">
        
        <?php if(!is_front_page()) { ?>
            <?php if ( function_exists('yoast_breadcrumb') ) {
            yoast_breadcrumb( '<p id="breadcrumbs">','</p>' );
            }
            ?>
        <?php }?>
            <main>

            <div class="main_content" id="main_content">

            <div class="flex-con">
                <figure><img src="<?php bloginfo('template_url'); ?>/nh_about/images/thumb-id1.png" alt="female staff smiling"></figure>
                <div class="main_con">
                    <?php dynamic_sidebar('about_main');?>
            
                </div>
            </div>

            </div>
            <div class="mv" id="mission">

            <div class="flex-con">
                <figure><img src="<?php bloginfo('template_url'); ?>/nh_about/images/thumb-id2.png" alt="healthcare staff smiling"></figure>
                <div class="mv_con">
                 <?php dynamic_sidebar('about_mission');?>
                </div>
            </div>

            </div>
            <div class="vission" id="vision">

<div class="flex-con">
    <figure><img src="<?php bloginfo('template_url'); ?>/nh_about/images/thumb-id3.png" alt="female in the office smiling"></figure>
    <div class="mv_con">
        <?php dynamic_sidebar('about_vision');?>
    </div>
</div>

</div>

            </main>
            <div class="clearfix"></div>
    </div>
</div>

<?php get_includes('footer');?>