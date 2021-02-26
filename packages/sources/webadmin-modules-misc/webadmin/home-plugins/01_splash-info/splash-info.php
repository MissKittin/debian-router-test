<?php if(!function_exists('prevent_direct')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_direct('splash-info.php');?>
<div>
	<?php echo shell_exec($system['location_php'] . '/home-plugins/' . $plugin . '/shell.sh splash-info'); ?>
</div>
