;; -*- lexical-binding: t -*-

;; Show the max amount of colors that treesitter allows
(setq treesit-font-lock-level 4)

;; This is the closest theme to 'melange' that I could find for emacs sadly.
;; BUT! You can configure the theme to 'behave' like 'melange' in terms of highlighting
;; by configuring what colors are used for functions, keywords, etc
;; I (zoftie) would be happy to send you a video showing an example how to do this
;;   (its much simpler than it seems)

;;;; vim.cmd('colorscheme melange')
(load-theme 'gruvbox-dark-hard t)
