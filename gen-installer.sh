#!/usr/bin/env bash


appRoot=$(dirname $(readlink -f $0));
cat "$appRoot/lib/installer_common" "$appRoot/packages/self" > "$appRoot/installer.sh";
echo 'mainInstaller;' >> "$appRoot/installer.sh";
chmod u+x  "$appRoot/installer.sh";

