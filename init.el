(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(savehist-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode t)
(delete-selection-mode t)
(global-auto-revert-mode t)

(setq-default inhibit-startup-screen t
	      ring-bell-function 'ignore
	      indent-tabs-mode nil
	      js-indent-level 2
	      css-offset-level 2
              make-backup-file nil
              auto-save-default nil
              magit-git-executable "/usr/local/bin/git")

(global-set-key (kbd "C-0") 'delete-window)
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-vertically)
(global-set-key (kbd "C-3") 'split-window-horizontally)
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)
(global-set-key (kbd "C-c g") 'magit-status)

;;(load "~/.emacs.d/clojure.el")

;;(require 'clojure)
;;(message (str/capitalize "lkjfFFDSjkj"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(elm-mode magit)))

;; Amity
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#362b20" :foreground "#e1c8af" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Menlo"))))
 '(font-lock-builtin-face ((t (:foreground "#e1c8af"))))
 '(font-lock-comment-face ((t (:foreground "#a0ba76"))))
 '(font-lock-constant-face ((t (:foreground "#d6ad77"))))
 '(font-lock-function-name-face ((t nil)))
 '(font-lock-keyword-face ((t (:foreground "#cd8c6c"))))
 '(font-lock-string-face ((t (:foreground "#d6ad77"))))
 '(font-lock-type-face ((t (:foreground "#f8af71"))))
 '(font-lock-variable-name-face ((t nil)))
 '(fringe ((t (:background "#362b20"))))
 '(org-block ((t (:extend t)))))
