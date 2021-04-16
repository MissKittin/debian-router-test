<?php if(!function_exists('prevent_direct')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_direct('internet-info.php'); ?>
<div>
	<?php echo str_replace('&lt;br&gt;', '<br>', htmlspecialchars(shell_exec($system['location_php'] . '/login-plugins/' . $plugin . '/shell.sh check-internet'))); ?>
	<br>
	<?php echo str_replace('&lt;br&gt;', '<br>', htmlspecialchars(shell_exec($system['location_php'] . '/login-plugins/' . $plugin . '/shell.sh check-ipv6'))); ?>
</div>
