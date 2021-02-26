<?php $session_regenerate=false; include $system['location_php'] . '/lib/login/login.php'; unset($session_regenerate); ?>
<?php chdir($system['location_php']); ?>
<?php
	if(isset($_GET['hwclock']))
		echo shell_exec('. ./lib/shell/path.rc; date "+%d.%m.%Y %H:%M:%S"');
	else
	{ include $system['location_php'] . '/lib/prevent-index.php'; exit(); }
?>