#!/bin/bash


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
