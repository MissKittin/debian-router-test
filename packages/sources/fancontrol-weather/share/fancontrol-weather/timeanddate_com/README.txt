timeanddate.com temperature scrapper for fancontrol-weather

You can upload all files to your hosting,
edit server entry in fancontrol-weather.rc
and use fancontrol-weather in remote mode.

You can create 404.php in this dir to use custom error
or fake 404 page.
Note: add at the top on the 404.php:
<?php http_response_code(404); ?>

This script uses a patched version of
PHP Simple HTML DOM Parser. To use non-patched version,
place simple_html_dom.php in php_lib/simple_html_dom
For more info about patch, see
simple_html_dom-patched/README.txt
