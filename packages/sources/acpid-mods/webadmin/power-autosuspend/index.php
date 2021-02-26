<?php include $system['location_php'] . '/lib/login/login.php'; ?>
<?php chdir($system['location_php']); ?>
<?php
	$shell_sh_location=$system['location_php'] . '/power-autosuspend/shell.sh';

	if((isset($_POST['templock'])) && (csrf_checkToken('post')))
		shell_exec($shell_sh_location . ' autosuspend lock');
	if((isset($_POST['tempunlock'])) && (csrf_checkToken('post')))
		shell_exec($shell_sh_location . ' autosuspend unlock');

	if((isset($_POST['activatetime'])) && (csrf_checkToken('post')))
	{
		if(isset($_POST['enabled']))
			shell_exec($shell_sh_location . ' autosuspend set activate');
		else
			shell_exec($shell_sh_location . ' autosuspend set deactivate');

		$activatetime=explode(':', $_POST['activatetime']); $deactivatetime=explode(':', $_POST['deactivatetime']);
		if(strpos($activatetime[0].$activatetime[1].$deactivatetime[0].$deactivatetime[1], '\'') === false) shell_exec($shell_sh_location . ' autosuspend set time ' . '\''.$activatetime[0].'\'' . ' ' . '\''.$activatetime[1].'\'' . ' ' . '\''.$deactivatetime[0].'\'' . ' ' . '\''.$deactivatetime[1].'\'');
	}

	if((isset($_POST['oneshot-activatetime'])) && (csrf_checkToken('post')))
	{
		$oneshot_activatetime=explode(':', $_POST['oneshot-activatetime']); $oneshot_deactivatetime=explode(':', $_POST['oneshot-deactivatetime']);
		if(strpos($oneshot_activatetime[0].$oneshot_activatetime[1].$oneshot_deactivatetime[0].$oneshot_deactivatetime[1], '\'') === false) shell_exec($shell_sh_location . ' autosuspend set oneshot-time ' . '\''.$oneshot_activatetime[0].'\'' . ' ' . '\''.$oneshot_activatetime[1].'\'' . ' ' . '\''.$oneshot_deactivatetime[0].'\'' . ' ' . '\''.$oneshot_deactivatetime[1].'\'');
	}

	if((isset($_POST['oneshot-remove'])) && (csrf_checkToken('post')))
		shell_exec($shell_sh_location . ' autosuspend set oneshot-time remove');
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Autosuspend</title>
		<?php include $system['location_php'] . '/lib/htmlheaders.php'; ?>
	</head>
	<body>
		<?php include $system['location_php'] . '/lib/header.php'; ?>
		<div id="system_body">
			<?php include $system['location_php'] . '/lib/menu/menu.php'; ?>
			<div id="system_content">
				<h1>Automatic suspend</h1>
				<?php
					$config=shell_exec($shell_sh_location . ' autosuspend get-enabled');
					$config=explode('|', $config);

					$oneshot_config=shell_exec($shell_sh_location . ' autosuspend get-oneshot');
					$oneshot_config=explode('|', $oneshot_config);

					if($config[0] === 'false')
						echo 'Automatic suspend disabled';
					else if($config[0] === 'tempdisabled')
						echo 'Automatic suspend temporary disabled';
					else
					{
						if($oneshot_config[0] === 'false')
							echo 'The Router will try to sleep between ' . $config[1].':'.$config[2] . ' and ' . $config[3].':'.$config[4];
						else
							echo 'The Router will try to sleep between ' . $oneshot_config[1].':'.$oneshot_config[2] . ' and ' . $oneshot_config[3].':'.$oneshot_config[4];
					}
				?>

				<h3>Configuration</h3>
				<form action="power-autosuspend" method="post">
					<input style="display: none;" type="checkbox" name="enabled" value="enable" <?php if(($config[0] === 'true') || ($config[0] === 'tempdisabled')) echo 'checked'; ?>> <input type="time" name="activatetime" value="<?php echo $config[1]; ?>:<?php echo $config[2]; ?>" required> ─ <input type="time" name="deactivatetime" value="<?php echo $config[3]; ?>:<?php echo $config[4]; ?>" required>
					<br><br>
					<input type="submit" class="system_button" value="Set">
					<?php if($config[0] !== 'false') { ?><?php if($config[0] === 'tempdisabled') echo '<input type="submit" class="system_button" name="tempunlock" value="Unlock">'; else echo '<input type="submit" class="system_button" name="templock" value="Lock">'; ?><?php } ?>
					<?php echo csrf_injectToken(); ?>
				</form>

				<h3>Oneshot configuration</h3>
				<form action="power-autosuspend" method="post">
					<input type="time" name="oneshot-activatetime" value="<?php echo $oneshot_config[1]; ?>:<?php echo $oneshot_config[2]; ?>" required> ─ <input type="time" name="oneshot-deactivatetime" value="<?php echo $oneshot_config[3]; ?>:<?php echo $oneshot_config[4]; ?>" required>
					<br><br>
					<input type="submit" class="system_button" value="Set">
					<?php if($oneshot_config[0] !== 'false') echo '<input type="submit" class="system_button" name="oneshot-remove" value="Remove">'; ?>
					<?php echo csrf_injectToken(); ?>
				</form>
			</div>
		</div>
	</body>
</html>