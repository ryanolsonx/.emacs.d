;; Setup emacs package manager so that we can download packages
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(prefer-coding-system 'utf-8)
(package-initialize)

;; Install use-package, if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-verbose t)
(require 'use-package)

;; Emacs specific settings
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      custom-file "~/.emacs.d/custom.el"
      make-backup-files nil
      auto-save-default nil
      ring-bell-function 'ignore)

(load custom-file)

;; Change default emacs things
;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode)
(blink-cursor-mode -1)
(transient-mark-mode 1)
(global-linum-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(set-frame-name "Emacs")
(define-key global-map (kbd "RET") 'newline-and-indent)
(set-default-font "Hack 12")

;; easy keys to split window. Key based on ErgoEmacs keybinding
(global-set-key (kbd "M-3") 'delete-other-windows)
(global-set-key (kbd "M-4") 'split-window-below)
(global-set-key (kbd "M-2") 'delete-window)
(global-set-key (kbd "M-s") 'other-window)

(use-package testing
  :load-path "elisp"
  :config
  (global-set-key (kbd "C-c t") 'testing-run-test))

(use-package navigation
  :load-path "elisp"
  :config
  (global-set-key (kbd "C-c s") 'navigation-toggle-between-source-and-test))

;; Built in packages configuration
(use-package eldoc
  :diminish)

;; Third party packages and their configurations
(use-package diminish
  :ensure t)

;; Use mac system path
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;(add-to-list 'default-frame-alist '(background-color . "#282C34"))
;;(add-to-list 'default-frame-alist '(foreground-color . "#E2E4E9"))

;; Setup my theme
(use-package doom-themes
  :disabled t
  :ensure t
  :config
  (load-theme 'doom-tomorrow-night 'no-confirm))

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula 'no-confirm))

;; Autocomplete everything
(use-package company
  :ensure t
  :diminish
  :init
  (setq company-tooltip-align-annotations t)
  :config
  (global-company-mode))

;; Easier selection of text
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

;; Helper for key bindings
(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode))

;; Fuzzy finder everywhere
(use-package ivy
  :ensure t
  :diminish
  :init
  (setq ivy-count-format ""
      ivy-display-style nil
      ivy-minibuffer-faces nil
      ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  :config
  (ivy-mode t)
  (global-set-key (kbd "C-c M-x") 'execute-extended-command)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done))

;; Project manager and finder
(use-package projectile
  :after ivy
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; BEST GIT CLIENT EVER!
(use-package magit
  :ensure t
  :init
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package autorevert
  :diminish)


(use-package editorconfig
  :ensure t
  :diminish
  :config
  (editorconfig-mode))

(use-package org-bullets
  :disabled t
  :ensure t
  :init
  (setq org-bullets-bullet-list
	'("◉" "◎" "<img draggable="false" class="emoji" alt="⚫" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/26ab.svg" scale="0">" "○" "►" "◇")))

(use-package org
  :init
  (setq org-todo-keywords
	'((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
  :config
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

  (add-hook 'org-mode-hook (lambda ()
			     (visual-line-mode t))))

(use-package js2-mode
  :ensure t
  :init
  (setq js2-basic-offset 2))

;; react mode
(use-package rjsx-mode
  :ensure t
  :init
  (add-to-list 'magic-mode-alist '("import.*react" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; autocomplete (from typescript) for javascript
(use-package tide
  :ensure t
  :preface
  (defun setup-tide-for-javascript ()
    (interactive)
    (tide-setup)
    (eldoc-mode +1)
    (company-mode +1)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(
						save
						mode-enabled
						new-line
						idle-change)))
  :init
  (add-hook 'js2-mode-hook #'setup-tide-for-javascript)
  (add-hook 'rjsx-mode-hook #'setup-tide-for-javascript))

;; autoformat javascript code
(use-package prettier-js
  :ensure t
  :init
  (setq prettier-js-command "./node_modules/prettier-eslint-cli/dist/index.js")
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'rjsx-mode-hook 'prettier-js-mode))

;; swift syntax highlighting (mainly for git diff)
(use-package swift-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package ace-jump-mode
  :ensure t
  :config
  (define-key global-map (kbd "C-j") 'ace-jump-mode)
  (define-key global-map (kbd "C-c j") 'ace-jump-mode-pop-mark))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))

(use-package god-mode
  :ensure t
  :init
  (setq god-exempt-major-modes nil)
  (setq god-exempt-predicates nil)
  :config
  (global-set-key (kbd "<escape>") 'god-mode-all)
  (global-set-key (kbd "C-x C-1") 'delete-other-windows)
  (global-set-key (kbd "C-x C-2") 'split-window-below)
  (global-set-key (kbd "C-x C-3") 'split-window-right)
  (global-set-key (kbd "C-x C-0") 'delete-window)
  (global-set-key (kbd "C-x C-o") 'other-window))

;;(load-file "~/.emacs.d/private.el")
