;; -*- lexical-binding: t -*-

;;   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⠀⠀⠀⠀⠀⣴⠒⡄⢫⠉⢹⠀⠀⣰⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡄⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⠀⠀⢰⡉⠳⡘⠦⠛⠘⠒⠃⠀⢰⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⠀⠀⠀⠈⠚⠁⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣤⣄⣀⡀⣠⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢸⠉⠉⢰⠂
;;   ⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⠟⠛⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⡇⠀⡰⠃⠀
;;   ⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⠃⠀⠀⢰⡆⢻⣿⣿⣿⣿⣿⡿⠛⠛⠻⣿⣿⣿⣿⠀⠀⠀⠀⢰⠁⡰⠁⠀⠀
;;   ⠀⠀⠀⠀⣶⣦⣤⠘⣿⣿⣆⠀⠀⢿⠇⣼⣿⣿⣿⣿⠛⢸⡇⠀⠀⠙⣿⣿⣿⣇⠀⠀⠀⠈⠒⠁⠀⠀⠀
;;   ⠀⠀⠀⠀⢀⣀⣁⠀⠻⣿⣿⣷⣦⣤⣶⣿⣿⣿⣿⣇⡀⣾⠃⠀⠀⢠⣿⣿⣿⡇⠀⡔⠒⠲⡄⠀⠀⠀⠀
;;   ⠀⠀⠀⠘⠛⠋⠉⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣴⣾⣿⣿⠟⠀⠀⠱⠤⣀⠇⠀⠀⠀⠀
;;   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⢐⣗⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⣷⣤⡶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⢗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;   ⣴⣿⣿⣷⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;   ⠀⠈⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

;; Quick $PATH setup for Macos users
(if (memq window-system '(mac ns))
  ;; Macos doesnt set the path for applications properly
  ;; This package fixes that
  (use-package exec-path-from-shell :ensure t :config
    (setq exec-path-from-shell-debug t)
    (exec-path-from-shell-initialize)))


;; User lisp packages
(use-package user-file-backups)
(use-package user-compilation :after (compile))
(use-package user-completion :after (ido))
(use-package user-confirmations)
(use-package user-cursors :after (multiple-cursors))
(use-package user-dired)
(use-package user-display :init (setq using-small-screen t))
(use-package user-emacs-specifics :init (setq using-elisp-italics t))
(use-package user-git :after (magit))
(use-package user-gpg :after (epa-file))
(use-package user-grep :init (setq using-ripgrep t))
(use-package user-keys)
(use-package user-lsp)
(use-package user-macos)
(use-package user-notes :after (org))
(use-package user-project :after (project))
(use-package user-tree-sitter)
(use-package user-web-mode :after (web-mode))
(use-package user-npm :after (transient magit project) :config
  (add-to-list 'project-switch-commands '(project-npm "npm" "n"))
  (global-set-key (kbd "C-x p n") 'project-npm))
(use-package user-startup :after (magit project) :config
  (defun project-magit-status ()
    (interactive)
    (let ((default-directory (project-root (project-current))))
      (magit-status)))

  ;; These are the commands that show
  (setq project-switch-commands
    '((project-find-file "Find file")
       (project-find-regexp "Find regexp")
       (project-find-dir "Find directory")
       (project-magit-status "Magit" "m")
       (project-eshell "Eshell")
       (project-compile "Compile"))))

;; Non user-lisp packages
(use-package magit :ensure t)
(use-package multiple-cursors :ensure t)
(use-package web-mode :ensure t)
(use-package ido)
(use-package epa-file)
(use-package org)
(use-package project)
(use-package compile)

;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣭⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⠤⢤⣀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠒⢋⣉⣀⣠⣄⣀⣈⡇
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣯⠴⠚⠉⠉⠀⠀⠀⠀⣤⠏⣿
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⡿⡇⠁⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⡿⠿⢛⠁⠁⣸⠀⠀⠀⠀⠀⣤⣾⠵⠚⠁
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⢦⡀⠀⣠⠀⡇⢧⢄⡀⢀⢠⡜⠃⠀⠀⠀⠀⠀⣠⣴⠿⠋⠁⠀⠀⠀⠀⠘⣿⠀⣀⡠⠞⠛⠁⠂⠁⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡋⣻⡦⣞⡿⣷⠸⣜⣡⢶⣻⠁⠀⠀⠀⣀⣴⠟⠋⠁⠀⠀⠀⠀⣐⡤⡤⣾⣙⣶⡶⠃⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣂⡷⠰⣟⣿⣖⣾⡷⢿⣓⣀⣀⣤⢾⣋⠁⠀⠀⠀⣀⢀⣀⣠⣞⣉⠁⢀⢿⠑⠃⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠤⡤⠴⠴⠤⠦⠤⠤⠤⠤⠤⠴⠶⢾⣽⣙⠒⢺⣿⣿⣿⣿⢾⠶⣧⡼⢏⠑⠚⠋⠉⠉⡉⡉⠉⠉⠹⠈⠁⠉⠀⠨⢾⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠀⠂⠐⠀⠀⢀⡭⣇⡿⢯⢻⣟⣇⣷⣞⡛⠁⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣆⠚⠚⠁⠀⢠⡷⡛⣛⣼⣿⠟⠙⣧⠅⡄⠀⠀⠀⠀⠀⠀⠰⡇⠀⠀⠀⠀⢠⣾⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⢶⠏⠉⠀⠀⠀⠀⠀⠿⢠⣴⡟⡗⡾⡒⠖⠉⠏⠁⠀⠀⢀⣀⣀⢀⣠⣧⣀⣀⣀⣀⠀⠚⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⣠⢴⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⣠⣷⢿⠋⠁⣷⡏⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⣿⢭⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⢀⡴⢏⡵⠛⠀⠀⠀⠀⠀⠀⠀⣀⣴⠞⠛⠀⠀⠀⠀⢿⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⢿⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⣀⣼⠛⣲⡏⠁⠀⠀⠀⠀⠀⢀⣠⡾⠋⠉⠀⠀⠀⠀⠀⠀⢾⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡨⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⡴⠟⠀⢰⡯⠄⠀⠀⠀⠀⣠⢴⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⡾⠁⠁⠀⠘⠧⠤⢤⣤⠶⠏⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠘⣇⠂⢀⣀⣀⠤⠞⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;  

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(exec-path-from-shell magit multiple-cursors web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
