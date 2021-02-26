<?php /* _webadmin */
/* _webadmin */ if(!function_exists('prevent_direct')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_direct('index.full.php');
/* _webadmin */ if(!isset($_GET['icons'])) { prevent_index(); exit(); }
/* _webadmin */ if(!isset($_GET['root'])) { prevent_index(); exit(); }
/* _webadmin */ $session_regenerate=false; include $system['location_php'] . '/lib/login/login.php'; unset($session_regenerate);
/* _webadmin */ ?>
<?php
	// wicd php gui - jQuery backend
	// 22.10.2019 - 26.10.2019
	// update 03.02.2020
	// remove debugging: sed '/\/\* _remove_debugging \*\//d' index.full.php
	// minifier: https://jscompress.com

	/* _webadmin *//*
	if((!isset($_GET['icons'])) || (!isset($_GET['root'])) || (basename($_SERVER['SCRIPT_NAME']) === 'index.full.php')) exit();
	*//* _webadmin */

	// generate unique token and store it on server side
	$_SESSION['wicd_csrfToken']=substr(base_convert(sha1(uniqid(mt_rand())), 16, 36), 0, 32);

	// filetype header
	header('Content-type: text/javascript; charset: UTF-8');
	header('Cache-Control: no-store, no-cache, must-revalidate'); header('Pragma: no-cache'); // because token is regenerated
?>

// settings
var wicd_debugFlag=false; // enable/disable console.log() /* _remove_debugging */
var wicd_root='<?php echo $_GET['root']; ?>';
var wicd_icons='<?php echo $_GET['icons']; ?>';

// auto-generated flags
var wicd_csrfToken='&wicd_csrfToken=<?php echo $_SESSION['wicd_csrfToken']; ?>'; // send token on client side

// flags
var wicd_startFlag=true; // if an error occured
/* var wicd_addNetworkName is defined in body.php and removed on add network window close */

if(window.jQuery)
{
	/* starter */
	$(document).ready(function(){
		if(wicd_startFlag)
		{
			if(wicd_debugFlag) console.log('start: starting application...'); /* _remove_debugging */
			wicd_defineEvents();
			wicd_getConnectionStatus();
			wicd_getNetworkList();
			if(wicd_debugFlag) console.log('start: application ready'); /* _remove_debugging */
		}
		else
		{ /* _remove_debugging */
			wicd_defineEvents();
			if(wicd_debugFlag) console.log('system error, stop'); /* _remove_debugging */
		} /* _remove_debugging */
	});

	/* define events */
	function wicd_defineEvents()
	{
		if(wicd_debugFlag) console.log('defineEvents: started'); /* _remove_debugging */

		/* windows - close button */
		$('.wicd_closeWindow').click(function(){
			$(this).parent().parent().hide();
			if(wicd_debugFlag) /* _remove_debugging */
			{ /* _remove_debugging */
				var closedWindowId=$(this).parent().parent().attr('id'); /* _remove_debugging */
				closedWindowId=closedWindowId.replace('wicd_', ''); /* _remove_debugging */
				console.log('event (.wicd_closeWindow): ' + closedWindowId + ' window closed'); /* _remove_debugging */
			} /* _remove_debugging */
		});

		/* windows - settings */

			/* apply settings */
			$('#wicd_settingsApply').click(function(){
				var wirelessInterface=$('#wicd_settingsWirelessInterface').val();
				$.get(wicd_root + '/api?wicd=setWifiDevice&device=' + wirelessInterface + wicd_csrfToken, function(data){
					if(wicd_debugFlag) console.log('event: settingsApply: set wireless interface to ' + wirelessInterface + ', server returned ' + data); /* _remove_debugging */
				});

				$('#wicd_settings').hide();
				$('#wicd_settingsSaved').show();
				setTimeout(function(){
					$('#wicd_settingsSaved').hide();
				}, 1000);
				if(wicd_debugFlag) console.log('event: settings applied'); /* _remove_debugging */
			});

			/* cancel settings */
			$('#wicd_settingsCancel').click(function(){
				$('#wicd_settings').hide();
				if(wicd_debugFlag) console.log('event: settings cancelled'); /* _remove_debugging */
			});

		/* windows - add network */

			/* close enter password window */
			$('#wicd_closeEnterPassword').click(function(){
				delete wicd_addNetworkName;
				$('#wicd_enterPassword').hide();
				if(wicd_debugFlag) console.log('event: password prompt closed'); /* _remove_debugging */
			});

			/* save network button */
			$('#wicd_saveNetwork').click(function(){
				var password=$('#wicd_enterPasswordText').val();
				if(password != '')
				{
					$.get(wicd_root + '/api?wicd=saveNetwork&networkName=' + wicd_addNetworkName + '&networkPassword=' + password + wicd_csrfToken, function(data){
						if(wicd_debugFlag) console.log('event: wicd_saveNetwork: server returned ' + data); /* _remove_debugging */
					});

					$('#wicd_enterPasswordText').val('');
					delete wicd_addNetworkName;
					$('#wicd_enterPassword').hide();
					$('#wicd_networkSaved').show();
					setTimeout(function(){
						$('#wicd_networkSaved').hide();
					}, 1000);

					wicd_getConnectionStatus();
					wicd_getNetworkList();
					if(wicd_debugFlag) console.log('event: network saved'); /* _remove_debugging */
				}
			});

			/* add network cancel button */
			$('#wicd_saveNetworkCancel').click(function(){
				$('#wicd_enterPasswordText').val('');
				delete wicd_addNetworkName;
				$('#wicd_enterPassword').hide();
				if(wicd_debugFlag) console.log('event: save network cancelled'); /* _remove_debugging */
			});

		/* wicd main window */

			/* refresh button */
			$('#wicd_refresh').click(function(){
				if(wicd_debugFlag) console.log('event: refresh button clicked'); /* _remove_debugging */
				wicd_getConnectionStatus();
				wicd_getNetworkList();
			});

			/* disconnect button */
			$('#wicd_disconnect').click(function(){
				$.get(wicd_root + '/api?wicd=disconnect' + wicd_csrfToken, function(data){
					if(wicd_debugFlag) console.log('event: disconnect button clicked, server returned ' + data); /* _remove_debugging */
				});
			});

			/* open settings button */
			$('#wicd_showSettings').click(function(){
				$.get(wicd_root + '/api?wicd=getWifiDevice' + wicd_csrfToken, function(data){
					$('#wicd_settingsWirelessInterface').val(data);
				});

				$('#wicd_settings').show();
				if(wicd_debugFlag) console.log('event: settings opened'); /* _remove_debugging */
			});

			/* open about window button */
			$('#wicd_showAbout').click(function(){
				$('#wicd_about').show();
				if(wicd_debugFlag) console.log('event: about window opened'); /* _remove_debugging */
			});

			/* add network */
			$('.wicd_addNetwork').click(function(){
				$('#wicd_enterPassword').show();
				$('#wicd_enterPasswordText').focus();
				if(wicd_debugFlag) console.log('event: add network opened'); /* _remove_debugging */
			});

			/* connect to network */
			$('.wicd_connectToNetwork').click(function(){
				$.get(wicd_root + '/api?wicd=connect&network=' + wicd_connectToNetworkName + wicd_csrfToken, function(data){
					if(wicd_debugFlag) console.log('event: connect to ' + wicd_connectToNetworkName + ', server returned ' + data); /* _remove_debugging */
					wicd_getNetworkList();
				});
			});

			/* autoconnect checkbox */
			$('.wicd_contentNetworksNetworkAutoconnect').change(function(){
				var checkboxname=$(this).attr('name');
				if(this.checked)
					$.get(wicd_root + '/api?wicd=setAutoconnect&state=true&network=' + checkboxname + wicd_csrfToken, function(data){
						if(wicd_debugFlag) console.log('event: contentNetworksNetworkAutoconnect: enabled for ' + checkboxname + ', server returned ' + data); /* _remove_debugging */
					});
				else
					$.get(wicd_root + '/api?wicd=setAutoconnect&state=false&network=' + checkboxname + wicd_csrfToken, function(data){
						if(wicd_debugFlag) console.log('event: contentNetworksNetworkAutoconnect: disabled for ' + checkboxname + ', server returned ' + data); /* _remove_debugging */
					});
			});

		if(wicd_debugFlag) console.log('defineEvents: events defined'); /* _remove_debugging */
	}

	/* get network list */
	function wicd_getNetworkList()
	{
		if(wicd_debugFlag) console.log('getNetworkList: getting network list...'); /* _remove_debugging */
		$('#wicd_contentNetworks').html('<div id="wicd_contentNetworksActiontext">Searching...</div>');

		$.get(wicd_root + '/api?wicd=checkWifiDevice' + wicd_csrfToken, function(data){ // check if wifi device is connected
			if(data == 'true')
			{ // download data
				$.getJSON(wicd_root + '/api?wicd=getNetworkList' + wicd_csrfToken, function(data){
					if(data == '') // if no networks available
						$('#wicd_contentNetworks').html('<div id="wicd_contentNetworksActiontext">No networks available</div>');
					else
					{
						var output=''; // output html
						$(data).each(function(index, value){
							if(value.saved == 'true')
							{
								outputButton='<input type="button" class="wicd_connectToNetwork button" name="' + value.name + '" value="Connect" onclick="javascript:wicd_connectToNetworkName=' + "'" + value.name + "'" + '">';
								if(value.autoconnect == 'true')
									autoconnectCheckbox='<input type="checkbox" name="' + value.mac + '" class="wicd_contentNetworksNetworkAutoconnect" checked>Autoconnect<br>';
								else
									autoconnectCheckbox='<input type="checkbox" name="' + value.mac + '" class="wicd_contentNetworksNetworkAutoconnect">Autoconnect<br>';
							}
							else
							{
								outputButton='<input type="button" class="wicd_addNetwork button" name="' + value.name + '" value="Add" onclick="javascript:wicd_addNetworkName=' + "'" + value.name + "'" + '">';
								autoconnectCheckbox='<br>';
							}

							output=output
								+ '<div class="wicd_contentNetworksNetwork">\
									<span class="wicd_contentNetworksNetworkName">'+ value.name + '</span><br>\
									<div class="wicd_contentNetworksNetworkSignalicon">\
										<br>\
										<img src="' + wicd_icons + '/' + value.qualityImg + '" alt="quality" class="wicd_contentNetworksNetworkSignaliconQualityImg">\
									</div>\
									<div class="wicd_contentNetworksNetworkDetails">'
										+ value.mac + /* ' ' + value.quality + */ ' ' + value.encryption + ' Channel ' + value.channel + '<br>'
										+ autoconnectCheckbox
										+ outputButton
									+ '</div>\
								</div>';
						});
						$('#wicd_contentNetworks').html(output);
					}

					wicd_defineEvents(); // redefine events
					if(wicd_debugFlag) console.log('getNetworkList: network list displayed'); /* _remove_debugging */
				})
				.fail(function(){ // data download error
					if(wicd_debugFlag) console.log('getNetworkList: server connection failed'); /* _remove_debugging */
					$('#wicd_contentNetworks').html('<div id="wicd_contentNetworksActiontext">Server connection error</div>');
				});
			}
			else
			{ // wifi device not connected
				if(wicd_debugFlag) console.log('getNetworkList: checkWifiDevice returned false'); /* _remove_debugging */
				$('#wicd_contentNetworks').html('<div id="wicd_contentNetworksActiontext">Wifi device not connected</div>');
				wicd_defineEvents(); // redefine events
			}
		});
	}

	/* get connection status */
	function wicd_getConnectionStatus()
	{
		if(wicd_debugFlag) console.log('getConnectionStatus: started...'); /* _remove_debugging */
		$('#wicd_status').load(wicd_root + '/api?wicd=getConnectionStatus' + wicd_csrfToken);
		if(wicd_debugFlag) console.log('getConnectionStatus: connection status refreshed'); /* _remove_debugging */
	}
}