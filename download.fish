#!/usr/bin/env fish
echo (gh repo list octoblu --limit 9999 --json name,url) | jq