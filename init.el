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
              css-indent-offset 2
              make-backup-file nil
              auto-save-default nil)

(set-face-attribute 'default nil :height 140)

(global-set-key (kbd "C-0") 'delete-window)
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-vertically)
(global-set-key (kbd "C-3") 'split-window-horizontally)
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)
(global-set-key (kbd "C-c g") 'magit-status)

