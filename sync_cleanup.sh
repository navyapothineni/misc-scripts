#!/bin/bash

spinner()
{
    local pid=$!
    local delay=0.75
    local spinstr='|/-\'
    echo "Removing stuff"
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

APPDATA_DIR="/Users/navpot/AppData"
JELLY_DIR="/Users/navpot/sync"

if [ -d "$APPDATA_DIR" ]; then
  (rm -r $APPDATA_DIR) &
  spinner
  echo "Removed AppData Dir.."
else
  echo "AppData Dir doesn't exist.."
fi

if [ -d "$JELLY_DIR" ]; then
  (rm -r $JELLY_DIR) &
  spinner
  echo "Removed Jellyfish Dir.."
else
  echo "Jellyfish Dir doesn't exist.."
fi
echo "Finished cleanup!"
echo "Making new directory"
(mkdir "sync")
echo "Done!"
