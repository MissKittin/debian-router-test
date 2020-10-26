<?php include($system['location_php'] . '/lib/login/login.php'); ?>
<?php chdir($system['location_php']); ?>
<?php $shell_sh_location=$system['location_php'] . '/sys-containers/shell.sh'; ?>
<!DOCTYPE html>
<html>
	<head>
		<title>Containers</title>
		<?php include($system['location_php'] . '/lib/htmlheaders.php'); ?>
	</head>
	<body>
		<?php include($system['location_php'] . '/lib/header.php'); ?>
		<div id="system_body">
			<?php include($system['location_php'] . '/lib/menu/menu.php'); ?>
			<div id="system_content">
				<h1>Containers</h1>
				<h3>Stats</h3>
				<pre><?php echo shell_exec($shell_sh_location . ' containers stats'); ?></pre>
				<h3>Packages</h3>
				<pre><?php
					if(isset($_GET['checkPackages']))
						echo shell_exec($shell_sh_location . ' containers overlay_packages_check');
					else
						echo shell_exec($shell_sh_location . ' containers overlay_packages');
				?></pre>
				<?php if(!isset($_GET['checkPackages'])) echo '<a class="content_noDecorations" href="?checkPackages">Check for updates</a><br>'; ?>
			</div>
		</div>
	</body>
</html>