;; -*- lexical-binding: t -*-

;; This is related to the M-x clang-format command
;; tells emacs to update file buffers when they change on disk
(global-auto-revert-mode t)

;;;; vim.api.nvim_create_autocmd({'BufNew', 'BufRead'}, {pattern = '*.celes', command = 'set filetype=rust'})
;;;; vim.api.nvim_create_autocmd({'BufNew', 'BufRead'}, {pattern = '*.sgs', command = 'set filetype=rst'})
;;;; vim.api.nvim_create_autocmd({'BufNew', 'BufRead'}, {pattern = '*.effect', command = 'set filetype=c'})
;;;; vim.api.nvim_create_autocmd({'BufNew', 'BufRead'}, {pattern = '*.ixx', command = 'set filetype=cpp'})
;; The c-ts-mode and c++-ts-mode have non 'ts' (tree sitter) options as well
(add-to-list 'auto-mode-alist '("\\.celes\\'" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("\\.sgs\\'" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.effect\\'" . c-ts-mode))
(add-to-list 'auto-mode-alist '("\\.effect\\'" . c++-ts-mode))
