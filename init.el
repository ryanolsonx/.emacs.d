(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(prefer-coding-system 'utf-8)
(package-initialize)

(set-default-font "Fantasque Sans Mono 16")
(load-theme 'gruvbox-dark-soft t)

(setq is-mac (eq window-system 'ns)
      elisp-dir "~/.emacs.d/elisp/")

(defun load-module (name)
  (load (concat elisp-dir name)))

;; Packages
;; --

;; Install:
;; - company
;; - magit
;; - rjsx-mode
;; - tide
;; - mac osx: exec-path-from-shell
;; - add-node-modules-path (to allow using node_modules for things like prettier)
;; - prettier-js
;; - yasnippet

(when is-mac
  (load-module "mac.el"))

(load-module "defaults.el")
(load-module "ido.el")
(load-module "company.el")
(load-module "javascript.el")
(load-module "prettier.el")

(global-set-key (kbd "C-x g") 'magit-status)
