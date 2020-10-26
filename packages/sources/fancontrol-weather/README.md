# fancontrol-weather
My homemade router has "passive cooling" - CPU fan is stopped. But in summer, the CPU can overheat.

# How it works
Daemon activates between `$activate_at_hour` and `$deactivate_at_hour`,  
in local mode runs scrapper, that returns current temperature (or error),  
**in remote mode uses wget to download current temperature from scrapper**  
and compares the obtained temperature with `$limit_temperature`.  
If temperature is above `$limit_temperature`, stops the fancontrol daemon.  
If the temperature remains below `$limit_temperature` for `$winter_wait_cycles` (1 cycle == 30 min, 0 - disable), stops the fancontrol daemon for 15 min.

# How scrappers works
You can write scrappers in any language and use any sources.  
Main `scrapper` file tests if local scrapper is working (this is always shellscript) and this file is required in LS. Run main scrapper's code always from this script and always exit with error if an error occurs.  
In `scrapper.rc` put `scrapper_internet_required='true'` if scrapper requires internet connection, or `scrapper_internet_required='false'` if not. This file is also required in LS.  
Remember to send 400 http response code in remote scrappers or exit with error (>0) in local scrappers (or both in hybrid scrappers) on error.

# Extras
* rc.local scrpit - log file path

# timeanddate.com scrapper
It's a hybrid scrapper. You can use it as a sample.  
**It uses patched version of PHP Simple HTML DOM Parser** and requires PHP in local mode.  
For more info, read `timeanddate_com/README.txt`.
