#!/usr/bin/env sh

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

  for i in $appName $installationPath; do
    if [ -d "$i" ]; then
      rm -rf "$i"
    fi 
  done
  installPack;
  cd "$installTmp";
  mv "$appName" "$installationPath";
}

updateBinLinks(){
  cd $localBinDir;
  for i in $(find "$appDir" -name 'binaries.lst'); do
    for f in $(cat $i);do
      if [ -e "./$(basename $f)" ]; then
        echo "Removing already existing file $(basename $f)"
        rm "./$(basename $f)";
      fi
      ln -s $(dirname $i)/$f ./;
    done;
  done;
}

mainInstaller(){
  checkPaths;
  performDownloads;
  doInstall;
  updateBinLinks;
}
export appName='installer-scripts';
export installationPath="$appDir/$appName";

downloadPack(){
  wget 'https://github.com/harish2704/installer-scripts/archive/master.zip' -O "${appName}.zip";
}

installPack(){
  unzip "${appName}.zip"
  mv 'installer-scripts-master' "$appName";
  cd "$appName";
  find ./bin -type f -or -type l  -executable > 'binaries.lst';
}

mainInstaller;
