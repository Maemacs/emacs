;; -*- lexical-binding: t -*-

;; Magit is the best git interface ever
(defun project-magit-status ()
  (interactive)
  (let ((default-directory (project-root (project-current))))
    (magit-status)))

;; These are the commands that show
;; when you type: C-x p p <project-name>
(setq project-switch-commands
  '((project-find-file "Find file")
     (project-find-regexp "Find regexp")
     (project-find-dir "Find directory")
     (project-magit-status "Magit" "m")
     (project-eshell "Eshell")
     (project-compile "Compile")))
