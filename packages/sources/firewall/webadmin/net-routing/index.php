<?php include $system['location_php'] . '/lib/login/login.php'; ?>
<?php chdir($system['location_php']); ?>
<?php $shell_sh_location=$system['location_php'] . '/net-routing/shell.sh'; ?>
<!DOCTYPE html>
<html>
	<head>
		<title>Routing & Firewall</title>
		<?php include $system['location_php'] . '/lib/htmlheaders.php'; ?>
	</head>
	<body>
		<?php include $system['location_php'] . '/lib/header.php'; ?>
		<div id="system_body">
			<?php include $system['location_php'] . '/lib/menu/menu.php'; ?>
			<div id="system_content">
				<h1>Routing IPv4</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list route'); ?></pre>
				<h1>Routing IPv6</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list route6'); ?></pre>
				<!-- <hr> -->
				<!-- <pre><?php /* echo shell_exec($shell_sh_location . ' list-iptables-settings routing'); */ ?></pre> -->
				<h1>Bridges</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list brctl'); ?></pre>
				<h1>Bondings</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list bonds'); ?></pre>
				<h1>Firewall IPv4</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list iptables'); ?></pre>
				<!-- <hr> -->
				<!-- <pre><?php /* echo shell_exec($shell_sh_location . ' list-iptables-settings firewall'); */ ?></pre> -->
				<h1>Firewall IPv6</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list ip6tables'); ?></pre>
				<h1>IPset firewall extension</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list ipset'); ?></pre>
				<h1>Bridges' firewall</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list ebtables'); ?></pre>
				<h1>ARP table</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list arp'); ?></pre>
				<h1>IPv6 neighborhood</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list ipv6-neighbor'); ?></pre>
				<h1>Opened ports</h1>
				<pre><?php echo shell_exec($shell_sh_location . ' net-routing-list netstat'); ?></pre><br>
			</div>
		</div>
	</body>
</html>