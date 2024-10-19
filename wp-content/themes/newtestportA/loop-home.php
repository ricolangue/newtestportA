<?php
/**
 * The loop that displays a page.
 *
 * The loop displays the posts and the post content.  See
 * http://codex.wordpress.org/The_Loop to understand it and
 * http://codex.wordpress.org/Template_Tags to understand
 * the tags used in it.
 *
 * This can be overridden in child themes with loop-page.php.
 *
 * @package WordPress
 * @subpackage Twenty_Ten
 * @since Twenty Ten 1.2
 */
?>
<div class="blog_wrapper">
	<div class="blog_flex">
		<?php

		$args = array( 'post_status' => 'publish', 'post_type' =>  array('post', 'second_blog'), 'paged'=>$paged);
		$loop = new WP_Query( $args );
			if ( $loop->have_posts() ):
				while ( $loop->have_posts() ) : $loop->the_post();
			?>
			<div class="blog_cont">
				<div id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
					<div class="img_wrapper">
						<?php
							/* Display image on loop-home */
							$content = get_the_content();
							$count = preg_match('/src=(["\'])(.*?)\1/', $content, $match);
							if ($count != FALSE){
								$url = ($match[2] . "\n"); ?>
								<img src="<?php echo $url; ?>" alt="image"/>
							<?php } else if (has_post_thumbnail()){ ?>
								<?php the_post_thumbnail('full');?>
							<?php }else{ ?>
								<img id="logodefault" src="<?php bloginfo("template_url") ?>/images/blog/default.png" alt="<?php echo get_bloginfo('name');?>"/>
						<?php } ?>
					</div>

					<div class="info_cont">
						<h2 class="blog_heading"><a href="<?php the_permalink(); ?>"><?php echo wp_trim_words( get_the_title(), 11, '...' ); ?></a></h2>
						<div class="blog_footer">
							<div class="author_link">
								<a href="<?php echo get_author_posts_url( get_the_author_meta( 'ID' ) ); ?>" rel="author">
									<?php printf( __( 'By %s <span class="meta-nav"></span>', 'twentyten' ), get_the_author() ); ?>
								</a>
							</div>
							<span class="blog_date"><?php echo get_the_date();?></span>

						</div>
						<p><?php echo get_excerpt(250); ?></p>
						<a class="read_more" href="<?php the_permalink(); ?>">Read More &rsaquo;</a>
					</div>

				</div><!-- #post-## -->
			</div>

			<?php endwhile; // end of the loop. ?>
			<?php else: ?>
		<div class="entry-content">
			<p class="comingsoon">More blog posts will be posted here soon. Please check back next time.</p>
		</div>
		<?php endif; ?>
	</div>
	<div class="pagination_con">
    <?php kriesi_pagination($loop->max_num_pages); ?>
  </div>
	<div class="clearfix"></div>
</div>
