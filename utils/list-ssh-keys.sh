#!/bin/sh

ls /etc/local/.ssh/id_gce_* |grep -v \.pub$ |grep -v \.meta$ |sed s/\\\/etc\\\/local\\\/.ssh\\\/id_gce_//g
