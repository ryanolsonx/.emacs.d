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
	      css-indent-level 2
              make-backup-file nil
              auto-save-default nil)

(global-set-key (kbd "C-0") 'delete-window)
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-vertically)
(global-set-key (kbd "C-3") 'split-window-horizontally)
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)
(global-set-key (kbd "M-m") 'switch-to-buffer)
(global-set-key (kbd "M-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-r") 'replace-string)
(global-set-key (kbd "C-q") 'query-replace)

(defun duplicate-line ()
  "Duplicate current line below and move cursor to end of that new line"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(global-set-key (kbd "C-c d") 'duplicate-line)
(global-set-key (kbd "C-c C-d") 'duplicate-line)

;; golang light
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:background "#efefef" :foreground "#3e4042" :height 160 :family "SF Mono"))))
;;  '(font-lock-builtin-face ((t (:inherit default))))
;;  '(font-lock-comment-face ((t (:foreground "#006600"))))
;;  '(font-lock-constant-face ((t (:inherit default))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:inherit default))))
;;  '(font-lock-keyword-face ((t (:inherit default))))
;;  '(font-lock-preprocessor-face ((t (:inherit default))))
;;  '(font-lock-string-face ((t (:inherit default))))
;;  '(font-lock-type-face ((t (:inherit default))))
;;  '(font-lock-variable-name-face ((t (:inherit default))))
;;  '(isearch ((t (:background "#add1f9"))))
;;  '(lazy-highlight ((t (:background "#add1f9"))))
;;  '(region ((t (:background "#add1f9"))))
;;  '(fringe ((t (:inherit default)))))

(defvar accent-color
  ;; "#64b2db" ;; blue
  "#a76f54" ;; wood
  ;;"#b6db51" ;; acid
  ;; "#fa2f00" ;; alert (red)
  ;;"#ffbf3b" ;; golden
  "Accent color for color scheme")

;; forest
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#191919" :foreground "#CCCCCC" :height 160 :family "SF Mono"))))
 '(font-lock-builtin-face ((t (:inherit default))))
 '(font-lock-comment-face ((t (:foreground "#57a73a"))))
 `(font-lock-constant-face ((t (:foreground ,accent-color))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:inherit default))))
 `(font-lock-keyword-face ((t (:foreground ,accent-color))))
 `(font-lock-preprocessor-face ((t (:foreground ,accent-color))))
 `(font-lock-string-face ((t (:foreground ,accent-color))))
 `(font-lock-type-face ((t (:foreground ,accent-color))))
 '(font-lock-variable-name-face ((t (:inherit default))))
 '(isearch ((t (:background "#add1f9"))))
 '(lazy-highlight ((t (:background "#add1f9"))))
 '(region ((t (:background "#add1f9"))))
 '(fringe ((t (:inherit default)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
