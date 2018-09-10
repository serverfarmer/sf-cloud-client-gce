#!/bin/sh

echo "skipping setup (deprecated extension)"
exit 0

/opt/farm/ext/cloud-client-gce/setup-gcloud.sh

/opt/farm/scripts/setup/extension.sh sf-php

echo "setting up base directory"
mkdir -p /etc/local/.cloud/gce
