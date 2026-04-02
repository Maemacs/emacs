;; -*- lexical-binding: t -*-

;;;; if vim.g.neovide then
;;;; 	vim.g.neovide_cursor_vfx_mode = "" -- "sonicboom"
;;;; 	vim.g.neovide_normal_opacity = 0.7
;;;; end
;; Set the background opacity - You may need to restart emacs with: M-x restart-emacs for it to be applied
;;   This _should_ just work on linux+wayland
(let ((-alpha 70))
  (set-frame-parameter nil 'alpha-background -alpha)
  (add-to-list 'default-frame-alist (cons 'alpha-background -alpha)))

;; Set the font if it exists
;; If this is not working, run:
;; (kill-new (completing-read "Please select a font from" (x-list-fonts "*")))
;;                                                     put cursor here -------^
;;                                                     and do: C-x C-e
;; This will save query all the possible options for you
;; and save the selected result to your clipboard
(if (x-list-fonts "PxPlus IBM VGA8")
  (set-frame-font "PxPlus IBM VGA8-22"))

;;;; vim.opt.wrap          = false
;; Word wrapping is disabled by default in emacs

;;;; vim.opt.rnu           = true
;;;; vim.opt.number        = true
(setq column-number-mode t)
(global-display-line-numbers-mode t)

;;;; vim.env.lines         = 34
;;;; vim.env.columns       = 86
;; see: 'C-s window-size'

;;;; vim.env.numberwidth   = 6
;; Not running this code, but you can uncomment the below
;; Emacs grows the line column automatically as needed
;; (setq display-line-numbers-width 6)

;;;; vim.env.bs            = 2
;; My neovim doesnt list numbers for this, but if its an issue it should be fixable in emacs

;;;; vim.opt.ruler         = true
;;;; vim.opt.showcmd       = true
;;;; vim.opt.showmode      = true
;; Built in to evil mode and emacs

;; Remove the 'menu-bar' which is basically a bunch of
;; ugly icons at the top of the screen
(menu-bar-mode 0)

;; Remove the 'tool-bar' which is a lot like the menu bar
;; But holds slightly different content
(tool-bar-mode 0)

;; ADDITIONS BY ZOFTIE

;; Show spaces left at the end of the line, like so:
;; adasd 
(setq global-whitespace-mode t)

;; Dont use tabs for indent, use spaces
(setq indent-tabs-mode nil)
;; Default to making the tab button insert two spaces
(setq tab-width 2)

;; Display 'white-space' (spaces, tabs, etc) - this
;;   controls what gets displayed for 'global-whitespace-mode'
(setq whitespace-style '(face trailing tabs tab-mark))

(setq using-small-screen nil)
(when using-small-screen
  ;; These two variables tell emacs not to 'split'
  ;; the window so much
  (setq split-height-threshold nil)
  (setq split-width-threshold nil))

;; On load, setup the window to be centered ::window-size
(let* ((-screen-sizes (frame-monitor-geometry))
	(-screen-width (caddr -screen-sizes))
	(-screen-height (cadddr -screen-sizes))
	(-padding 50)
	(-width (- -screen-width (* 3 -padding)))
	(-height (- -screen-height (* 3 -padding)))
	(-frame (frame-root-frame)))
  (set-frame-size-and-position-pixelwise
    -frame
    -width
    -height
    -padding
    -padding))
