### Intro

  This repository contains my configuration files, and it will enable **beginners** of emacs to quickly build a development environment for golang.
  
  These configurations' original author is [lienhua34](https://github.com/lienhua34),I have modified and added some features according to his blog.

### Installation

  The `.entry.el` in the root directory is the total ingress configuration file. Under `elisp` folder, each directory has a `.entry.el` as subprofile entry, they will load various development environment.
  You need to make a backup of the `.emacs` conf and the `.emacs.d` folder first, you can execute command like:
  
   ```shell
    cd ~
    mv .emacs .emacs.bak && mv .emacs.d .emacs.d.bak
   ```
  
  To install it simply do following from you terminal:

   ```shell
    git clone https://github.com/lryong/emacs_conf 
    cp -rf emacs_golang_conf/emacs.d ~/.emacs.d
    cp emacs_golang_conf/emacs ~/.emacs

   ```
   
   By modifying `.entry.el` in `.emacs.d` folder and `.emacs` you can add wanted features.

### Features

- [go-mode](https://github.com/dominikh/go-mode.el): Emacs mode for the Go programming language
- [goflymake](https://github.com/dougm/goflymake): Emacs flymake-mode for golang
- [auto-complete](https://github.com/auto-complete/auto-complete): Emacs auto-complete package
- [solarized-theme](https://github.com/sellout/emacs-color-theme-solarized): Emacs highlighting using Ethan Schoonover’s Solarized color scheme

### User Guide

 - Set **golang** environment variable Firstly.
 
 - Need to install the following:
     - godoc (go get golang.org/x/tools/cmd/godoc), when installed, execute command: `gocode set propose-builtins true`
     - godef (go get github.com/rogpeppe/godef)
     - gocode (go get -u github.com/nsf/gocode)
  
 - When use *auto-complete* not successfule, install it manually:

  ```shell
    git clone https://github.com/auto-complete/auto-complete.git 
    cd auto-complete/
    emacs -batch -l etc/install.el
  ```
  
   When launch emacs, it will load *auto-complete-mode* and may prompt that `popup` cannot be found, find `popup.el` in this repository and copy it to the folder `~/.emacs.d/elisp/common/auto-complete`. 
    
   **go-autocomplete** may fail. Copy `emacs/go-autocomplete.el` file from the *gocode* distribution or *gocode* source code library to `~/.emacs.d` directory.

 - Code formatting (M-x gofmt) 
 
 - Managing imports:
      - A function for jumping to the file's imports (go-goto-imports - C-c C-f i)
      - A function for adding imports, including tab completion (go-import-add, bound to C-c C-a)
      - A function for removing or commenting unused imports (go-remove-unused-imports)
  
 - Integration with godef:
      - godef-describe (C-c C-d) to describe expressions
      - godef-jump (C-c C-j) and godef-jump-other-window (C-x 4 C-c C-j) to jump to declarations
  
 - Jumping:
      - Jump to the argument list (go-goto-arguments - C-c C-f a)
      - Jump to the docstring, create it if it does not exist yet (go-goto-docstring - C-c C-f d).
      - Jump to the function keyword (go-goto-function - C-c C-f f)
      - Jump to the function name (go-goto-function-name - C-c C-f n)
      - Jump to the return values (go-goto-return-values - C-c C-f r)
      - Jump to the method receiver, adding a pair of parentheses if no method receiver exists (go-goto-method-receiver - C-c C-f m).
  - All of these functions accept a prefix argument (C-u), causing them to skip anonymous functions.
  
 - Goflymake syntax check
      - Open or Close flymake-mode (M-x flymake-mode)
      - Code syntax check (M-x flymake-start-syntax-check)
      - Stop code syntax check (M-x flymake-stop-syntax-check)
      - Jump to the next error point (C-c C-e n)
      - Jump to the previous error point (C-c C-e p)
  - Display the description of the current error point via popup mode (C-c C-e m)

  Happy hacking  :)

### TODO
 - [ ] To be add

### Reference

- [搭建emacs的go编程环境](http://www.cnblogs.com/lienhua34/p/5838166.html)
- [gocode+auto-complete搭建emacs的go语言自动补全功能](https://www.cnblogs.com/lienhua34/p/5839510.html)
- [Emacs:一些配置](https://blog.csdn.net/zajajn/article/details/80113163)
- [Emacs golang配置](https://studygolang.com/articles/6126)

### Contributions
 Please enjoy, read, critique(that is very much welcome) and contribute  :)
