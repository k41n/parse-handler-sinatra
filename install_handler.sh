#!/bin/bash

curl -X POST \
  -H "X-Parse-Application-Id: XMZz2SGfMLfsYJx3DL5Wy1QPcDpPlkxF4t099EAY" \
  -H "X-Parse-Master-Key: HtuzCk2bDCuQ6sEs4aJp9wtFTz1ca8R6vYyP8Czv" \
  -H "Content-Type: application/json" \
  -d '{"className": "_User", "triggerName": "afterSave", "url": "https://parsecom-aweber-bridge.herokuapp.com/api/parsecom/bahh0VeiPhoa"}' \
https://api.parse.com/1/hooks/triggers
