#!/bin/bash

curl "http://localhost:4741/tools" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "tools": {
      "name": "'"${NAME}"'",
      "quantity": "'"${QUANTITY}"'",
      "available": "'"${AVAILABLE}"'"
    }
  }'
echo
