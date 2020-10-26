rc.local - package configuration

Script names:
	[P](S|K)(queue number)_name.rc
		where P is executed in background (without P in foreground)
		S means enabled, K - disabled
		.rc postfix is required

Scripts without P are executed first. Then a queue with "P" is executed in the background.
