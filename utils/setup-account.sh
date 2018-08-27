#!/bin/bash
. /opt/farm/scripts/functions.dialog

if [ "$1" != "default" ]; then
	echo "error: multiple accounts are not supported by Google Cloud provider"
	exit 1
fi

if [ "`which gcloud 2>/dev/null`" = "" ]; then
	if [ -f '/root/google-cloud-sdk/path.bash.inc' ]; then . '/root/google-cloud-sdk/path.bash.inc'; fi
	if [ -f '/root/google-cloud-sdk/completion.bash.inc' ]; then . '/root/google-cloud-sdk/completion.bash.inc'; fi
fi

if [ ! -d /root/.config/gcloud ]; then
	gcloud init
fi

if [ "`gcloud auth list 2>/dev/null |grep ACTIVE`" = "" ]; then
	gcloud auth login
fi

if [ -f /etc/local/.cloud/gce/default.sh ]; then
	exit 0
fi

REGION="`input \"enter GCE region to use\" europe-west1-c`"
DEFAULT_INSTANCE_TYPE="`input \"enter GCE default instance type\" n1-standard-1`"

mkdir -p /etc/local/.cloud/gce
echo "#!/bin/sh
#
# Google Compute Engine requires \"gcloud\" command line client, a part of
# Google Cloud SDK. This tool, as opposite to command line clients for other
# cloud services, doesn't support multiple profiles.
#
############################################################################
#
# Default region to use:
#
export GCE_REGION=$REGION
#
# Ubuntu project (mostly you don't need to change this):
#
export GCE_PROJECT=ubuntu-os-cloud
#
# Default instance type to use, when type isn't explicitely specified
# (use list-instance-types.sh script to discover all instance types):
#
export GCE_DEFAULT_INSTANCE_TYPE=$DEFAULT_INSTANCE_TYPE
" >/etc/local/.cloud/gce/default.sh
chmod 0600 /etc/local/.cloud/gce/default.sh
