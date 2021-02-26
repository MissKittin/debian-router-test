<?php include $system['location_php'] . '/lib/login/login.php'; ?>
<?php chdir($system['location_php']); ?>
<?php $shell_sh_location=$system['location_php'] . '/net-ifaces/shell.sh'; ?>
<!DOCTYPE html>
<html>
	<head>
		<title>Interfaces</title>
		<?php include $system['location_php'] . '/lib/htmlheaders.php'; ?>
	</head>
	<body>
		<?php include $system['location_php'] . '/lib/header.php'; ?>
		<div id="system_body">
			<?php include $system['location_php'] . '/lib/menu/menu.php'; ?>
			<div id="system_content">
				<?php @include dirname($shell_sh_location) . '/info.php'; ?>
				<h1>Network interfaces</h1>
					<pre><?php echo shell_exec($shell_sh_location . ' interfaces-all'); ?></pre>
				<h1>Network cards</h1>
					<pre><?php echo shell_exec($shell_sh_location . ' ethtool'); ?></pre><br>
			</div>
		</div>
	</body>
</html>