#!/bin/sh
set -eu
echo Rendering templates
render-templates.sh /etc/nginx/sites-templates /etc/nginx/conf.d
echo Enabled Configurions:
find "/etc/nginx/conf.d/" -name "*.conf" -print0
echo Starting nginx
echo $@
exec $@
echo Stopping nginx
