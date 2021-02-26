<?php if(!function_exists('prevent_direct')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_direct('body.php'); /* _webadmin */ ?>
<?php
	// wicd php gui - frontend
	// 22.10.2019 - 26.10.2019
	// update 03.02.2020
	// lines with code for webadmin is marked with the /* _webadmin */

	// dependencies: jquery (>=3)

	/* configs:
		index.php:
			$wicd_range_icons path to range icons
		script.php:
			var wicd_debugFlag=[true/false] enable/disable js debug info in console (this functionality is removed in minified version, see js/index.full.php)
		api/shell.sh:
			WICD_CLI wicd-cli command
			WICD_STATUS_COMMAND path to init.d script
			WICD_SETTINGS path to manager-settings.conf
			WICD_SAVED_APS path to wireless-settings.conf
	*/

	/* _webadmin *//*
	if(basename(strtok($_SERVER['REQUEST_URI'], '?')) === 'body.php') exit();
	*//* _webadmin */
?>
<div id="wicd">
	<!-- settings window -->
	<div id="wicd_settings" class="wicd_window" style="display: none;">
		<div class="wicd_titleBar">
			<span style="padding-left: 5px; color: #ffffff; font-weight: bold;">Settings</span>
			<input type="button" class="wicd_titleBarClose button wicd_closeWindow" value="X">
		</div>
		<div id="wicd_settingsContent">
			Wireless interface: <input type="text" id="wicd_settingsWirelessInterface">
		</div>
		<div class="wicd_windowButtons">
			<input type="button" id="wicd_settingsApply" class="button" value="Apply">
			<input type="button" id="wicd_settingsCancel" class="button" value="Cancel">
		</div>
	</div>

	<div id="wicd_settingsSaved" class="wicd_window" style="display: none;">
		<div class="wicd_titleBar">
			<span style="padding-left: 5px; color: #ffffff; font-weight: bold;">Settings</span>
			<input type="button" class="wicd_titleBarClose button wicd_closeWindow" value="X">
		</div>
		<div>
			<h1 style="text-align: center;">Settings saved</h1>	
		</div>
	</div>

	<!-- about window -->
	<div id="wicd_about" class="wicd_window" style="display: none;">
		<div class="wicd_titleBar">
			<span style="padding-left: 5px; color: #ffffff; font-weight: bold;">About</span>
			<input type="button" class="wicd_titleBarClose button wicd_closeWindow" value="X">
		</div>
		<div id="wicd_aboutContent">
			<h1 style="text-align: center">wicd php gui v2</h1>
			<div style="text-align: center">
				the wicd-cli wrapper<br>
				made for <a style="text-decoration: none; color: #0000ff;" target="_blank" href="https://github.com/MissKittin/server-admin-page">server-admin-page</a><br>
				22-26.10.2019<br>
				licensed under <a style="text-decoration: none; color: #0000ff;" target="_blank" href="https://www.gnu.org/licenses/gpl-3.0.html">GNU General Public License v3.0</a><br>
			</div>
		</div>
	</div>

	<!-- enter password window -->
	<div id="wicd_enterPassword" class="wicd_window" style="display: none;">
		<div class="wicd_titleBar">
			<span style="padding-left: 5px; color: #ffffff; font-weight: bold;">Password</span>
			<input type="button" id="wicd_closeEnterPassword" class="wicd_titleBarClose button" value="X">
		</div>
		<div id="wicd_enterPasswordContent">
			<span style="text-align: center;">Password: <input type="password" id="wicd_enterPasswordText"></span>
		</div>
		<div class="wicd_windowButtons">
			<input type="button" id="wicd_saveNetwork" class="button" value="Save">
			<input type="button" id="wicd_saveNetworkCancel" class="button" value="Cancel">
		</div>
	</div>

	<div id="wicd_networkSaved" class="wicd_window" style="display: none;">
		<div class="wicd_titleBar">
			<span style="padding-left: 5px; color: #ffffff; font-weight: bold;">Password</span>
			<input type="button" class="wicd_titleBarClose button wicd_closeWindow" value="X">
		</div>
		<div>
			<h2 style="text-align: center;">Network saved, connecting...</h1>	
		</div>
	</div>

	<!-- main window -->
	<div id="wicd_content">
		<div class="wicd_titleBar">
			<span style="padding-left: 5px; color: #ffffff; font-weight: bold;">Wicd</span>
			<input type="button" id="wicd_contentHiddenClose" class="wicd_titleBarClose button" value="X">
		</div>
		<div id="wicd_contentButtons" style="display: none;">
			<input type="button" id="wicd_refresh" class="button" value="Refresh">
			<input type="button" id="wicd_disconnect" class="button" value="Disconnect">
			<input type="button" id="wicd_showSettings" class="button" value="Settings">
			<input type="button" id="wicd_showAbout" class="button" value="About">
			<hr>
		</div><script>if(window.jQuery) $('#wicd_contentButtons').show();</script>
		<div id="wicd_contentNetworks">
			<div id="wicd_contentNetworksActiontext">
				<span id="wicd_nojavascript" style="color: #ff0000">Javascript disabled</span>
				<script>
					if(window.jQuery)
					{
						$('#wicd_nojavascript').hide();
						$('#wicd_contentNetworksActiontext').html('Starting...');
					}
					else
					{
						document.getElementById('wicd_nojavascript').innerHTML='jQuery is not loaded';
						document.getElementById('wicd_contentButtons').remove();
						document.getElementById('wicd_settings').remove(); document.getElementById('wicd_settingsSaved').remove(); document.getElementById('wicd_enterPassword').remove(); document.getElementById('wicd_networkSaved').remove(); document.getElementById('wicd_about').remove();
					}
				</script>
			</div>
		</div>
		<div id="wicd_status"></div>
	</div>

	<?php
		// check if wicd-cli is installed
		if(shell_exec($wicd_root_php . '/api/shell.sh wicd checkWicdCli') === 'false')
			echo '
				<script>
					var wicd_startFlag=false;
					if(window.jQuery)
					{
						$("#wicd_contentNetworksActiontext").html("wicd-cli not installed");
						$("#wicd_refresh").remove(); $("#wicd_disconnect").remove(); $("#wicd_showSettings").remove();
						$("#wicd_settings").remove(); $("#wicd_settingsSaved").remove(); $("#wicd_enterPassword").remove(); $("#wicd_networkSaved").remove();
					}
				</script>
			';

		// check if wicd daemon is running
		elseif(shell_exec($wicd_root_php . '/api/shell.sh wicd checkDaemon') === 'false')
			echo '
				<script>
					var wicd_startFlag=false;
					if(window.jQuery)
					{
						$("#wicd_contentNetworksActiontext").html("wicd daemon stopped");
						$("#wicd_refresh").remove(); $("#wicd_disconnect").remove(); $("#wicd_showSettings").remove();
						$("#wicd_settings").remove(); $("#wicd_settingsSaved").remove(); $("#wicd_enterPassword").remove(); $("#wicd_networkSaved").remove();
					}
				</script>
			';
	?>
</div>