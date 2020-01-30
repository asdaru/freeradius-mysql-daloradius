#!/bin/bash

/init.sh

#======== DELETE INIT CODE ==
sed -i "s/^\/init.sh//" /run.sh

mysqld_safe >/dev/null & 

php-fpm7.0 & 
nginx & 
/usr/sbin/freeradius -X

