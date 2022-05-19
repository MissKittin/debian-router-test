<?php /* _webadmin */
/* _webadmin */ if(!function_exists('prevent_direct')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_direct('index.full.php');
/* _webadmin */ if(!isset($_GET['theme'])) { prevent_index(); exit(); }
/* _webadmin */ $session_regenerate=false; include $system['location_php'] . '/lib/login/login.php'; unset($session_regenerate);
/* _webadmin */ ?>
<?php
	// wicd php gui
	// 22.10.2019 - 26.10.2019
	// update 03.02.2020
	// minifier: https://csscompressor.com

	/* _webadmin *//*
	if((!isset($_GET['theme'])) || (basename($_SERVER['SCRIPT_NAME']) === 'index.full.php')) exit();
	*//* _webadmin */

	// filetype header
	header('Content-Type: text/css; X-Content-Type-Options: nosniff;');
	header('Expires: ' . gmdate('D, d M Y H:i:s', time() + 3600) . ' GMT'); header('Pragma: cache'); header('Cache-Control: max-age=3600');

	// import theme
	if(!@include '../themes/' . $_GET['theme'] . '/theme.php') { prevent_index(); exit(); } /* _webadmin */
	/* _webadmin *//*
	if(!@include '../themes/' . $_GET['theme'] . '/theme.php') exit();
	*//* _webadmin */
?>

/* global for all windows */
	.wicd_window {
		position: absolute;
		top:0;
		bottom: 0;
		left: 0;
		right: 0;
		margin: auto;
	}
	.wicd_titleBar {
		overflow: auto;
	}
	.wicd_titleBarClose {
		display: inline;
		float: right;
	}
	.wicd_windowButtons {
		position: absolute;
		bottom: 0px;
		right: 0px;
		padding: 5px;
		overflow: auto;
	}


/* wicd settings window */
	#wicd_settings {
		width: 500px;
		height: 500px;
	}
	#wicd_settingsContent {
		padding: 5px;
		height: 430px;
		overflow: scroll;
		overflow-x: hidden;
		overflow-y: auto;
	}

/* wicd settings saved window */
	#wicd_settingsSaved {
		width: 300px;
		height: 100px;
	}


/* wicd about window */
	#wicd_about {
		width: 500px;
		height: 500px;
	}
	#wicd_aboutContent {
		margin-top: 150px;
	}

/* wicd enter password window */
	#wicd_enterPassword {
		width: 300px;
		height: 100px;
	}
	#wicd_enterPasswordContent {
		padding-top: 18px;
		text-align: center;
	}

/* wicd network saved window */
	#wicd_networkSaved {
		width: 300px;
		height: 100px;
	}

/* wicd main window */
	#wicd_content {
		height: 520px;
		width: 400px;
	}
	#wicd_contentHiddenClose {
		visibility: hidden;
	}
	#wicd_contentButtons {
		padding: 5px;
	}
	#wicd_contentNetworks {
		padding: 5px;
		height: 80%;
		overflow: scroll;
		overflow-x: hidden;
		overflow-y: auto;
	}
	#wicd_contentNetworksActiontext {
		text-align: center;
		vertical-align: middle;
		line-height: 400px;
	}
	.wicd_contentNetworksNetwork {
		height: 100px;
		margin-bottom: 5px;
	}
	.wicd_contentNetworksNetworkName {
		margin-left: 5px;
	}
	.wicd_contentNetworksNetworkSignalicon {
		float: left;
	}
	.wicd_contentNetworksNetworkSignaliconQualityImg {
		width: 50px;
		margin-right: 5px;
	}
	#wicd_status {
		padding: 2px;
	}

/* small screens */
	@media only screen and (max-height: 650px) {
		/* wicd about window */
			#wicd_about {
				width: 400px;
				height: 400px;
			}
			#wicd_aboutContent {
				margin-top: 100px;
			}

		/* wicd settings window */
			#wicd_settings {
				width: 400px;
				height: 400px;
			}
			#wicd_settingsContent {
				height: 330px;
			}
	}