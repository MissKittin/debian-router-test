<?php include $system['location_php'] . '/lib/login/login.php'; ?>
<?php chdir($system['location_php']); ?>
<?php
	$shell_sh_location=$system['location_php'] . '/power-autowakeup/shell.sh';

	/* if((isset($_POST['autowakeup-time'])) && (csrf_checkToken('post')))
	{
		if(strpos($_POST['autowakeup-time'], '\'') === false) shell_exec($shell_sh_location . ' autowakeup set-time ' . '\''.$_POST['autowakeup-time'].'\'');
		if(isset($_POST['autowakeup-enabled']))
		{
			if($_POST['autowakeup-enabled'] === 'yes')
				shell_exec($shell_sh_location . ' autowakeup set-enabled yes');
		}
		else
			shell_exec($shell_sh_location . ' autowakeup set-enabled no');
	} */

	if((isset($_POST['activatetime'])) && (csrf_checkToken('post')))
	{
		//$activatetime=explode(':', $_POST['activatetime']);
		if(strpos($activatetime[0].$activatetime[1], '\'') === false) shell_exec($shell_sh_location . ' autowakeup set time ' . '\''.$_POST['activatetime'].'\'');
	}

	if((isset($_POST['oneshot-activatetime'])) && (csrf_checkToken('post')))
	{
		//$oneshot_activatetime=explode(':', $_POST['oneshot-activatetime']);
		if(strpos($oneshot_activatetime[0].$oneshot_activatetime[1], '\'') === false) shell_exec($shell_sh_location . ' autowakeup set oneshot-time ' . '\''.$_POST['oneshot-activatetime'].'\'');
	}

	if((isset($_POST['oneshot-remove'])) && (csrf_checkToken('post')))
		shell_exec($shell_sh_location . ' autowakeup set oneshot-time remove');
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Auto wake-up</title>
		<?php include $system['location_php'] . '/lib/htmlheaders.php'; ?>
	</head>
	<body>
		<?php include $system['location_php'] . '/lib/header.php'; ?>
		<div id="system_body">
			<?php include $system['location_php'] . '/lib/menu/menu.php'; ?>
			<div id="system_content">
				<h1>Automatic wake-up</h1>

				<?php /* echo shell_exec($shell_sh_location . ' autowakeup get-time'); */ ?>
				<!-- <h3>Set new time</h3>
				<form action="power-autowakeup" method="post">
					<input type="text" name="autowakeup-time" pattern="([01]?[0-9]{1}|2[0-3]{1}):[0-5]{1}[0-9]{1}" title="HH:MM" value="<?php /* echo shell_exec($shell_sh_location . ' autowakeup get-time only-time'); */ ?>" required><br>
					Enabled: <input type="checkbox" name="autowakeup-enabled" value="yes" <?php /* echo shell_exec($shell_sh_location . ' autowakeup get-enabled'); */ ?>><br>
					<input type="submit" class="system_button" value="Set">
					<?php /* echo csrf_injectToken(); */ ?>
				</form> -->

				<?php
					$config=shell_exec($shell_sh_location . ' autowakeup get-time');
					$config=explode(':', $config);

					$oneshot_config=shell_exec($shell_sh_location . ' autowakeup get-oneshot');
					$oneshot_config=explode('|', $oneshot_config);
					$oneshot_config[1]=explode(':', $oneshot_config[1]);

					if($oneshot_config[0] === 'false')
						echo 'The Router will wake up at ' . $config[0].':'.$config[1];
					else
						echo 'The Router will wake up at ' . $oneshot_config[1][0].':'.$oneshot_config[1][1];
				?>

				<h3>Configuration</h3>
				<form action="power-autowakeup" method="post">
					<input type="time" name="activatetime" value="<?php echo $config[0]; ?>:<?php echo $config[1]; ?>" required>
					<br><br>
					<input type="submit" class="system_button" value="Set">
					<?php echo csrf_injectToken(); ?>
				</form>

				<h3>Oneshot configuration</h3>
				<form action="power-autowakeup" method="post">
					<input type="time" name="oneshot-activatetime" value="<?php echo $oneshot_config[1][0]; ?>:<?php echo $oneshot_config[1][1]; ?>" required>
					<br><br>
					<input type="submit" class="system_button" value="Set">
					<?php if($oneshot_config[0] !== 'false') echo '<input type="submit" class="system_button" name="oneshot-remove" value="Remove">'; ?>
					<?php echo csrf_injectToken(); ?>
				</form>
			</div>
		</div>
	</body>
</html>