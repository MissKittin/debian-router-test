<?php if(!function_exists('prevent_direct')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_direct('theme.min.php'); prevent_direct('theme.php'); /* _webadmin */ ?>
<?php
	/* _webadmin *//*
	$theme_script_name=basename($_SERVER['SCRIPT_NAME']); if(($theme_script_name === 'theme.php') || ($theme_script_name === 'theme.min.php')) exit(); unset($theme_script_name);
	*//* _webadmin */
?>
#wicd{font-size:16px}.button{border:1px solid var(--content_border-color);border-radius:15px;background-color:#fffee0}.wicd_window{background-color:#eeedd0;border:1px solid var(--content_border-color);border-radius:5px;color:#000}.wicd_titleBar{background-color:#009;border-radius:5px}#wicd_content{background-color:#eeedd0;border:1px solid var(--content_border-color);border-radius:5px}#wicd_contentNetworksActiontext{color:#555;font-weight:700}.wicd_contentNetworksNetwork{border:1px solid #999}.wicd_contentNetworksNetworkName{font-weight:700;color:#000}.wicd_contentNetworksNetworkDetails{color:#000}#wicd_status{color:#000}