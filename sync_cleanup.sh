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

DB_DIR="/cygdrive/c/Users/../db"
LOG_DIR="/cygdrive/c/Users/../log"
JELLY_DIR="/cygdrive/c/Users/../test-.."

if [ -d "$DB_DIR" ]; then
  (rm -r $DB_DIR) &
  spinner
  echo "Removed DB Dir.."
else
  echo "DB Dir doesn't exist.."
fi

if [ -d "$LOG_DIR" ]; then
  (rm -r $LOG_DIR) &
  spinner
  echo "Removed LOG Dir.."
else
  echo "LOG Dir doesn't exist.."
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
(mkdir "test-odrive")
echo "Done!"
