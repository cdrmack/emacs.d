;; -*- lexical-binding: t; -*-

(require 'package)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

(package-initialize)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

(setq gc-cons-threshold (* 100 1024 1024)
  read-process-output-max (* 1024 1024))

;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'whitespace-cleanup)

(global-auto-revert-mode t)
(delete-selection-mode t)

(which-key-mode t)
(setq which-key-idle-delay 1.0)

;; completion
(global-completion-preview-mode t)

;; don't use tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(add-hook 'makefile-mode-hook
          (lambda () (setq indent-tabs-mode t)))

;; minibuffer
(fido-mode t)
(fido-vertical-mode t)

;; look
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)

(setq visible-bell nil)

(column-number-mode t)

;;(setopt display-line-numbers-width 3)

(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode t)
            (electric-pair-mode t)))

(add-hook 'text-mode-hook 'visual-line-mode)

(load-theme 'wombat)

(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :family "Fira Code Nerd Font Mono"
                      :height 120))

;; tree sitter
(when (treesit-available-p)
  (setq major-mode-remap-alist
        '((bash-mode . bash-ts-mode)
          (c-mode . c-ts-mode)
          (c++-mode . c++-ts-mode)
          (json-mode . json-ts-mode))))

;; json
(add-hook 'json-ts-mode-hook
          (lambda ()
            (flymake-mode t)
            (add-hook 'before-save-hook 'json-pretty-print-buffer)))

;; external packages
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
