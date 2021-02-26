<?php include $system['location_php'] . '/lib/login/login.php'; ?>
<?php chdir($system['location_php']); ?>
<?php if(!csrf_checkToken('get')){ if(!function_exists('prevent_index')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_index(); exit(); } ?>
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
		default:
			if(!function_exists('prevent_index')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_index(); exit();
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title><?php echo ucfirst($_GET['do']); ?></title>
		<?php include $system['location_php'] . '/lib/htmlheaders.php'; ?>
	</head>
	<body>
		<h1><?php echo ucfirst($_GET['do']); ?>...</h1>
		You can close tab.
	</body>
</html>