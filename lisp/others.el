;; -*- lexical-binding: t -*-

;;;; vim.env.ls            = 2
;; Can't seem to figure out exactly what this does

;;;; vim.env.fileformats   = 'unix,dos'
;;;; vim.env.fileformat    = 'unix'
;;;; vim.env.background    = 'dark'
;; Emacs uses unix file formats by default
;; MS DOS can be supported, but should run 'C-h d' if help is needed

;;;; vim.opt.hlsearch      = false
;; Emacs does not auto fill the previous search unless you press the C-s or C-r commands twice
;; so the default behavior should work

;;;; vim.keymap.set({'', 'i'}, '<F11>'
;; Built into emacs

;;;; vim.keymap.set({'', 'i'}, '<C-+>', function()
;; On macos this is <S-+> but most ther os's default the binding to C-+ so all is good

;;;;  vim.keymap.set({'', 'i'}, '<c-0>', function()
;;;;		  cur_font_size = 48
;;;;		  update_font()
;;;;		  end)
;;;;
;;;;  vim.keymap.set({'', 'i'}, '<c-9>', function()
;;;;		  cur_font_size = 30
;;;;		  cur_font_size = math.floor(cur_font_size + 0.5)
;;;;		  update_font()
;;;;		  end)
;; Not sure if you actually use these often, but the lisp for this is
;; (set-face-attribute 'default nil :height 100)
;; Where 100 = 10px, 180 = 18px, etc

;;;; vim.keymap.set('', '<C-Ins>', '"+y')
;;;; vim.keymap.set('', '<C-C>', '"+y')
;;;; vim.keymap.set('', '<S-Ins>', '"+P')
;;;; vim.keymap.set('', '<C-Z>', '"+P')
;;;; vim.keymap.set('', '<S-Del>', '"+x')
;;;; vim.keymap.set('', '<C-X>', '"+x')
;;;; vim.keymap.set('i', '<C-Ins>', '<Esc>"+yi')
;;;; vim.keymap.set('i', '<C-C>', '<Esc>"+yi')
;;;; vim.keymap.set({'i', 'c'}, '<S-Ins>', '<C-R>+')
;;;; vim.keymap.set({'i', 'c'}, '<C-Z>', '<C-R>+')
;;;; vim.keymap.set('i', '<S-Del>', '<Esc>"+xi')
;;;; vim.keymap.set('i', '<C-X>', '<Esc>"+xi')
