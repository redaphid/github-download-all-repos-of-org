#!/usr/bin/env fish
set repos (gh repo list octoblu --limit 9999 --json name,url)

set urls_to_clone (echo $repos | jq -r ".[].url")

for u in $urls_to_clone
	echo $u
end

# echo $repos