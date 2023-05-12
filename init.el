(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; -- MODES

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-auto-revert-mode t)
(delete-selection-mode t)
(column-number-mode t)
(savehist-mode t)
(global-display-line-numbers-mode t)
(tab-bar-mode t)

;; -- SETTINGS
(set-frame-font "SF Mono 16" nil t)
(setq-default inhibit-startup-screen t
	      ring-bell-function 'ignore
	      indent-tabs-mode nil
	      js-indent-level 2
	      css-indent-level 2)

;; -- KEYBINDINGS
(global-set-key (kbd "C-0") (lambda () (interactive) (delete-window)))
(global-set-key (kbd "C-1") (lambda () (interactive) (delete-other-windows)))
(global-set-key (kbd "C-2") (lambda () (interactive) (split-window-vertically) (other-window 1)))
(global-set-key (kbd "C-3") (lambda () (interactive) (split-window-horizontally) (other-window 1)))
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)
(global-set-key (kbd "s-1") (lambda () (interactive) (tab-bar-select-tab 1)))
(global-set-key (kbd "s-2") (lambda () (interactive) (tab-bar-select-tab 2)))
(global-set-key (kbd "s-3") (lambda () (interactive) (tab-bar-select-tab 3)))
(global-set-key (kbd "s-4") (lambda () (interactive) (tab-bar-select-tab 4)))
(global-set-key (kbd "s-5") (lambda () (interactive) (tab-bar-select-tab 5)))
(global-set-key (kbd "s-n") 'tab-bar-new-tab)

;; -- PACKAGES
(use-package magit
  :config (global-set-key (kbd "C-c g") 'magit-status))

;; (use-package zenburn-theme
;;   :config (load-theme 'zenburn t))

(use-package atom-one-dark-theme
  :config (load-theme 'atom-one-dark t))

;;(use-package doom-themes
;;  :config (load-theme 'doom-gruvbox t))

(use-package elm-mode)

(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

(use-package add-node-modules-path
  :config (add-hook 'js-mode-hook #'add-node-modules-path))

(use-package prettier-js
  :hook js-mode)

(use-package company
  :config (global-company-mode t))

(use-package lsp-mode
  :defer
  :init
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-peek-always-show t))

(use-package which-key
  :config (which-key-mode))

(use-package vterm)

(use-package vterm-toggle
  :config (global-set-key (kbd "C-c t") 'vterm-toggle))

(use-package multi-vterm)

;;(use-package counsel
;;  :config
;;  (global-set-key (kbd "C-c f") 'counsel-git)
;;  (global-set-key (kbd "C-c o") 'counsel-outline))

;; -- VIM

;;(use-package evil
;;  :init (setq evil-shift-width 2
;;              evil-want-keybinding nil
;;              evil-want-C-u-delete t
;;              evil-want-C-u-scroll t
;;              evil-want-C-w-in-emacs-state t)
;;  :config (evil-mode 1))
;;
;;(use-package evil-collection
;;  :after evil
;;  :ensure t
;;  :config
;;  (evil-collection-init))
;;
;;;; Ensure that ESC quits things
;;(defun minibuffer-keyboard-quit ()
;;  "Abort recursive edit.
;;In Delete Selection mode, if the mark is active, just deactivate it;
;;then it takes a second \\[keyboard-quit] to abort the minibuffer."
;;  (interactive)
;;  (if (and delete-selection-mode transient-mark-mode mark-active)
;;      (setq deactivate-mark  t)
;;    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
;;    (abort-recursive-edit)))
;;(define-key evil-normal-state-map [escape] 'keyboard-quit)
;;(define-key evil-visual-state-map [escape] 'keyboard-quit)
;;(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(multi-vterm atom-one-dark-theme oceanic-theme badwolf-theme doom-themes vterm-toggle counsel vterm which-key lsp-mode company company-mode prettier-js add-node-modules-path exec-path-from-shell evil-collection evil elm-mode zenburn-theme magit use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
