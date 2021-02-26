<?php include($system['location_php'] . '/lib/login/login.php'); ?>
<?php chdir($system['location_php']); ?>
<?php
	if((isset($_POST['pptp-login'])) && (csrf_checkToken('post')))
	{
		// set pptp
		shell_exec($system['location_php'] . strtok($_SERVER['REQUEST_URI'], '?') . '/shell.sh vpn set pptp login ' . $_POST['pptp-login']);
		shell_exec($system['location_php'] . strtok($_SERVER['REQUEST_URI'], '?') . '/shell.sh vpn set pptp password ' . $_POST['pptp-password']);
	}
	if((isset($_POST['l2tp-login'])) && (csrf_checkToken('post')))
	{
		// set l2tp
		shell_exec($system['location_php'] . strtok($_SERVER['REQUEST_URI'], '?') . '/shell.sh vpn set l2tp login ' . $_POST['l2tp-login']);
		shell_exec($system['location_php'] . strtok($_SERVER['REQUEST_URI'], '?') . '/shell.sh vpn set l2tp password ' . $_POST['l2tp-password']);
		shell_exec($system['location_php'] . strtok($_SERVER['REQUEST_URI'], '?') . '/shell.sh vpn set l2tp serverpassword ' . $_POST['l2tp-main-password']);
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>VPN</title>
		<?php include($system['location_php'] . '/lib/htmlheaders.php'); ?>
	</head>
	<body>
		<?php include($system['location_php'] . '/lib/header.php'); ?>
		<div id="system_body">
			<?php include($system['location_php'] . '/lib/menu/menu.php'); ?>
			<div id="system_content">
				<h1>VPN</h1>
				<h3>PPTP</h3>
				<form action="net-vpn" method="post">
					Login: <input type="text" name="pptp-login" value="<?php echo shell_exec($system['location_php'] . strtok($_SERVER['REQUEST_URI'], '?') . '/shell.sh vpn get pptp login'); ?>" required="required"><br>
					Change user's password: <input type="password" name="pptp-password"><br>
					<input type="submit" class="system_button" value="Set">
					<?php echo csrf_injectToken(); ?>
				</form>
				<h3>L2TP</h3>
				<form action="net-vpn" method="post">
					Login: <input type="text" name="l2tp-login" value="<?php echo shell_exec($system['location_php'] . strtok($_SERVER['REQUEST_URI'], '?') . '/shell.sh vpn get l2tp login'); ?>" required="required"><br>
					Change user's password: <input type="password" name="l2tp-password"><br>
					Change server password: <input type="password" name="l2tp-main-password" required><br>
					<input type="submit" class="system_button" value="Set">
					<?php echo csrf_injectToken(); ?>
				</form>
			</div>
		</div>
	</body>
</html>