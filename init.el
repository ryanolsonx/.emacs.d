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
	      css-indent-level 2)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(global-set-key (kbd "C-0") (lambda () (interactive) (delete-window)))
(global-set-key (kbd "C-1") (lambda () (interactive) (delete-other-windows)))
(global-set-key (kbd "C-2") (lambda () (interactive) (split-window-vertically)))
(global-set-key (kbd "C-3") (lambda () (interactive) (split-window-horizontally)))
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "C-,") (lambda () (interactive) (beginning-of-buffer)))
(global-set-key (kbd "C-.") (lambda () (interactive) (end-of-buffer)))
(global-set-key (kbd "M-l") 'switch-to-buffer)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region)

(defun duplicate-line ()
  "Duplicate current line"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(global-set-key (kbd "C-c d") 'duplicate-line)
(global-set-key (kbd "C-c C-d") 'duplicate-line)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#3B3228" :foreground "#bba792" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Fira Mono"))))
 '(font-lock-builtin-face ((t (:foreground "#bba792"))))
 '(font-lock-comment-face ((t (:foreground "#9db889"))))
 '(font-lock-constant-face ((t (:foreground "#bba792"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:foreground "#bba792"))))
 '(font-lock-keyword-face ((t (:foreground "#D08864"))))
 '(font-lock-string-face ((t (:foreground "#CFAE74"))))
 '(font-lock-type-face ((t (:foreground "#CFAE74"))))
 '(font-lock-preprocessor-face ((t (:foreground "#D08864"))))
 '(font-lock-variable-name-face ((t (:foreground "#bba792")))))

;; my 1.0
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#2e2a26" :foreground "#c5b09a" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:foreground "#c5b09a"))))
;;  '(font-lock-comment-face ((t (:foreground "#ABCD74"))))
;;  '(font-lock-constant-face ((t (:foreground "#e7c072"))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:foreground "#c5b09a"))))
;;  '(font-lock-keyword-face ((t (:foreground "#fadfc3"))))
;;  '(font-lock-string-face ((t (:foreground "#df8e68"))))
;;  '(font-lock-type-face ((t (:foreground "#e7c072"))))
;;  '(font-lock-preprocessor-face ((t (:foreground "#e7c072"))))
;;  '(font-lock-variable-name-face ((t (:foreground "#c5b09a")))))
