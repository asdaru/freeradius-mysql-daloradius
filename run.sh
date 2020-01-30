#!/bin/bash
echo "start init"

/init.sh

#======== DELETE INIT CODE ==
sed -i "s/^\/init.sh//" /run.sh


mkdir /run/php & 
php-fpm7.0 & 
nginx & 
/usr/sbin/freeradius -X



