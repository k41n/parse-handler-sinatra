#!/bin/bash

curl -X PUT \
  -H "X-Parse-Application-Id: XMZz2SGfMLfsYJx3DL5Wy1QPcDpPlkxF4t099EAY" \
  -H "X-Parse-Master-Key: HtuzCk2bDCuQ6sEs4aJp9wtFTz1ca8R6vYyP8Czv" \
  -H "Content-Type: application/json" \
  -d '{ "__op": "Delete" }' \
https://api.parse.com/1/hooks/triggers/_User/beforeSave
