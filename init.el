(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-auto-revert-mode t)
(delete-selection-mode t)
(column-number-mode t)
(savehist-mode t)

(set-background-color "#232323")
(set-foreground-color "#c5b19b")
;;(set-face-attribute 'font-lock-keyword-face nil :foreground "#267a78")
;;(set-face-attribute 'font-lock-comment-face nil :foreground "#a38621")
;;(set-face-attribute 'font-lock-type-face nil :foreground "#abcd74")

(setq-default inhibit-startup-screen t
	      ring-bell-function 'ignore
	      indent-tabs-mode nil
	      js-indent-level 2
	      css-indent-level 2)

;;(load-theme 'zenburn 'no-confirm)
(set-face-attribute 'default nil :height 180)

(global-set-key (kbd "C-0") (lambda () (interactive) (delete-window)))
(global-set-key (kbd "C-1") (lambda () (interactive) (delete-other-windows)))
(global-set-key (kbd "C-2") (lambda () (interactive) (split-window-vertically) (other-window 1)))
(global-set-key (kbd "C-3") (lambda () (interactive) (split-window-horizontally) (other-window 1)))
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)
(global-set-key (kbd "C-c g") 'magit-status)

(set-cursor-color "#abcd74")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#2d2925" :foreground "#c5b19b" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "nil" :family "Menlo"))))
 '(font-lock-builtin-face ((t (:foreground "#e7c173"))))
 '(font-lock-comment-face ((t (:foreground "#abcd74"))))
 '(font-lock-constant-face ((t (:foreground "#e7c173"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t nil)))
 '(font-lock-keyword-face ((t (:foreground "#fadfc2"))))
 '(font-lock-string-face ((t (:foreground "#df8d68"))))
 '(font-lock-type-face ((t (:foreground "#e7c173"))))
 '(font-lock-variable-name-face ((t nil)))
 '(org-block ((t (:extend t)))))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    '(darcula-theme zenburn-theme which-key solarized-theme prettier-js prettier magit go-mode exec-path-from-shell elm-mode doom-themes cyberpunk-theme cyberpunk-2019-theme company color-theme-sanityinc-solarized atom-one-dark-theme add-node-modules-path)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3f1dcd824a683e0ab194b3a1daac18a923eed4dba5269eecb050c718ab4d5a26" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
