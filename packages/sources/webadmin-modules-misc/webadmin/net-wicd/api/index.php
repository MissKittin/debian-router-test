<?php /* _webadmin */
/* _webadmin */ $session_regenerate=false; include $system['location_php'] . '/lib/login/login.php'; unset($session_regenerate);
/* _webadmin */ if(!function_exists('prevent_index')) include $system['location_php'] . '/lib/prevent-direct.php';
/* _webadmin */
/* _webadmin */ // check args
/* _webadmin */ if(!isset($_GET['wicd'])) { prevent_index(); exit(); }
/* _webadmin */
/* _webadmin */ // check token
/* _webadmin */ if((!isset($_SESSION['wicd_csrfToken'])) || (!isset($_GET['wicd_csrfToken']))) { prevent_index(); exit(); }
/* _webadmin */ // compare server and client side tokens
/* _webadmin */ if($_SESSION['wicd_csrfToken'] !== $_GET['wicd_csrfToken']) { prevent_index(); exit(); }
/* _webadmin */
/* _webadmin */ // set $wicd_root here
/* _webadmin */ $wicd_root=$system['location_php'] . '/net-wicd/api/';
/* _webadmin */ ?>
<?php
	// wicd php gui - php backend
	// 22.10.2019 - 26.10.2019
	// csrf protection 19.03.2020
	// update 03.02.2020

	/* _webadmin *//*
	$wicd_root=dirname($_SERVER['SCRIPT_FILENAME']).'/';

	// check args
	if(!isset($_GET['wicd'])) exit();

	// check token
	if((!isset($_SESSION['wicd_csrfToken'])) || (!isset($_GET['wicd_csrfToken']))) exit();

	// compare server and client side tokens
	if($_SESSION['wicd_csrfToken'] !== $_GET['wicd_csrfToken']) exit();
	*//* _webadmin */

	switch($_GET['wicd'])
	{
		// settings
		case 'setWifiDevice':
			if(strpos($_GET['device'], '\'') === false) echo shell_exec($wicd_root . 'shell.sh wicd setWifiDevice ' . '\''.$_GET['device'].'\'');
			exit();
		break;
		case 'getWifiDevice':
			echo shell_exec($wicd_root . 'shell.sh wicd getWifiDevice');
			exit();
		break;

		// add network window
		case 'saveNetwork':
			if(strpos($_GET['networkName'].$_GET['networkPassword'], '\'') === false) shell_exec($wicd_root . 'shell.sh wicd saveNetwork ' . '\''.$_GET['networkName'].'\'' . ' ' . '\''.$_GET['networkPassword'].'\'');
			echo 'true';
			exit();
		break;

		// main window buttons
		case 'disconnect':
			shell_exec($wicd_root . 'shell.sh wicd disconnect');
			echo 'true';
			exit();
		break;

		// network switches
		case 'connect':
			if(strpos($_GET['network'], '\'') === false) shell_exec($wicd_root . 'shell.sh wicd connect ' . '\''.$_GET['network'].'\'');
			echo 'true';
			exit();
		break;
		case 'setAutoconnect':
			if(strpos($_GET['network'].$_GET['state'], '\'') === false) echo shell_exec($wicd_root . 'shell.sh wicd setAutoconnect ' . '\''.$_GET['network'].'\'' . ' ' . '\''.$_GET['state'].'\'' . ' "' . $wicd_root . '"');
			exit();
		break;

		// main window networks list
		case 'checkWifiDevice':
			echo shell_exec($wicd_root . 'shell.sh wicd checkWifiDevice');
			exit();
		break;
		case 'getNetworkList':
			$networkListInd=0;
			$networkListEmpty=true;
			$networks=explode(PHP_EOL, shell_exec($wicd_root . 'shell.sh wicd getNetworkList'));
			foreach($networks as $network)
				if($network != '')
				{
					$networkParams=explode('|', $network);

					if($networkParams[3] <= 50)
						$networkQualityImg='range_0.png';
					elseif($networkParams[3] <= 60)
						$networkQualityImg='range_1.png';
					elseif($networkParams[3] <= 70)
						$networkQualityImg='range_2.png';
					elseif($networkParams[3] <= 80)
						$networkQualityImg='range_3.png';
					elseif($networkParams[3] <= 90)
						$networkQualityImg='range_4.png';
					elseif($networkParams[3] > 90)
						$networkQualityImg='range_5.png';

					$networkList[$networkListInd]['name']=htmlspecialchars($networkParams[0]);
					$networkList[$networkListInd]['mac']=$networkParams[1];
					$networkList[$networkListInd]['encryption']=$networkParams[2];
					$networkList[$networkListInd]['quality']=$networkParams[3];
					$networkList[$networkListInd]['qualityImg']=$networkQualityImg;
					$networkList[$networkListInd]['channel']=$networkParams[4];
					$networkList[$networkListInd]['saved']=shell_exec($wicd_root . 'shell.sh wicd isNetworkSaved ' . $networkParams[1]);
					if(shell_exec($wicd_root . 'shell.sh wicd getAutoconnect "' . $networkParams[1] . '" "' . $wicd_root . '"') == 'true')
						$networkList[$networkListInd]['autoconnect']='true';
					else
						$networkList[$networkListInd]['autoconnect']='false';

					++$networkListInd;
					$networkListEmpty=false;
				}

			if($networkListEmpty)
				echo json_encode(array());
			else
				echo json_encode($networkList);

			exit();
		break;

		// main window status info
		case 'getConnectionStatus':
			echo shell_exec($wicd_root . 'shell.sh wicd getConnectionStatus');
			exit();
		break;

		// no ?wicd=command no access
		default:
			prevent_index(); /* _webadmin */
			exit();
		break;
	}
?>