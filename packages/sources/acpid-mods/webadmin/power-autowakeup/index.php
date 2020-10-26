<?php include($system['location_php'] . '/lib/login/login.php'); ?>
<?php chdir($system['location_php']); ?>
<?php
	$shell_sh_location=$system['location_php'] . '/power-autowakeup/shell.sh';

	if((isset($_POST['autowakeup-time'])) && (csrf_checkToken('post')))
	{
		if(strpos($_POST['autowakeup-time'], '\'') === false) shell_exec($shell_sh_location . ' autowakeup set-time ' . '\''.$_POST['autowakeup-time'].'\'');
		if(isset($_POST['autowakeup-enabled']))
		{
			if($_POST['autowakeup-enabled'] === 'yes')
				shell_exec($shell_sh_location . ' autowakeup set-enabled yes');
		}
		else
			shell_exec($shell_sh_location . ' autowakeup set-enabled no');
	}
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Auto wake-up</title>
		<?php include($system['location_php'] . '/lib/htmlheaders.php'); ?>
	</head>
	<body>
		<?php include($system['location_php'] . '/lib/header.php'); ?>
		<div id="system_body">
			<?php include($system['location_php'] . '/lib/menu/menu.php'); ?>
			<div id="system_content">
				<h1>Auto wake-up</h1>
				<?php echo shell_exec($shell_sh_location . ' autowakeup get-time'); ?>
				<h3>Set new time</h3>
				<form action="power-autowakeup" method="post">
					<input type="text" name="autowakeup-time" pattern="([01]?[0-9]{1}|2[0-3]{1}):[0-5]{1}[0-9]{1}" title="HH:MM" value="<?php echo shell_exec($shell_sh_location . ' autowakeup get-time only-time'); ?>" required><br>
					Enabled: <input type="checkbox" name="autowakeup-enabled" value="yes" <?php echo shell_exec($shell_sh_location . ' autowakeup get-enabled'); ?>><br>
					<input type="submit" class="system_button" value="Set">
					<?php echo csrf_injectToken(); ?>
				</form>
			</div>
		</div>
	</body>
</html>