(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(prefer-coding-system 'utf-8)
(package-initialize)

(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq-default inhibit-startup-screen t
	      backup-inhibited t
	      make-backup-files nil
	      auto-save-default nil
	      ring-bell-function 'ignore)

(fset 'yes-or-no-p 'y-or-n-p)
(define-key global-map (kbd "RET") 'newline-and-indent)
