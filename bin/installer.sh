#!/usr/bin/env bash

echo $0 $1 $2 $3;

if [ -z "$1" ]; then
  cat<<EEE
  installer-scripts --update | --install <app_name> | --list
EEE
  exit 1;
fi

appRoot=$(readlink -f $(dirname $(readlink -f $0))/.. );
. "$appRoot/lib/installer_common";

printPackages(){
  cd $appDir/installer-scripts/packages;
  ls;
}

updateSelf(){
  $0 --install self;
}

installPackage(){
  packageName=$2;
  . "$appRoot/packages/$packageName";
  mainInstaller;
}

case $1 in
  --update)
    updateSelf;
    ;;

  --list)
    printPackages;
    ;;

  --install)
    installPackage;
    ;;
esac



