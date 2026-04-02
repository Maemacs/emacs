;; -*- lexical-binding: t -*-

(require 'evil)
(require 'gruvbox-theme)
(require 'files)

(defcustom use-evil-mode 1
  "Whether to use evil mode or not"
  :type 'number
  :group 'user-kallie)
(evil-mode use-evil-mode)
                                                                     
;;            ,--.   ,--. ,--.      ,---.                                  
;; ,--.,--. ,-'  '-. `--' |  |     /  .-' ,--.,--. ,--,--,   ,---.  ,---.  
;; |  ||  | '-.  .-' ,--. |  |     |  `-, |  ||  | |      \ | .--' (  .-'  
;; '  ''  '   |  |   |  | |  |     |  .-' '  ''  ' |  ||  | \ `--. .-'  `) 
;;  `----'    `--'   `--' `--'     `--'    `----'  `--''--'  `---' `----'  
                                                                        

(defun project-format ()
  "Run command through 'project-compile'"
  (interactive)
  (save-buffer)
  (project-compile))

(defun clang-format ()
  "Run clang format project wide"
  (interactive)
  (let ((compile-command "clang-format -style=file"))
    (project-format)))

(defun rust-format ()
  "run rust analyzer formatting project wide"
  (interactive)
  (let ((compile-command (format "rust-analyzer format %s" (expand-file-name (buffer-name)))))
    (project-format)))

(defun bind-clang-format ()
  "Binds the C-k keybinding to clang format"
  (evil-define-key 'normal 'local (kbd "C-k") 'clang-format))

(defun bind-rust-format ()
  "Binds the C-k keybinding to rust analyzer"
  (evil-define-key 'normal 'local (kbd "C-K") 'rust-format))

(defun to-normal-and-back-to-indentation ()
  "Return to normal vi `mode` and move cursor back to start of indentation"
  (interactive)
  (evil-normal-state)
  (back-to-indentation))

(defun use-wrapping-lines ()
  "Use new lines after the `fill-column`"
  (setq fill-column 79)
  (visual-line-mode t))

                                                                                                                
;; ,--.                                                                 ,--.                      ,--.             
;; |  |  ,--,--. ,--,--,   ,---.  ,--.,--.  ,--,--.  ,---.   ,---.      |  ,---.   ,---.   ,---.  |  |,-.   ,---.  
;; |  | ' ,-.  | |      \ | .-. | |  ||  | ' ,-.  | | .-. | | .-. :     |  .-.  | | .-. | | .-. | |     /  (  .-'  
;; |  | \ '-'  | |  ||  | ' '-' ' '  ''  ' \ '-'  | ' '-' ' \   --.     |  | |  | ' '-' ' ' '-' ' |  \  \  .-'  `) 
;; `--'  `--`--' `--''--' .`-  /   `----'   `--`--' .`-  /   `----'     `--' `--'  `---'   `---'  `--'`--' `----'  
;;                        `---'                     `---'                                                          

;;;; vim.keymap.set({'n', 'i'}, '<C-K>', ...) ....
;;;; vim.api.nvim_create_autocmd('FileType', {pattern = 'rust' ...
(add-hook 'c-ts-mode 'bind-clang-format)
(add-hook 'c++-ts-mode 'bind-clang-format)
(add-hook 'rust-ts-mode 'bind-rust-format)
;;; Commented out, Not sure if this behavior is actually what is wanted
;; (add-hook 'rust-ts-mode 'use-wrapping-lines)
;; (add-hook 'text-mode 'use-wrapping-lines)

                                                            
;; ,--.    ,--.             ,--. ,--.                          
;; |  |-.  `--' ,--,--,   ,-|  | `--' ,--,--,   ,---.   ,---.  
;; | .-. ' ,--. |      \ ' .-. | ,--. |      \ | .-. | (  .-'  
;; | `-' | |  | |  ||  | \ `-' | |  | |  ||  | ' '-' ' .-'  `) 
;;  `---'  `--' `--''--'  `---'  `--' `--''--' .`-  /  `----'  
;;                                             `---'           

(evil-define-key 'normal 'global (kbd "<Home>") 'back-to-indentation)
(evil-define-key 'insert 'global (kbd "<Home>") 'to-normal-and-back-to-indentation)

;;; Just press 'y' - evil yanks to the clipboard in emacs
;; (evil-define-key 'visual 'global (kbd "C-<Insert>") 'kill-ring-save)
;; (evil-define-key 'visual 'global (kbd "C-C") 'kill-ring-save)

;;; Technically, yank appends, but the normal 'p' and 'P' commands will work as expected
;; (evil-define-key 'visual 'global (kbd "S-<Insert>") 'yank)
;; (evil-define-key 'visual 'global (kbd "C-z") 'yank)

;;; Like the others 'x' will work as wanted
;; (evil-define-key 'visual 'global (kbd "S-<Delete>") 'kill-region)
;; (evil-define-key 'visual 'global (kbd "C-x") 'kill-region)

;; If you want to add these for 'i' mode, instead of 'visual put 'insert

;; 'note' 'note' 'note' 'note'
;; If you are looking for Ctrl-c Ctrl-p etc like functionality
;; Emacs seems to support that already in my macos emacs version
;; And I remember it working in emacs
;; 'note' 'note' 'note' 'note'

;;;; vim.keymap.set({'i', 'c'}, '<S-Ins>', '<C-R>+')
;;;; vim.keymap.set({'i', 'c'}, '<C-Z>', '<C-R>+')
;; Okay so this is interesting, I didnt know about the expression register
;; In emacs, *IN ANY AND ALL BUFFERS* you can just insert lisp and evaluate it
;; so even in a c file, lisp comments, you can do: (+ 123 455)
;; and just evaluate it with C-x e or in evil-mode with :eval-last-sexp
;; if this is needed, You can certainly create your own (setq expression-register nil)
;; and a define a function that handles the saved expression(s)

(provide 'user-kallie)
