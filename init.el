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
(global-set-key (kbd "C-2") (lambda () (interactive) (split-window-vertically) (other-window 1)))
(global-set-key (kbd "C-3") (lambda () (interactive) (split-window-horizontally) (other-window 1)))
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "M-l") 'switch-to-buffer)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; lime: #ABCD74
;; yellow: #f5c159
;; coral: #df8e68
;; pale lime: #9DB889

;; jblow style?
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#03282d" :foreground "#aaa09b" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:foreground "#aaa09b"))))
;;  '(font-lock-comment-face ((t (:foreground "#3e9b3d"))))
;;  '(font-lock-constant-face ((t (:foreground "#a2dcb4"))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:foreground "#aaa09b"))))
;;  '(font-lock-keyword-face ((t (:foreground "#e8eee3"))))
;;  '(font-lock-string-face ((t (:foreground "#0eb19f"))))
;;  '(font-lock-type-face ((t (:foreground "#a2dcb4"))))
;;  '(font-lock-preprocessor-face ((t (:foreground "#aaa09b"))))
;;  '(font-lock-variable-name-face ((t (:foreground "#aaa09b")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#2e2a26" :foreground "#c5b09a" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Fira Mono"))))
 '(font-lock-builtin-face ((t (:foreground "#c5b09a"))))
 '(font-lock-comment-face ((t (:foreground "#ABCD74"))))
 '(font-lock-constant-face ((t (:foreground "#e7c072"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:foreground "#c5b09a"))))
 '(font-lock-keyword-face ((t (:foreground "#fadfc3"))))
 '(font-lock-string-face ((t (:foreground "#df8e68"))))
 '(font-lock-type-face ((t (:foreground "#e7c072"))))
 '(font-lock-preprocessor-face ((t (:foreground "#e7c072"))))
 '(font-lock-variable-name-face ((t (:foreground "#c5b09a")))))

;; Orig earthsong
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#36312c" :foreground "#ebd1b7" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:foreground "#ABCD74"))))
;;  '(font-lock-comment-face ((t (:foreground "#F5C159"))))
;;  '(font-lock-constant-face ((t (:foreground "#ABCD74"))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:foreground "#ebd1b7"))))
;;  '(font-lock-keyword-face ((t (:foreground "#ABCD74"))))
;;  '(font-lock-string-face ((t (:foreground "#DF8E68"))))
;;  '(font-lock-type-face ((t (:foreground "#9DB889"))))
;;  '(font-lock-variable-name-face ((t (:foreground "#ebd1b7")))))
