<?php if(!function_exists('prevent_direct')) include($system['location_php'] . '/lib/prevent-direct.php'); prevent_direct('config.php'); ?>
<?php

	$logs=array(
		'sample.log' => [$getlog . '/var/log/sample.log'],
		'sample.command' => [$superuser . '/usr/bin/sample.command'],

		'multiple.command' => [
			$superuser . '/usr/bin/multiple.command --a',
			'echo "</pre><hr><pre>"',
			$superuser . '/usr/bin/multiple.command --b'
		]
	);
?>