#!/bin/bash

curl "http://localhost:4741/tools/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "tools": {
      "name": "'"${NAME}"'",
      "quantity": "'"${QUANTITY}"'",
      "available": "'"${AVAILABLE}"'"
    }
  }'
echo
