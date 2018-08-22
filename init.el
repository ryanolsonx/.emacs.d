;; Things I set _every_ time I start from scratch.
(load "~/.emacs.d/elisp/defaults.el")
(load "~/.emacs.d/elisp/swipeclock.el")

;; color theme
(load-theme 'doom-solarized-light 'no-confirm)

;; font
(set-default-font "Hack 13")

;; enable basic modes
(transient-mark-mode 1)
(global-linum-mode)

;; Fix shell path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; COMPANY
(setq company-tooltip-align-annotations t)
(global-company-mode)

;; EXPAND REGION
(global-set-key (kbd "C-=") 'er/expand-region)

;; WHICH KEY
(which-key-mode)

;; PROJECTILE
(projectile-global-mode)

;; MAGIT
(global-set-key (kbd "C-x g") 'magit-status)

;; IDO
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-create-new-buffer 'always)

;; SMEX
(global-set-key (kbd "C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-x") 'smex)

;; DIMINISH
(require 'diminish)
(diminish 'company-mode)
(diminish 'which-key-mode)
(diminish 'eldoc-mode)
(diminish 'tide-mode)
(diminish 'auto-revert-mode)

;; EDITORCONFIG
(editorconfig-mode)

;; ORG
(require 'org)

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode t)))

;; language specific things
(setq js2-basic-offset 2)

(defun setup-tide-mode-for-javascript ()
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

(add-to-list 'magic-mode-alist '("import.*react" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook #'setup-tide-mode-for-javascript)
(add-hook 'rjsx-mode-hook #'setup-tide-mode-for-javascript)

;; prettier
(setq prettier-js-command "prettier-eslint")
(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
