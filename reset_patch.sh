#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
NORMAL="\033[0m"

correctDir="/Users/Seumas/Library/Application Support/Steam/SteamApps/common/Borderlands 2/Borderlands2.app/Contents/GameData/Binaries"

if [ -d "${correctDir}" ]; then
  cd "${correctDir}"
else
  exit 1
fi

newPatch="backupPatch/Patch.txt.stable"

rm -i Patch.txt
cp -vn ${newPatch} Patch.txt
# don't put anything between these lines
if [ $? -eq 0 ]; then
  echo -e "\n${GREEN}--- patch reset (Patch.txt.stable) ---${NORMAL}"
  md5 -r Patch.txt ${newPatch}
else
  echo -e "\n${RED}--- patch not reset ---${NORMAL}"
fi

ls -l | grep Patch.txt
echo

unset correctDir newPatch GREEN RED NORMAL
