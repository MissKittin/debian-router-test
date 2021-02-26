<?php if(!function_exists('prevent_direct')) include $system['location_php'] . '/lib/prevent-direct.php'; prevent_direct('login.php'); ?>
<?php
	$login_method='multi_bcrypt'; // multi || multi_bcrypt

	// multi/multi_bcrypt method config
	$USER=['user'];
	$PASSWORD=['$2y$10$1WomD/g1JXLwAbukAgeOxOX3sOz9zodHGMQLvbl.8w8mcZzucKSSa'];
?>