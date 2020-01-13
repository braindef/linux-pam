#!/bin/bash

sudo apt-get install autopoint
sudo apt-get install libtool
sudo apt-get install freebsd-glue
sudo apt-get install flex

./autogen.sh
./configure

echo "comment out: man_MANS = access.conf.5 pam_access.8" in /modules/pam_access 
echo "comment out: man_MANS = pam_debug.8" 

sed -i -e 's/^man_MANS/#man_MANS/g' modules/*/Makefile

make
