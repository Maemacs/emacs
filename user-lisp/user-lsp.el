;; -*- lexical-binding: t -*-

(require 'eglot)

;; LSP is short for 'language server protocol'
;; If you have used other text editors, its the thing
;; that provides the suggestions while typing

;; The built in emacs package for handling Language Servers
;; Is called 'eglot'.
;;
;;
;; Common Keybindings (that one would expect to be related to their lsp)
;;
;; show code actions:       M-n   (eglot-code-actions)
;; show completion options: C-M i (completion-at-point)
;; goto definition:         M-.   (xref-find-definitions)
;; rename:                        (eglot-rename)

;; ⠀⠀⠀⠀⢠⡔⠒⠀⠒⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⢠⠋⠀⠀⠀⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⢀⣦⣆⠀⢰⠦⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⢠⠞⠉⠙⠈⡆⠀⠀⠀⠀⢼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⠈⠒⠒⠒⠒⠧⡀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠈⠑⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⠀⡰⠁⠀⠀⠀⢀⠀⠀⠀⠈⠑⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⢠⠃⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠄⣉⠲⢄⡀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⠀⠀⠀⠀⠑⠦⣈⠑⠦⣀⠀⠀⠀
;; ⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠳⣄⠀⠀⠀⠀⠀⠀⠀⠈⠑⣆⡀⠉⠑⡆
;; ⠀⠀⠀⠀⠈⢦⡀⠀⠀⠀⠀⠀⠀⠀⠑⠂⠤⠀⠠⠤⠤⠄⠊⣁⡀⠤⠚⠁
;; ⠀⠀⢀⡼⡄⠀⠉⣢⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠴⠒⠉⠁⠀⠀⠀⠀
;; ⠀⠀⠈⠻⡧⠒⠉⠈⠀⡅⡏⠈⢃⡾⠞⠁⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⣼⡠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

;; Remap javascript files to use the typescript with treesitter support
;;   'treesitter' gives you nicer looking highlighting
;;   'typescript' is just a better 'javascript'
;;     and will support regular javascript files just fine
;;
;; Also When we open a typescript file, also run the typescript-language-server (LSP)
;;   npm i -g typescript typescript-language-server
(add-to-list 'major-mode-remap-alist '(js-mode . typescript-ts-mode))
(add-hook 'typescript-ts-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'c-ts-mode)
(add-hook 'c-ts-mode 'bind-clang-format)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))

;; Tell emacs to avoid displaying 'inlay hints'
;;   Inlay hints turn stuff like this:
;;     let foo = 3;
;;   Into this:
;;     let foo :int = 3
(setq eglot-ignored-server-capabilities '(:inlayHintProvider))

(global-set-key (kbd "M-n") 'eglot-code-actions)

(provide 'user-lsp)
