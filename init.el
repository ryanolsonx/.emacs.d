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
;;(set-background-color "#1e1e1e")
;;(set-foreground-color "#d4d4d4")
;;(set-cursor-color "#ea94d6")
;;(global-font-lock-mode 0)
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

(defun my-magit-status ()
  (interactive)
  (magit-status)
  (delete-other-windows)
  (font-lock-mode))

(use-package magit
  :config (global-set-key (kbd "C-c g") 'my-magit-status))

(use-package elm-mode)

(use-package go-mode
  :custom
  (gofmt-command "goimports")
  :init
  (add-hook 'before-save-hook #'gofmt-before-save))

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

;;(use-package doom-themes
;;  :config (load-theme 'doom-one t))
;;(use-package solarized-theme
;;  :config (load-theme 'solarized-dark t))

;;(use-package atom-one-dark-theme)

(set-cursor-color "#abcd74")

(custom-set-faces
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#2d2925" :foreground "#c5b19b" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Menlo"))))
 '(font-lock-builtin-face ((t (:foreground "#e7c173"))))
 '(font-lock-comment-face ((t (:foreground "#abcd74"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-constant-face ((t (:foreground "#e7c173"))))
 '(font-lock-function-name-face ((t nil)))
 '(font-lock-keyword-face ((t (:foreground "#fadfc2"))))
 '(font-lock-string-face ((t (:foreground "#df8d68"))))
 '(font-lock-type-face ((t (:foreground "#e7c173"))))
 '(font-lock-variable-name-face ((t nil)))
 '(org-block ((t (:extend t)))))
