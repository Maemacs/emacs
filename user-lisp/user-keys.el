;; -*- lexical-binding: t -*-

(global-set-key (kbd "M-v") (lambda () (interactive) (previous-line 6)))
(global-set-key (kbd "C-v") (lambda () (interactive) (forward-line 6)))

(global-set-key (kbd "C-h h") 'help-quick-toggle)

(provide 'user-keys)
