<?php if(!function_exists('prevent_direct')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_direct('check-https.php'); ?>
<div>
	<span id="no-https" style="display: none;" class="content_warning">&#9888; You are not using HTTPS</span>
	<script>if(location.protocol != 'https:') document.getElementById('no-https').style.display='';</script>
</div>
