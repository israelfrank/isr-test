#!/bin/bash
echo "$(jq '.' += {$chartName: "{}"}" json.json 
