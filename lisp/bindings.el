;; -*- lexical-binding: t -*-

;; Typing a command? Emacs will also tell you the keybinding alongside the function
(which-key-mode)

;; C-h h will show a small help popup, instead of how to saay hello in a bunch of languages
(global-set-key (kbd "C-h h") 'help-quick-toggle)

;; Set 'C-x C-f' to multi directory file search
(global-set-key (kbd "C-x f") 'ido-find-file)

;; Set 'C-x C-f' to multi directory file search
(global-set-key (kbd "C-x C-f") 'project-find-file)

;; Set 'C-x C-r' to project wide text search
(global-set-key (kbd "C-x C-r") 'project-find-regexp)
