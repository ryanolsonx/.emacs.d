(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(prefer-coding-system 'utf-8)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "IBM Plex Mono 16" nil t)

(column-number-mode t)
(savehist-mode)
(global-auto-revert-mode t)


(fset 'yes-or-no-p 'y-or-n-p)
(define-key global-map (kbd "RET") 'newline-and-indent)

(setq-default indent-tabs-mode nil
              tab-width 2
              inhibit-startup-screen t
              js-indent-level 2
              make-backup-file nil
              create-lockfiles nil
              auto-save-default nil
              css-indent-offset 2
              vc-follow-symlinks t
              custom-file "custom.el"
              ring-bell-function 'ignore
              initial-scratch-message ""
              use-package-always-ensure t)

(load custom-file)


(add-to-list 'auto-mode-alist '("\\.cs" . (lambda ()
                                            (setq tab-width 4
                                                  indent-tabs-mode t))))
(add-hook 'js-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'xref-find-definitions)))

(use-package eldoc
  :diminish)

(use-package company
  :diminish
  :config
  (global-company-mode t))

(use-package diminish)

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package which-key
  :diminish
  :config
  (which-key-mode))

(use-package ivy
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

(use-package projectile
  :after ivy
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map))

(use-package magit
  :init
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package autorevert
  :diminish)

(use-package editorconfig
  :diminish
  :config
  (editorconfig-mode))

(use-package prettier-js
  :init
  (setq prettier-js-command "prettier-eslint")
  (add-hook 'js-mode-hook 'prettier-js-mode))

(use-package ace-jump-mode
  :config
  (define-key global-map (kbd "C-j") 'ace-jump-mode)
  (define-key global-map (kbd "C-c j") 'ace-jump-mode-pop-mark))

(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window))
