#!/usr/bin/php
<?php
require_once "/opt/farm/ext/cloud-client-gce/internal/include.php";

# TODO: rewrite this script

$json = shell_exec("gcloud compute instances list --format json");
$data = json_decode($json, true);

if (is_null($data))
	die("error: $json\n");

foreach ($data as $instance)
	decode_instance($instance);
