#!/bin/bash

curl "http://localhost:4741/tools/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  -d-header "Authorization: Token token=${TOKEN}"

echo
