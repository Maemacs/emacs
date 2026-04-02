;; -*- lexical-binding: t -*-

(require 'which-key)

;; Keep scratch buffers empty
(setq initial-scratch-message
  "Hello! Welcome to the emacs scratch buffer!
Type 'Ctrl h h' For a quick help popup")

;; Indent lisp code in the common lisp format
;; Anyone reading this confused, really
;; doesnt need to be concerned about this
(setq lisp-indent-function 'common-lisp-indent-function)

;; Lisp code should indent in sets of 2, instead of the default 8
(setq lisp-indent-offset 2)

;; Typing a command? Emacs will also tell you the keybinding alongside the function
(which-key-mode)

(defcustom using-elisp-italics nil
  "Whether to use emacs lisp italic font (v31)"
  :type 'boolean
  :group 'user-emacs-specifics)
(when (>= 31 emacs-major-version)
  ;; This tells emacs to show emacs lisp in more colors than bland
  (setq elisp-fontify-semantically t)
  (when elisp-fontify-semantically
    ;; Tell emacs to never underline variables
    (set-face-underline 'elisp-free-variable nil)
    (set-face-italic 'elisp-free-variable using-elisp-italics)
    (set-face-italic 'elisp-bound-variable using-elisp-italics)
    (set-face-italic 'elisp-binding-variable using-elisp-italics)))

(provide 'user-emacs-specifics)
