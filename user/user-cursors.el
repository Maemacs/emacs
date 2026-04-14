;; -*- lexical-binding: t -*-

;; Multiple cursors _SHOULD_ be apart of emacs
(require 'multiple-cursors)

;; Use Ctrl-Alt-c to add a cursor to the next line or next matching selection
(global-set-key (kbd "C-M-c") 'mc/mark-next-like-this)

