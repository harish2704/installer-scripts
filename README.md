# installer-scripts
A methodology for installing any software on my ubuntu system. It is supposed to used by users without privileges, Inspired by home-brew system

## Installation

**Add `$HOME/.local/bin` to your `PATH`**
```
echo 'export PATH="$HOME/.local/bin:$PATH";' >> ~/.profile
```

```bash
wget 'https://raw.githubusercontent.com/harish2704/installer-scripts/master/installer.sh' -O - | sh
```

## Important directories

* ```$HOME/.local/Apps```  --> Application installation root directory. It is like C://ProgramFiles in Windows.
* ```$HOME/.local/installTmp``` --> Temporary directory where all installation files are downloaded.
* ```$HOME/.local/Apps/<app_name>/binaries.lst``` --> List of executable files provided by this particular application ( say 'app_name' ).
* ```$HOME/.local/bin/``` --> Symbolic links are created here for each file in ```$HOME/.local/Apps/<app_name>/binaries.lst``` .
* ```$HOME/.local/bin/installer-script.sh``` -->  The main executable script.
* ```$HOME/.local/Apps/installer-scripts``` -->  Installation directory of this application
* ```$HOME/.local/Apps/installer-scripts/packages/<app_name>``` --> Installation script for 'app_name'

## Usage

* List aplications that can be installed using 'installer-script.sh'
```bash
installer-script.sh list-apps
```

* Update 'installer-script' application
```bash
installer-script.sh update
```

* Install a application using 'installer-script' application
```bash
installer-script.sh install <app_name>
```

## Example
* `installer-script.sh install nodejs`
  -> Installs using in-built installation script.
* `installer-script.sh install https://github.com/harish2704/neovim-konsole`
  -> Installs using generic formula.`
