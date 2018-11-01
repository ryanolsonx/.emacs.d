(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      custom-file "~/.emacs.d/custom.el"
      make-backup-files nil
      auto-save-default nil
      ring-bell-function 'ignore)

(load custom-file)

;; modes
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode)
(blink-cursor-mode -1)
(global-linum-mode t)

;; other things
(fset 'yes-or-no-p 'y-or-n-p)
(set-frame-name "Emacs")
(define-key global-map (kbd "RET") 'newline-and-indent)
