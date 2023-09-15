(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(setq win (string= system-type "windows-nt"))

(if win
    (setq url-proxy-services '(("https" . "proxy") ("http" . "proxy"))))

;; -- MODES

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-auto-revert-mode t)
(delete-selection-mode t)
(column-number-mode t)
(savehist-mode t)
;;(global-display-line-numbers-mode t)
(set-background-color "#1e1e1e")
(set-foreground-color "#d4d4d4")
(set-cursor-color "#ea94d6")
(global-font-lock-mode 0)
;; (tab-bar-mode t)

;; -- SETTINGS

(set-frame-font (if win "Consolas 14" "Menlo 16") nil t)
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
;; (global-set-key (kbd "s-1") (lambda () (interactive) (tab-bar-select-tab 1)))
;; (global-set-key (kbd "s-2") (lambda () (interactive) (tab-bar-select-tab 2)))
;; (global-set-key (kbd "s-3") (lambda () (interactive) (tab-bar-select-tab 3)))
;; (global-set-key (kbd "s-4") (lambda () (interactive) (tab-bar-select-tab 4)))
;; (global-set-key (kbd "s-5") (lambda () (interactive) (tab-bar-select-tab 5)))
;; (global-set-key (kbd "s-n") 'tab-bar-new-tab)

;; -- PACKAGES

(if win (add-to-list 'exec-path "path/to/git"))
(if win (add-to-list 'exec-path "path/to/node"))
(if win (add-to-list 'exec-path "path/to/npmglobal"))

(use-package magit
  :config (global-set-key (kbd "C-c g") 'magit-status))

(use-package elm-mode)

(if (not win)
    (use-package exec-path-from-shell
      :config (exec-path-from-shell-initialize)))

(use-package add-node-modules-path
  :config (add-hook 'js-mode-hook #'add-node-modules-path))

(use-package prettier
  :hook js-mode)

(use-package company
  :config (global-company-mode t))

(use-package which-key
  :config (which-key-mode))

;;(use-package zenburn-theme
;;  :config (load-theme 'zenburn t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(prettier color-theme-sanityinc-zenburn gruvbox-theme zenburn-theme which-key vterm-toggle vscode-dark-plus-theme use-package solarized-theme prettier-js oceanic-theme multi-vterm magit lsp-mode exec-path-from-shell evil-collection elm-mode doom-themes counsel company color-theme-sanityinc-solarized badwolf-theme atom-one-dark-theme add-node-modules-path)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
