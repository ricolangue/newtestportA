

<!-- Banner -->
<div id="banner">
	<div class="wrapper">
		<div class="bnr_con">

      <?php if (is_front_page() ) { ?>
			<div class="slider">
				<ul class="rslides">
					<li><figure><img src="<?php bloginfo('template_url');?>/images/slider/1.jpg" alt="three people talking"></figure></li>
					<li><figure><img src="<?php bloginfo('template_url');?>/images/slider/2.jpg" alt="man calling"></figure></li>
					<li><figure><img src="<?php bloginfo('template_url');?>/images/slider/3.jpg" alt="group of workers"></figure></li>
				</ul>
				<div class="box_skitter box_skitter_large">
					<ul>
						<li><figure><img src="<?php bloginfo('template_url');?>/images/slider/1.jpg" alt="three people talking" class="random"></figure></li>
						<li><figure><img src="<?php bloginfo('template_url');?>/images/slider/2.jpg" alt="man calling" class="random"></figure></li>
						<li><figure><img src="<?php bloginfo('template_url');?>/images/slider/3.jpg" alt="group of workers" class="random"></figure></li>
					</ul>
				</div>
			</div>

      <?php dynamic_sidebar('bnr_info');?>


      <?php } else { ?>
      <div class="non_ban">
      <div class="non_ban_img">
      <?php if(is_home() && is_author() && is_category() && is_tag() && is_single()) { ?>
        <?php if (has_post_thumbnail() ) {?>
            <?php the_post_thumbnail('full');?>
        <?php }else{ ?>
            <figure><img src="<?php bloginfo('template_url');?>/images/slider/nh-banner.jpg" alt="group of people talking" /></figure>
        <?php } ?>
        <?php } elseif (!is_home() && !is_author() && !is_category() && !is_tag() && !is_single() && has_post_thumbnail() ) { ?>
              <?php the_post_thumbnail('full');?>
        <?php } else { ?>
          <img src="<?php bloginfo('template_url'); ?>/images/slider/nh-banner.jpg" alt="group of people talking">
        <?php } ?>
      </div>

      <div class="page_title">
        <?php if(!is_home() && !is_author() && !is_category() && !is_tag() && !is_single()) { ?>
          <h1 class="h1_title"><?php the_title(); ?></h1>
          <?php echo do_shortcode("[short_title id='" . get_the_ID() . "']"); ?>
        <?php } else { ?>
          <h1 class="h1_title">Blog</h1>
        <?php } ?>
      </div>
      </div>
      <?php }?>


		</div>
	</div>
</div>
<!-- End Banner -->