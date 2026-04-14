;; -*- lexical-binding: t -*-

;; Tell Emacs to put file backups in this folder
(defcustom backup-directory "~/.custom/emacs/.saves"
  "The directory for emacs to put save files in"
  :type 'string
  :group 'user-file-backups)
(setq backup-directory-alist (list (list backup-directory)))

;; Tell Emacs not to create so many of those '#file-name' files
(setq create-lockfiles nil)

