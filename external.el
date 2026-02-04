;; -*- lexical-binding: t; -*-

(use-package magit
  :ensure t
  :bind (("C-x g" . 'magit-status)))

(use-package multiple-cursors
  :ensure t
  :bind (("M-P" . 'mc/mark-previous-like-this)
         ("M-N" . 'mc/mark-next-like-this)))

(use-package avy
  :ensure t
  :bind (("C-;" . avy-goto-char)))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package clang-format
  :ensure t
  :config (setopt clang-format-style "file"))

(add-hook 'c-ts-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'clang-format-buffer)))

(add-hook 'c++-ts-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'clang-format-buffer)))

 ;; to be replaced with flymake
(use-package flycheck
  :ensure t)
