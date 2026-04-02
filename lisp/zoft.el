;; -*- lexical-binding: t -*-

;; Not sure if ripgrep is AI free
;; But the default grep that comes with macos sucks
;; + the default grep that linux usually is bundled
;; with is also not great

;; Set this from 'nil' to 't' if you want to use ripgrep for grepping
(setq using-ripgrep nil)
(when using-ripgrep
  ;; Set grep to 'rg' which is like grep, but much faster
  ;; if you are getting errors about 'rg' not existing, its because of this
  (setq grep-command "rg -nS --no-heading ")

  ;; Tell 'xref' (the emacs system for code searching) to use rg
  (setq xref-search-program 'ripgrep))
