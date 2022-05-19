<?php include $system['location_php'] . '/lib/login/login.php'; ?>
<?php chdir($system['location_php']); ?>
<?php
	// wicd php gui - webadmin module
	// 22.10.2019 - 26.10.2019
	// update 03.02.2020

	// path settings
	$wicd_root_php=$system['location_php'] . '/net-wicd';
	$wicd_root_html=$system['location_html'] . '/net-wicd';

	// config
	$wicd_range_icons=$system['location_html'] . '/lib/range_icons'; // path to range icons
	$wicd_theme='bright'; // select theme
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Wicd</title>
		<?php include $system['location_php'] . '/lib/htmlheaders.php'; ?>
		<link rel="stylesheet" type="text/css" href="<?php echo $wicd_root_html; ?>/css/?theme=<?php echo $wicd_theme; ?>">
		<?php include $system['location_php'] . '/lib/opt_htmlheaders/jquery.php'; ?>
		<script src="<?php echo $wicd_root_html; ?>/js/?root=<?php echo $wicd_root_html; ?>&icons=<?php echo $wicd_range_icons; ?>"></script>
		<style type="text/css">
			#wicd_margin {
				width: 420px;
				height: 1px;
			}
		</style>
	</head>
	<body>
		<?php include $system['location_php'] . '/lib/header.php'; ?>
		<div id="system_body">
			<?php include $system['location_php'] . '/lib/menu/menu.php'; ?>
			<div id="system_content">
				<?php include $wicd_root_php . '/body.php'; ?>
				<div id="wicd_margin"></div>
			</div>
		</div>
	</body>
</html><?php exit(); /* webadmin version ends here */ ?>
<?php
	// wicd php gui - extracted version
	// 22.10.2019 - 26.10.2019
	// update 03.02.2020

	// save token to session
	session_name('wicd_id');
	session_start();

	// path settings
	$wicd_root_html=''; // none if placed in doc root
	$wicd_root_php=$_SERVER['DOCUMENT_ROOT'] . $wicd_root_html;

	// config
	$wicd_range_icons=$wicd_root_html . '/range_icons'; // path to range icons
	$wicd_theme='default'; // select theme
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Wicd</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<?php echo $wicd_root_html; ?>/css/?theme=<?php echo $wicd_theme; ?>">
		<script src="<?php echo $wicd_root_html; ?>/js/jquery.js"></script>
		<script src="<?php echo $wicd_root_html; ?>/js/?root=<?php echo $wicd_root_html; ?>&icons=<?php echo $wicd_range_icons; ?>"></script>
	</head>
	<body>
		<div id="content">
			<?php include $wicd_root_php . '/body.php'; ?>
		</div>
	</body>
</html>