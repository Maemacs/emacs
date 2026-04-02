;; -*- lexical-binding: t -*-
;; Dont worry about this

;; Emacs Compile flags –-with-cairo --tree-sitter
;; Load this file on starting emacs!
(if load-file-name (find-file (expand-file-name load-file-name)))

;;  _  __     _ _ _       _              _       
;; | |/ /__ _| | (_)___  (_)___  __ _  _| |_ ___ 
;; | ' </ _` | | | / -_) | (_-< / _| || |  _/ -_)
;; |_|\_\__,_|_|_|_\___| |_/__/ \__|\_,_|\__\___|


;;                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀
;;                    ⠀⠀⠀⠀⢀⡴⣆⠀⠀⠀⠀⠀⣠⡀ ᶻ 𝗓   .ᐟ ⣼⣿⡗⠀⠀⠀⠀
;;                    ⠀⠀⠀⣠⠟⠀⠘⠷⠶⠶⠶⠾⠉⢳⡄⠀⠀⠀⠀⠀⣧⣿⠀⠀⠀⠀⠀
;;                    ⠀⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣤⣤⣤⣤⣤⣿⢿⣄⠀⠀⠀⠀
;;                    ⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠙⣷⡴⠶⣦
;;                    ⠀⠀⢱⡀⠀⠉⠉⠀⠀⠀⠀⠛⠃⠀⢠⡟⠀⠀⠀⢀⣀⣠⣤⠿⠞⠛⠋
;;                    ⣠⠾⠋⠙⣶⣤⣤⣤⣤⣤⣀⣠⣤⣾⣿⠴⠶⠚⠋⠉⠁⠀⠀⠀⠀⠀⠀
;;                    ⠛⠒⠛⠉⠉⠀⠀⠀⣴⠟⢃⡴⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;                    ⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

;;  _  _     _               _      ___       __     
;; | \| |___| |_ ___ ___   _| |_   |_ _|_ _  / _|___ 
;; | .` / _ \  _/ -_|_-<  |_   _|   | || ' \|  _/ _ \
;; |_|\_\___/\__\___/__/    |_|    |___|_||_|_| \___/


;; 1)
;; When you see 'C' and 'M' they stand for 'Ctrl' and 'Alt' respectively
;; It is 'HIGHLY' recommended that you rebind 'caps-lock' to 'Ctrl' for ease of use

;; 2)
;; Dont know what something does? Put your cursor over it and press: 'C-h S'
;; Alternatively, you can type: 'C-h d' for searching documentation yourself

;; 3)
;; You might be wondering whats up with ';' as comments, and why these have two of them!
;; refer to https://lisp-lang.org/style-guide/#comment-hierarchy for details
;; But its just a silly convention
;;
;; *IN TERMS OF THIS FILE* I have prefixed the vim config stuff with ';;;;'
;; so simply doing a search for ;;;; should give you a quick jump to reference vim vs emacs configurations

;; 4)
;; 'use-package' is built into emacs however, when you search online for packages
;; You'll often find that they arent available for 'use-pacakge' or 'M-x package-install'
;; This is because this entire config is using the default/official 'elpa' (GNU elpa) repository
;; There is another unofficial repository that has many more packages called 'melpa'
;; To add support for melpa instead, uncomment the below lines, ensuring they are before any other use-package call
;;   (use-package package :ensure t :config
;;     (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;     (package-initialize))


;;   ___              __  _       
;;  / __| ___  _ _   / _|(_) __ _ 
;; | (__ / _ \| ' \ |  _|| |/ _` |
;;  \___|\___/|_||_||_|  |_|\__, |
;;                          |___/

;; NOTE NOTE NOTE
;;
;; This config is not really a great example of how to write an emacs config. But it is written in a more neovim friendly manner.
;; Use :e lisp/<file name> for the files
;;
;; NOTE NOTE NOTE

;; use-package is a macro with some helpers for loading packages
;; In this case, we ask it to grab the gruvbox, magit, and evil packages (if they dont exist locally already)
;; And then load project, ido, and cl
(use-package gruvbox-theme :ensure t) ; see lisp/theme.el
(use-package magit :ensure t) ; see lisp/git.el
(use-package evil :ensure t) ; see lisp/vim.el
(use-package project) ; 'project' level utilities. For example, 'C-x p f' for finding a file. I recommend typing: `M-x project-` and taking a look at all the commands that show up
(use-package ido) ; 'Interactive do' evil mode doesnt make use of this all the time, but its still very useful. This displays multiple options in the minibuffer (the menu at the bottom that pops up sometimes)
(use-package cl) ; 'cl' is short for 'common lisp' and its really just used for the below 'loop' macro 

;; Load our configuration files
(loop for file in (directory-files "~/.config/emacs/lisp" t ".el")
  do (load file))

;; NOTE These init files are not really 'ideal' and there are cleaner ways of configuring things.
;; This all is written in a way to provide the least issues for you
