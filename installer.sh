#!/usr/bin/env bash

installTmp="$HOME/.local/installTmp";
appDir="$HOME/.local/Apps";
localBinDir="$HOME/.local/bin";

checkPaths() {
  for i in $installTmp $appDir $localBinDir; do
    if [ ! -d "$i" ]; then
      mkdir -p "$i";
    fi
  done
}

performDownloads(){
  cd "$installTmp";
  downloadPack;
}

doInstall(){

  for i in $extractedName $installationPath; do
    if [ -d "$i" ]; then
      rm -rf "$i"
    fi 
  done
  installPack;
  cd "$installTmp";
  mv "$extractedName" "$installationPath";
}

mainInstaller(){
  checkPaths;
  performDownloads;
  doInstall;
}


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
