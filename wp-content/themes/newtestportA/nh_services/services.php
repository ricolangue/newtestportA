<?php
/**
 * Template Name:  Premium Services
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

<!-- Main -->
<div id="nh_serv">
        <div class="wrapper">
     
            <?php if(!is_front_page()) { ?>
                <?php if ( function_exists('yoast_breadcrumb') ) {
                yoast_breadcrumb( '<p id="breadcrumbs">','</p>' );
                }
                ?>
            <?php }?>
            <main>
                <div class="main_con">
                    <?php dynamic_sidebar('services_main');?>
                </div>

                <div class="services_con">
                    <section>
                      <?php dynamic_sidebar('services_box_1');?>
                            <figure><img src="<?php bloginfo('template_url');?>/nh_services/images/thumb-231130101310U0t15ia.jpg" alt="healthcare staff smiling"></figure>
                    </section>

                    <section>
                    <?php dynamic_sidebar('services_box_2');?>
                
                            <figure><img src="<?php bloginfo('template_url');?>/nh_services/images/thumb-2411941736Us41a0e.jpg" alt="group of staff smiling"></figure>
                    </section>
<!-- 
                    <section>
                    <?php dynamic_sidebar('services_box_3');?>
                            <figure><img src="<?php bloginfo('template_url');?>/nh_services/images/nh-serv-img2.jpg" alt="dummy"></figure>
                    </section> -->

                </div>
            </main>
            <div class="clearfix"></div>
        </div>
    </div>
<!-- End Main -->
<?php get_includes('footer');?>
