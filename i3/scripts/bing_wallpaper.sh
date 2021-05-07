#!/bin/bash

# variety already
SED_GROUP2="\([^&]*\)"
SED_GROUP1="\(\/th?id=$SED_GROUP2\)"
SED_PATTERN=".*background-image: url($SED_GROUP1.*"
SED_DEST_DIR=".\/"

curl -s $(curl -s www.bing.com |sed -n "s/$SED_PATTERN/https:\/\/www.bing.com\1 -o $DEST_DIR\2/p")

# use variety
