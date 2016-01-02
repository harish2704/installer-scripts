#!/usr/bin/env bash


appRoot=$(readlink -f $(dirname $(readlink -f $0))/.. );
. "$appRoot/lib/installer_common";

printHelp(){
  cat<<EOF
  installer-scripts <comamnd> [options]
  Available commands
    update  - Self update
    check   - Check ~/.local/Apps directory for and updates all the links in ~/local/bin directory.
    install <app_name> - Install an application. See 'list-apps' command to list Available applications.
                         Other than this list, installer-scripts compatible apps can be directly installed from github
    list-apps - List installable application names.
EOF
}

printPackages(){
  cd "$appRoot/packages";
  ls;
}

updateSelf(){
  $0 install self;
}


installPackage(){
  packageName=$1;
  if [ -z ${packageName%/*} -o $packageName = ${packageName%/*} ];then
    . "$appRoot/packages/$packageName";
  else
    . "$appRoot/packages/_generic";
  fi
  mainInstaller;
}

if [ -z "$1" ]; then
  printHelp;
  exit 1;
fi

case $1 in
  update)
    updateSelf;
    ;;

  list-apps)
    printPackages;
    ;;

  install)
    installPackage $2;
    ;;

  check)
    updateBinLinks;
    ;;
  *)
    printHelp;
esac


