;; -*- lexical-binding: t -*-

(require 'grep)
(require 'xref)

(defcustom using-ripgrep nil
  "Whether the user is using ripgrep"
  :type 'boolean
  :group 'user-grep)
(when using-ripgrep
  ;; Set grep to 'rg' which is like grep, but much faster
  ;; if you are getting errors about 'rg' not existing, its because of this
  (setq grep-command "rg -nS --no-heading ")

  ;; Tell 'xref' (the emacs system for code searching) to use rg
  (setq xref-search-program 'ripgrep))

