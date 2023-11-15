(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-auto-revert-mode t)
(delete-selection-mode t)
(column-number-mode t)
(savehist-mode t)

(setq-default inhibit-startup-screen t
	      ring-bell-function 'ignore
	      indent-tabs-mode nil
	      js-indent-level 2
	      css-indent-level 2)

(global-set-key (kbd "C-0") (lambda () (interactive) (delete-window)))
(global-set-key (kbd "C-1") (lambda () (interactive) (delete-other-windows)))
(global-set-key (kbd "C-2") (lambda () (interactive) (split-window-vertically) (other-window 1)))
(global-set-key (kbd "C-3") (lambda () (interactive) (split-window-horizontally) (other-window 1)))
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)
(global-set-key (kbd "C-m") 'magit-status)

(set-cursor-color "#abcd74")

(custom-set-faces
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#2d2925" :foreground "#c5b19b" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "Menlo"))))
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
