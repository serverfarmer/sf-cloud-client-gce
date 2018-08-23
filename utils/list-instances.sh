#!/bin/sh

gcloud compute instances list --format json \
	|/opt/farm/ext/cloud-client-gce/internal/parse-instances.php
