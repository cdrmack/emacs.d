;; -*- lexical-binding: t; -*-

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package multiple-cursors
  :ensure t
  :bind (("M-P" . mc/mark-previous-like-this)
         ("M-N" . mc/mark-next-like-this)))

(use-package avy
  :ensure t
  :bind (("C-;" . avy-goto-char)))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package clang-format
  :ensure t
  :custom (clang-format-style "file")
  :hook ((c-ts-mode-hook . clang-format-on-save-mode)
         (c++-ts-mode-hook . clang-format-on-save-mode)))

 ;; to be replaced with flymake
(use-package flycheck
  :ensure t)
