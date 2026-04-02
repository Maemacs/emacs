;; -*- lexical-binding: t -*-

;; Evil mode is the emulation layer for vim in emacs
;;
;; - NOTE: As someone who used vim / neovim for years, I genuinely think that the emacs keybindings are better
;;         But a lot of emacs users still swear by evil, so here ya go!
;;         If there is ever interest in an actual emacs config, check out

(evil-mode 1)

(defun project-format ()
  "Run command through 'project-compile'"
  (interactive)
  (save-buffers)
  (project-compile))

(defun clang-format ()
  "Run clang format project wide"
  (interactive)
  (let ((compile-command "clang-format -style=file"))
    (project-format)))

(defun rust-format ()
  "run <> project wide"
  (interactive)
  (let ((compile-command (format "rust-analyzer format %s" (expand (buffer-name)))))
    (project-format)))

(defun bind-clang-format ()
  "Binds the C-k keybinding to clang format"
  (evil-define-key 'normal 'local (kbd "C-k") 'clang-format))

(defun bind-rust-format ()
  "Binds the C-k keybinding to <?>"
  (evil-define-key 'normal 'local (kbd "C-K") 'rust-format))

(defun to-normal-and-back-to-indentation ()
  "Return to normal vi 'mode' and move cursor back to start of indentation"
  (interactive)
  (evil-normal-state)
  (back-to-indentation))

(defun use-wrapping-lines ()
  "Use new lines after the 'fill-column'"
  (setq fill-column 79)
  (visual-line-mode t))

;;;; vim.keymap.set('n', '<Home>', '^')
;;;; vim.keymap.set('i', '<Home>', '<Esc>^i')
(evil-define-key 'normal 'global (kbd "<Home>") 'back-to-indentation)
(evil-define-key 'insert 'global (kbd "<Home>") 'to-normal-and-back-to-indentation)

;;;; vim.keymap.set({'n', 'i'}, '<C-K>', ...) ....
;;;; vim.api.nvim_create_autocmd('FileType', {pattern = 'rust' ...
(add-hook 'c-ts-mode 'bind-clang-format)
(add-hook 'c++-ts-mode 'bind-clang-format)
(add-hook 'rust-ts-mode 'bind-rust-format)
;; Commented out, Not sure if this behavior is actually what is wanted
;; (add-hook 'rust-ts-mode 'use-wrapping-lines)
;; (add-hook 'text-mode 'use-wrapping-lines)
