<?php include($system['location_php'] . '/lib/login/login.php'); ?>
<?php chdir($system['location_php']); ?>
<?php
	$shell_sh_location=$system['location_php'] . '/net-forwarding/shell.sh';
	$ALERT='';

	if((isset($_POST['port'])) && (csrf_checkToken('post')))
	{
		if($_POST['input-interface'] === $_POST['output-interface'])
			$ALERT='onload="javacript:lerror(\'Input interface cannot be output\');"';
		else
			if(strpos($_POST['port'].$_POST['protocol'].$_POST['input-interface'].$_POST['destination'].$_POST['output-interface'], '\'') === false) shell_exec($shell_sh_location . ' forward add ' . '\''.$_POST['port'].'\'' . ' ' . '\''.$_POST['protocol'].'\'' . ' ' . '\''.$_POST['input-interface'].'\'' . ' ' . '\''.$_POST['destination'].'\'' . ' ' . '\''.$_POST['output-interface'].'\'');
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Port forwarding</title>
		<?php include($system['location_php'] . '/lib/htmlheaders.php'); ?>
		<script type="text/javascript">
			function lerror(message)
			{
				alert(message);
			}
		</script>
	</head>
	<body <?php echo $ALERT; ?>>
		<?php include($system['location_php'] . '/lib/header.php'); ?>
		<div id="system_body">
			<?php include($system['location_php'] . '/lib/menu/menu.php'); ?>
			<div id="system_content">
				<h1>Port forwarding</h1>
				<form action="net-forwarding" method="post">
					Port: <input type="text" name="port" pattern="[0-9]{1,5}" title="Port number" required><br>
					<input type="radio" name="protocol" value="tcp"> TCP
					<input type="radio" name="protocol" value="udp"> UDP
					<input type="radio" name="protocol" value="tcpudp" checked> Both<br>
					From <select name="input-interface">
						<?php echo shell_exec($shell_sh_location . ' generate-interfaces'); ?>
					</select>
					to <select name="output-interface">
						<?php echo shell_exec($shell_sh_location . ' generate-interfaces'); ?>
					</select><br>
					Destination: <input type="text" name="destination" pattern="^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$" title="IP address" required><br>
					<input type="submit" class="system_button" value="Set">
					<?php echo csrf_injectToken(); ?>
				</form>
				<h3>Forwarded ports:</h3>
				<pre><?php echo shell_exec($shell_sh_location . ' list-iptables-settings forwarding'); ?></pre>
			</div>
		</div>
	</body>
</html>