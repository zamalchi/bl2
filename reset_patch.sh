#!/bin/bash

TERM_GREEN="\033[32m"
TERM_RED="\033[31m"
TERM_NORMAL="\033[0m"

newPatch="backupPatch/Patch.txt.stable$1"

rm -i Patch.txt
cp -vn ${newPatch} Patch.txt
echo

if [ $? -eq 0 ]; then
  echo -e "${TERM_GREEN}--- patch reset (Patch.txt.stable$1) ---${TERM_NORMAL}"
  md5 -r Patch.txt ${newPatch}
else
  echo -e "${TERM_RED}--- patch not reset ---${TERM_NORMAL}"
fi

ls -l | grep Patch.txt
echo

unset newPatch
