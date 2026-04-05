;; -*- lexical-binding: t -*-

(load-theme 'wombat)

(require 'whitespace)

(defcustom user-display-font "Maple Mono"
  "The font to use"
  :type 'string
  :group 'user-display)

(defcustom user-display-font-size 22
  "The font size in px"
  :type 'number
  :group 'user-display)

(defcustom user-display-stream-font-size 28
  "The font size used for streaming"
  :type 'number
  :group 'user-display)

(defun user-display-set-font (-font-name -font-size)
  "Sets the display font with given size"
  (interactive)
  (set-frame-font (format "%s-%d" -font-name -font-size)))

;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⡀⠀⠀
;;  ⠀⠀⢠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣾⠏⠘⠿⣦⣤
;;  ⠀⠀⣾⠉⠻⢶⠶⠛⢻⡇⠀⠀⠀⠘⢻⡦⠀⠀⢰⡾⠃
;;  ⢀⣤⠿⠀⠀⠀⠀⢠⡟⠁⠀⠀⠀⠀⠸⠷⠿⠿⣾⣷⠀
;;  ⢿⣥⣀⠀⠀⠀⠀⠀⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠈⠉⣿⣀⣾⠟⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠘⠛⠁⠀⠀⠀⠀⠀⢀⣾⢻⣆⡀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⠃⠀⠙⠛⣿⠇⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣶⡄⠀⠀⢸⣏⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⡷⠟⠛⠻⠿

;; Set the font to be 'Maple Mono' at 22px tall
;; You can get the full list of fonts by running:
;; C-x C-e on the expression below:
;;   (x-list-fonts "*") <-- Right here!
(if (x-list-fonts user-display-font)
  (user-display-set-font user-display-font user-display-font-size)
  (error "Font: `%s` not found in x-list-fonts" user-display-font))

;; Show the file column number on the left hand side!
(setq column-number-mode t)

;; Always do this! Not just for files
(global-display-line-numbers-mode t)

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

;; Remove the 'menu-bar' which is basically a bunch of
;; ugly icons at the top of the screen
(menu-bar-mode 0)

;; Remove the 'tool-bar' which is a lot like the menu bar
;; But holds slightly different content
(tool-bar-mode 0)

;; Display the scroll bar!
(set-scroll-bar-mode nil)

(defcustom using-small-screen nil
  "Whether the user is expecting to be using a small screen"
  :type 'boolean
  :group 'user-display)
(when using-small-screen
  ;; These two variables tell emacs not to 'split'
  ;; the window so much
  (setq split-height-threshold nil)
  (setq split-width-threshold nil))

;; On load, setup the window to be centered
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

(provide 'user-display)
