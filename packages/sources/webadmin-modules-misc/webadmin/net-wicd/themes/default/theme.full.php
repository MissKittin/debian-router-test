<?php /* _webadmin */
/* _webadmin */ if(!function_exists('prevent_direct')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_direct('theme.full.php');
/* _webadmin */ prevent_direct('theme.php');
/* _webadmin */ ?>
<?php
	// wicd php gui - default theme
	// 22.10.2019 - 26.10.2019
	// minifier: https://csscompressor.com

	/* _webadmin *//*
	$theme_script_name=basename($_SERVER['SCRIPT_NAME']);
	if(($theme_script_name === 'theme.php') || ($theme_script_name === 'theme.full.php')) exit();
	unset($theme_script_name);
	*//* _webadmin */
?>

/* fonts */
	#wicd {
		font-size: 16px;
	}

/* buttons */
	.button {
		border: 1px solid var(--content_border-color);
		border-radius: 15px;
		background-color: #fffee0;
	}

/* global for all windows */
	.wicd_window {
		background-color: #eeedd0;
		border: 1px solid var(--content_border-color);
		border-radius: 5px;
		color: #000000;
	}
	.wicd_titleBar {
		background-color: #000099;
		border-radius: 5px;
	}

/* wicd main window */
	#wicd_content {
		background-color: #eeedd0;
		border: 1px solid var(--content_border-color);
		border-radius: 5px;
	}
	#wicd_contentNetworksActiontext {
		color: #555555;
		font-weight: bold;
	}
	.wicd_contentNetworksNetwork {
		border: 1px solid #999999;
	}
	.wicd_contentNetworksNetworkName {
		font-weight: bold;
		color: #000000;
	}
	.wicd_contentNetworksNetworkDetails {
		color: #000000;
	}
	#wicd_status {
		color: #000000;
	}