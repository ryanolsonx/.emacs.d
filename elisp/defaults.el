(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)

;; basic settings
(setq inhibit-startup-screen t
      custom-file "~/.emacs.d/custom.el"
      make-backup-files nil
      auto-save-default nil)

(load custom-file)

;; modes
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
