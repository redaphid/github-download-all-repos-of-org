#!/usr/bin/env fish
# You need:
# - fish (https://fishshell.com/) (You don't need to use it as your shell, but it's a good shellscripting language)
# - gh - github cli (https://cli.github.com)
#	- jq (https://stedolan.github.io/jq/)

set -q OLD_ORG[1]; or begin
	echo "I need the org name! I use the environment variable $OLD_ORG. example: OLD_ORG=octoblu NEW_ORG=meshnu ./fork.fish" >&2
	exit 1
end

set -q NEW_ORG[1]; or begin
	echo "I need the org name! I use the environment variable $NEW_ORG. example: OLD_ORG=octoblu NEW_ORG=meshnu ./fork.fish" >&2
	exit 1
end

set repos (gh repo list $OLD_ORG --limit 9999 --json name)
set repos_to_clone (echo $repos | jq -r ".[].name")

echo "cloning repos:\n $repos_to_clone"
for u in $repos_to_clone
	echo "forking $u"
	gh repo fork $OLD_ORG/$u --clone=false --org $NEW_ORG; or echo "failed to clone $u"
	sleep 5
end

# echo $repos