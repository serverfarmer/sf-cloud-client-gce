#!/usr/bin/php
<?php
require_once "/opt/farm/ext/cloud-client-gce/internal/include.php";

$json = "";
$fp = fopen("php://stdin", "r");

while ($line = fgets($fp))
	$json .= $line;

fclose($fp);
$data = json_decode($json, true);

if (is_null($data))
	die("error: $json\n");

decode_instance($data[0]);
