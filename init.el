;; -*- lexical-binding: t; -*-

(require 'package)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))

(package-initialize)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

(setq gc-cons-threshold (* 100 1024 1024)
  read-process-output-max (* 1024 1024))

;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq visible-bell nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'whitespace-cleanup)

;; (global-unset-key (kbd "C-z"))

(load-theme 'wombat)

(column-number-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;;(add-hook 'text-mode-hook 'visual-line-mode)

(delete-selection-mode t)

(display-time-mode t)

(global-completion-preview-mode 1)

;; minibuffer
;;(icomplete-mode 0)
(fido-mode 1)
(fido-vertical-mode 1)

;; external packages
(require 'magit)

(require 'multiple-cursors)

(global-set-key (kbd "C-c M-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c M-n") 'mc/mark-next-like-this)
