#!/usr/bin/env fish

#ex:
# ORG_NAME=octoblu ./download.fish

set org_id (curl -H Authorization: $GITHUB_TOKEN  https://api.github.com/orgs/$ORG_NAME | jq .id)
echo $org_id

set query """
    query($endCursor: String) {
      viewer {
        repositories(first: 100, after: $endCursor) {
          nodes { organizationId $org_id }
          pageInfo {
            hasNextPage
            endCursor
          }
        }
      }
    }
"""

echo $query

gh api graphql --paginate -f query=$query | jq .
