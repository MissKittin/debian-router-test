<?php include $system['location_php'] . '/lib/login/login.php'; ?>
<?php chdir($system['location_php']); ?>
<?php
	$shell_sh_location=$system['location_php'] . '/sys-notifications/shell.sh';

	if((isset($_GET['action'])) && (csrf_checkToken('get')))
	{
		switch ($_GET['action'])
		{
			case 'enable':
				if(strpos($_GET['type'].$_GET['name'], '\'') === false) echo shell_exec($shell_sh_location . ' notify-daemon-settings set enable ' . '\''.$_GET['type'].'\'' . ' ' . '\''.$_GET['name'].'\'');
			break;
			case 'disable':
				if(strpos($_GET['type'].$_GET['name'], '\'') === false) echo shell_exec($shell_sh_location . ' notify-daemon-settings set disable ' . '\''.$_GET['type'].'\'' . ' ' . '\''.$_GET['name'].'\'');
			break;
		}
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Notifications</title>
		<?php include $system['location_php'] . '/lib/htmlheaders.php'; ?>
	</head>
	<body>
		<?php include $system['location_php'] . '/lib/header.php'; ?>
		<div id="system_body">
			<?php include $system['location_php'] . '/lib/menu/menu.php'; ?>
			<div id="system_content">
				<h1>Notifications</h1>
				Daemon: <?php echo shell_exec($shell_sh_location . ' notify-daemon-settings status');?>
				<?php echo shell_exec($shell_sh_location . ' notify-daemon-settings print ' . csrf_printToken('parameter').' '.csrf_printToken('value')); // notify-daemon-settings print csrfTokenParam csrfTokenVal ?>
			</div>
		</div>
	</body>
</html>