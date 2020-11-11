<?php if(!function_exists('prevent_direct')) include($system['location_php'] . '/lib/prevent-direct.php'); prevent_direct('notifications.php');?>
<?php
	function hide_scrollbars()
	{
		global $system;

		echo '<style> body { overflow: hidden; } </style>';
		// meta refresh
		echo '<meta http-equiv="refresh" content="0; url=' . $system['location_html'] . '/">';
		// hide content on refresh
		echo '<!--[if !IE]><!--><script>
			document.addEventListener("DOMContentLoaded", function(){
				var notificationshideelements=document.body.childNodes;
				for(var i=0; i<notificationshideelements.length; i++)
				{
					if(notificationshideelements[i].style)
						notificationshideelements[i].style.display="none";
				}
			});
		</script><!--<![endif]-->';
	}

	if(isset($_GET['remove-notify']))
	{
		if(strpos($_GET['remove-notify'], '\'') === false) shell_exec($system['location_php'] . '/home-plugins/' . $plugin . '/shell.sh remove-notify ' . '\''.$_GET['remove-notify'].'\'');
		hide_scrollbars();
	}
	if(isset($_GET['clear-notifications']))
	{
		shell_exec($system['location_php'] . '/home-plugins/' . $plugin . '/shell.sh clear-notifications');
		hide_scrollbars();
	}
?>
<div id="notifications">
	<?php
		$notifications=shell_exec($system['location_php'] . '/home-plugins/' . $plugin . '/shell.sh get-notifications');
		if($notifications != '')
		{
			echo '<h1><a href="?clear-notifications" style="text-decoration: none; color: var(--content_text-color);">Notifications</a></h1>';
			echo "$notifications";
		}
		unset($notifications); // clear environment
	?>
</div>