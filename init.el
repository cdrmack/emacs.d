;; -*- lexical-binding: t; -*-

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))

(setopt inhibit-startup-message t)
(setopt initial-scratch-message "")

(setopt make-backup-files nil)
(setopt create-lockfiles nil)

(setopt gc-cons-threshold (* 100 1024 1024)
  read-process-output-max (* 1024 1024))

;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'whitespace-cleanup)

(global-auto-revert-mode t)
(delete-selection-mode t)

(which-key-mode t)
(setopt which-key-idle-delay 1.0)

;; don't use tabs
(setq-default indent-tabs-mode nil
              tab-width 4)

(add-hook 'makefile-mode-hook
          (lambda () (setq indent-tabs-mode t)))

;; completion
;;(global-completion-preview-mode t)

(setopt completion-auto-help 'always)
(setopt completion-auto-select 'second-tab)
(setopt completions-max-height 20)
(setopt completions-format 'one-column)

(setopt tab-always-indent 'complete)

;;(setopt completion-cycle-threshold 1)                  ; TAB cycles candidates
;;(setopt completions-detailed t)                        ; Show annotations
;;(setopt completions-group t)

;; minibuffer
(fido-mode t)
(fido-vertical-mode t)

;; look
(menu-bar-mode -1)
(tooltip-mode -1)

(setopt visible-bell nil)

(column-number-mode t)

;;(setopt display-line-numbers-width 3)

(add-hook 'text-mode-hook 'visual-line-mode)

(load-theme 'wombat)

(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-face-attribute 'default nil
                      :family "Fira Code Nerd Font Mono"
                      :height 120))

;; code
(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode t)
            (electric-pair-mode t)))

;; tree sitter
(when (treesit-available-p)
  (setq treesit-language-source-alist
        '((bash "https://github.com/tree-sitter/tree-sitter-bash")
          (c "https://github.com/tree-sitter/tree-sitter-c")
          (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (python "https://github.com/tree-sitter/tree-sitter-python")
          (rust "https://github.com/tree-sitter/tree-sitter-rust")))
   (setopt major-mode-remap-alist
        '((bash-mode . bash-ts-mode)
          (c-mode . c-ts-mode)
          (c++-mode . c++-ts-mode)
          (json-mode . json-ts-mode)
          (python-mode . python-ts-mode)
          (rust-mode . rust-ts-mode))))

;; json
(add-hook 'json-ts-mode-hook
          (lambda ()
            (flymake-mode t)
            (add-hook 'before-save-hook 'json-pretty-print-buffer)))

;; external packages
;; (load-file (expand-file-name "external.el" user-emacs-directory))
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
