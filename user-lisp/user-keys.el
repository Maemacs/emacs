;; -*- lexical-binding: t -*-

(require 'user-display)

(defun increase-font-size ()
  "Increases font size"
  (interactive)
  (text-scale-adjust 1))

(defun decrease-font-size ()
  "Decreases font size"
  (interactive)
  (text-scale-adjust -1))

(defun use-stream-font-size ()
  "Set the font to use the stream font size"
  (user-display-set-font user-display-font user-display-stream-font-size))

(defun use-normal-font-size ()
  "Set the font to the normal font size"
  (user-display-set-font user-display-font user-display-font-size))

(global-set-key (kbd "M-v") (lambda () (interactive) (forward-line -6)))
(global-set-key (kbd "C-v") (lambda () (interactive) (forward-line 6)))

(global-set-key (kbd "C-h h") 'help-quick-toggle)

(global-set-key (kbd "C-=") 'increase-font-size)
(global-set-key (kbd "C--") 'decrease-font-size)
(global-set-key (kbd "C-0") 'use-stream-font-size)
(global-set-key (kbd "C-9") 'use-normal-font-size)

(provide 'user-keys)
