#!/usr/bin/env bash

. $(dirname $(readlink -f $0))/installer_common;
export extractedName='installer-scripts-master';
export installationPath="$appDir/$extractedName";

downloadPack(){
  wget -c 'https://github.com/harish2704/installer-scripts/archive/master.zip';
}

installPack(){
  unzip 'master.zip'
  cd "$extractedName";
  # find ./ -type f -or -type l  -executable > 'binaries.lst';
  touch 'binaries.lst';
}


mainInstaller;
