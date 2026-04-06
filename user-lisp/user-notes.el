;; -*- lexical-binding: t -*-

;; Org files are a lot like markdown (.md) files
;; org has with slightly different syntax
;; But comes with much more powerful features
;; Org files have the extension (.org)
;; See: 'https://orgmode.org/'
(require 'org)
(require 'user-docket)
(require 'project)

;;; You can use templates for different types of capture items, and for different target locations. Say you would like to use one template to create general TODO entries, and you want to put these entries under the heading ‘Tasks’ in your file ‘~/org/gtd.org’. Also, a date tree in the file ‘journal.org’ should capture journal entries. A possible configuration would look like:

(setq org-log-done 'time)
(setq org-return-follow-links t)
(add-hook 'org-mode-hook 'org-indent-mode)

;; (setq org-capture-templates
;;   '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
;;       "* TODO %?\n  %i\n  %a")
;;      ("j" "Journal" entry (file+datetree "~/org/journal.org")
;;        "* %?\nEntered on %U\n  %i\n  %a")))

;; When you open up a markdown file, set the mode to
;; Treesitter Markdown Mode
;; 'treesitter' is a tool for language highlighting
;; TLDR: Add highlighting to markdown files
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-ts-mode))

;;(replace-regexp-in-string
;;  "[\t\r\f\n ]+" ""
;;  (buffer-substring-no-properties
;;    ))

(defvar user-notes--link-regex
  (rx (group "https://" (one-or-more (not (or "]" " " "\""))))))

(defun user-notes--read-url-at-point ()
  (let* ((whole-line (buffer-substring-no-properties (pos-bol) (pos-eol)))
	  (matched-p (string-match user-notes--link-regex whole-line)))
    (message "whole-line: \'%s\'" whole-line)
    (if matched-p (match-string 1 whole-line))))

(defun user-notes--open-url-at-point ()
  (interactive)
  (let ((url (user-notes--read-url-at-point)))
    (message "received url: %s" url)
    (if url
      (browse-url-firefox url)
      (newline))))

;;     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣄⡀⠀⠀⠀⠀⠀⠀ ⣿⣿⣷ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡛⢿⣦⣄⠀⠀ ⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿   ⡘⣝⣿⣶⣼⣿⣿⣿⣧⣀⣀⢀⣠⣴⣶⣿⣿⣿⣷⡄⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿ ⣧⡿⢟⡛⢍⢩⢡⣿⣿⣿⢉⠛⢿⣿⣯     ⣾⡇⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⡿⢡      ⠸⡹⠇    ⡹⢿⣷  ⣿⣿⠁⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣟⣉                ⡨⢙⢿⣿⣹⡟⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⣤⣿⢣                     ⢻⣿⡁⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⢠⣿⠃                       ⣿⣧⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠠⣾⡿⢈ ⣿⣿⣯⣔   ⣊⣦             ⠾⣿⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠠⣿⡧⢃ ⣿⣿⡿⢿  ⣲⢻⣿⣿⣿⢀ ⣘⣶⣿⣷⣔   ⡡⢛⣿⠇⠀⠀
;;     ⠀⠀⠀⠀⠀⠰⠹⣷  ⣿⣿⠃   ⣽⣿⣿⣿⠹  ⢼⣿⣿⣿⣻⠇  ⢡⢺⣿
;;     ⠀⠀⠀⠀⠀⠀⠀⢻⣷       ⢈⡝⠿⣙    ⢿⣿⣿⣯⡘ ⢡⣳⣿⢧⣤⣄⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⡀⢹⣷⣯⣄              ⠣⢴  ⣿⣿⡿⢩⣿⠇
;;     ⠀⠀⠀⠀⠀⠀⠀⣷⣿⣧⣾⢛⣿⢷⣦⣵⣰⣡⢍⣢⣎⣡⢎⣤⡓⣬⣱⣾⣿⡿⣿⣁⠀
;;     ⠀⠀⠀⠀⠀⠀⣸⡿⠄⠈⢿⠟⠁⠀⠨⢉⠙⣉⡿⢻⣿⠟⣻⡿⠟⠛⠉⠁⠀⠁⣿⣟⣋  ⠀
;;     ⠀⠀⠀⠀⠀⢰⣿⠉⣇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢻⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⢿⣿⠀⠀
;;     ⠀⠀⠀⠀⠀⢿⡇⠈⢻⡿⣧⣄⡀⠀⠀⠀⠀ ⠀⠀  ⠀⠀⣀⠀⠀⠀⠀⠀⠀⡹⣷⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⣻⣇⠀⣿⣟⡻⢿⠇⠀⢀⣤⣴⣀⣤⠀⠀⢀⣼⣷⡾⣷⡆⠀⠀⠀⠀⠰⣿⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠘⣿⡴⣿⣻⡗⠀⠀⠀⠀⢿⣿⣿⠇⠀⠀⠈⠛⠛⢿⣧⡀⠀⠀⠀⠂⣸⡿⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠹⣷⣄⠀⠀⠀⠀⠀⠀⠀⠙⠁⠀⠀⠀⠀⠀⠠⣿⣿⡿⠀⢀⡈⣵⣿⠃⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⣈⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⣀⣠⣶⠿⠁⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀   ⠈⠙⠛⠻⣟⢿⣶⣶⣤⣤⣴⣀⣂⣰⣀⣦⣴⣴⡾⣿⣟⠁⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀     ⠻⣿⣿⣾⣾⣬⣷⣽⣬⣷⣿⠷⠟⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀  ⠀  ⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀  ⠀  ⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀  ⠀  ⠀⠀⢰⣿⣿⣿⡯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀  ⠀  ⠀⠀⣼⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀  ⠀  ⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;     ⠀⠀⠀⠀⠀⠀⠀⠀  ⠀  ⠀ ⠛⣿⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

(defun user-notes-find-file ()
  (interactive)
  (setq default-directory docket-root-folder)
  (project-find-file))

(defun user-notes-grep ()
  (interactive)
  (setq default-directory docket-root-folder)
  (project-find-regexp (project--read-regexp)))

(global-set-key (kbd "C-c <return>") 'user-notes--open-url-at-point)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-lint)
(global-set-key (kbd "C-c f") 'user-notes-find-file)
(global-set-key (kbd "C-c r") 'user-notes-grep)
(global-set-key (kbd "C-c t") 'org-todo-list)

(provide 'user-notes)
