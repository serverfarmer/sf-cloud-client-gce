#!/bin/sh
. /etc/local/.cloud/gce/default.sh

/opt/farm/ext/cloud-client-gce/utils/list-images.sh |grep $GCE_PROJECT |grep $GCE_FAMILY |awk '{ print $1 }'
