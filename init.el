;; find and load Emacs Lisp source code blocks in the `config.org` file
(org-babel-load-file
 (expand-file-name "config.org" user-emacs-directory))
