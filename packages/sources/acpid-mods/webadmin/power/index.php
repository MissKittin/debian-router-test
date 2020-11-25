<?php include($system['location_php'] . '/lib/login/login.php'); ?>
<?php chdir($system['location_php']); ?>
<?php if(!csrf_checkToken('get')){ include($system['location_php'] . '/lib/prevent-index.php'); exit(); } ?>
<?php
	$shell_sh_location=$system['location_php'] . '/power/shell.sh';

	switch($_GET['do'])
	{
		case 'halt':
			shell_exec($shell_sh_location . ' halt');
			break;
		case 'reboot':
			shell_exec($shell_sh_location . ' reboot');
			break;
		case 'suspend':
			shell_exec($shell_sh_location . ' suspend');
			break;
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Shutdown</title>
		<?php include($system['location_php'] . '/lib/htmlheaders.php'); ?>
	</head>
	<body>
		<h1>Doing <?php echo $_GET['do']; ?>...</h1>
		You can close tab.
	</body>
</html>