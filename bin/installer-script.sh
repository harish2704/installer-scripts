#!/usr/bin/env bash


if [ -z "$1" ]; then
  printHelp;
  exit 1;
fi

appRoot=$(readlink -f $(dirname $(readlink -f $0))/.. );
. "$appRoot/lib/installer_common";

printHelp(){
  cat<<EOF
  installer-scripts --update | --check | --install <app_name> | --list
EOF
}

printPackages(){
  cd "$appRoot/packages";
  ls;
}

updateSelf(){
  $0 --install self;
}

installPackage(){
  packageName=$1;
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
    installPackage $2;
    ;;

  --check)
    updateBinLinks;
    ;;
  *)
    printHelp;
esac


