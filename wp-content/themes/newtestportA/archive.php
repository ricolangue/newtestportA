<?php @session_start();
get_includes('head');
get_includes('header');
get_includes('nav');
get_includes('banner');
?>
<?php if (is_front_page()) {
	get_includes('middle');
} ?>

<!-- Main -->
<div id="main_area">
	<div class="wrapper">
		<div class="main_con">
			<main>

				<?php if (!is_front_page()) { ?>
					<?php if (function_exists('yoast_breadcrumb')) {
						yoast_breadcrumb('<p id="breadcrumbs">', '</p>');
					}
					?>
				<?php } ?>
				<?php if (have_posts()): ?>

					<header class="page-header">
						<h1 class="page-title">
							<?php if (is_day()): ?>
								<?php printf(__('Daily Archives: %s', 'twentyeleven'), '<span>' . get_the_date() . '</span>'); ?>
							<?php elseif (is_month()): ?>
								<?php printf(__('Monthly Archives: %s', 'twentyeleven'), '<span>' . get_the_date(_x('F Y', 'monthly archives date format', 'twentyeleven')) . '</span>'); ?>
							<?php elseif (is_year()): ?>
								<?php printf(__('Yearly Archives: %s', 'twentyeleven'), '<span>' . get_the_date(_x('Y', 'yearly archives date format', 'twentyeleven')) . '</span>'); ?>
							<?php else: ?>
								<?php _e('Blog Archives', 'twentyeleven'); ?>
							<?php endif; ?>
						</h1>
					</header>
					<div class="blog-cont">

						<?php twentyeleven_content_nav('nav-above'); ?>

						<?php /* Start the Loop */ ?>
						<?php while (have_posts()):
							the_post(); ?>

							<?php
							/* Include the Post-Format-specific template for the content.
							 * If you want to overload this in a child theme then include a file
							 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
							 */
							get_template_part('content', get_post_format());
							?>

						<?php endwhile; ?>

						<?php twentyeleven_content_nav('nav-below'); ?>

					<?php else: ?>

						<article id="post-0" class="post no-results not-found">
							<header class="entry-header">
								<h1 class="entry-title"><?php _e('Nothing Found', 'twentyeleven'); ?></h1>
							</header><!-- .entry-header -->

							<div class="entry-content">
								<p><?php _e('Apologies, but no results were found for the requested archive. Perhaps searching will help find a related post.', 'twentyeleven'); ?>
								</p>
								<?php get_search_form(); ?>
							</div><!-- .entry-content -->
						</article><!-- #post-0 -->
					</div>

				<?php endif; ?>

			</main>
			<figure class="main_humans hidden"><img src="<?php bloginfo('template_url'); ?>/images/main-humans.png"
					alt="workers smiling"></figure>
		</div>

		<div class="clearfix"></div>
	</div>
</div>
<!-- End Main -->

<?php if (is_front_page()) {
	get_includes('bottom');
} ?>
<?php get_includes('footer'); ?>