#!/usr/bin/env fish

#ex: 
# ORG_NAME=octoblu ./download.fish

set ORG_ID (curl -H Authorization: $GITHUB_TOKEN  https://api.github.com/orgs/$ORG_NAME | jq .id)
echo $ORG_ID