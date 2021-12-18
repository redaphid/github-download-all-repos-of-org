#!/bin/bash

set ORG_ID = curl -H Authorization: $GITHUB_TOKEN  https://api.github.com/orgs/$ORG_NAME | jq .id
echo $ORG_ID
# gh api graphql --paginate -f query='                                                                                                                                                                           
#     query($endCursor: String) {
#       viewer {
#         repositories(first: 100, after: $endCursor) {
#           nodes { organizationId: octoblu }
#           pageInfo {
#             hasNextPage
#             endCursor
#           }
#         }
#       }
#     }
#   '
