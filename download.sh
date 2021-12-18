#!/bin/bash
CloneAll() {
    # Make the url to the input github organization's repository page.
    echo "ORG" $ORG_URL
    ORG_URL="https://api.github.com/orgs/${1}/repos?per_page=200";

    # List of all repositories of that organization (seperated by newline-eol).
    ALL_REPOS=$(curl -s ${ORG_URL} | grep html_url | awk 'NR%2 == 0' \
                | cut -d ':' -f 2-3 | tr -d '",');

    # Clone all the repositories.
    for ORG_REPO in ${ALL_REPOS}; do
        git clone ${ORG_REPO}.git;
    done
}

CloneAll $ARGS
