#!/bin/bash

# start filebeat service
service filebeat start

# start apache in the foreground
/usr/sbin/apache2ctl -D FOREGROUND
