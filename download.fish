#!/usr/bin/env fish
# You need:
# - fish (https://fishshell.com/) (You don't need to use it as your shell, but it's a good shellscripting language)
# - gh - github cli (https://cli.github.com)
#	- jq (https://stedolan.github.io/jq/)

set -q ORG[1]; or begin
	echo "I need the org name! I use the environment variable $ORG. example: ORG=octoblu ./download.fish" >&2
	exit 1
end

set repos (gh repo list $ORG --limit 9999 --json name)
set repos_to_clone (echo $repos | jq -r ".[].name")

echo "cloning repos:\n $repos_to_clone"
for u in $repos_to_clone
	echo "cloning $u"
	git clone https://github.com/$ORG/$u repos/$u; or echo "failed to clone $u"
	sleep 5
end

# echo $repos