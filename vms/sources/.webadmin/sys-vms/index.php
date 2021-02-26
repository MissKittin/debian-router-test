<?php include $system['location_php'] . '/lib/login/login.php'; ?>
<?php chdir($system['location_php']); ?>
<!DOCTYPE html>
<html>
	<head>
		<title>VMs</title>
		<?php include $system['location_php'] . '/lib/htmlheaders.php'; ?>
	</head>
	<body>
		<?php include $system['location_php'] . '/lib/header.php'; ?>
		<div id="system_body">
			<?php include $system['location_php'] . '/lib/menu/menu.php'; ?>
			<div id="system_content">
				<h1>VMs - disk usage</h1>
				<pre><?php echo shell_exec('. ./lib/shell/path.rc; cd ' . realpath(readlink(dirname($_SERVER['SCRIPT_FILENAME'])) . '/../..') . '; echo "Size\tVM"; du -sh */ | tr -d "/"'); ?></pre>
				<br>
				<pre><?php echo shell_exec('. ./lib/shell/path.rc; cd ' . realpath(readlink(dirname($_SERVER['SCRIPT_FILENAME'])) . '/../..') . '; echo "Size\tFile"; find -type f -not -path \'*/\.*\' -not -name \'*.sh\' -not -name "README.md" | cut -c3- | while read line; do du -h $line; done'); ?></pre>
			</div>
		</div>
	</body>
</html>