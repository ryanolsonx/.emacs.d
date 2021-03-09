(savehist-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode t)
(delete-selection-mode t)
(global-auto-revert-mode t)
(global-linum-mode t)

(setq-default inhibit-startup-screen t
	      ring-bell-function 'ignore
	      indent-tabs-mode nil
	      js-indent-level 2
	      css-indent-level 2)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(global-set-key (kbd "C-0") 'delete-window)
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") (lambda () (interactive) (split-window-vertically) (other-window 1)))
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "C-3") (lambda () (interactive) (split-window-horizontally) (other-window 1)))
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)
(global-set-key (kbd "<C-return>") 'switch-to-buffer)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-r") 'replace-string)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:background "#3B3228" :foreground "#bba792" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:foreground "#bba792"))))
;;  '(font-lock-comment-face ((t (:foreground "#9db889"))))
;;  '(font-lock-constant-face ((t (:foreground "#bba792"))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:foreground "#bba792"))))
;;  '(font-lock-keyword-face ((t (:foreground "#D08864"))))
;;  '(font-lock-string-face ((t (:foreground "#CFAE74"))))
;;  '(font-lock-type-face ((t (:foreground "#CFAE74"))))
;;  '(font-lock-preprocessor-face ((t (:foreground "#D08864"))))
;;  '(font-lock-variable-name-face ((t (:foreground "#bba792")))))

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

;; minimal green accent, brown comments, yellow string
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#0c100e" :foreground "#b2bdb7" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:inherit default))))
;;  '(font-lock-comment-face ((t (:foreground "#a37c53"))))
;;  '(font-lock-constant-face ((t (:inherit default))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:inherit default))))
;;  '(font-lock-keyword-face ((t (:foreground "#90ad41"))))
;;  '(font-lock-preprocessor-face ((t (:inherit default))))
;;  '(font-lock-string-face ((t (:foreground "#be974f"))))
;;  '(font-lock-type-face ((t (:foreground "#90ad41"))))
;;  '(font-lock-variable-name-face ((t (:inherit default))))
;;  '(fringe ((t (:background "#0c100e")))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#0c100e" :foreground "#b2bdb7" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:inherit default))))
;;  '(font-lock-comment-face ((t (:foreground "#90ad41"))))
;;  '(font-lock-constant-face ((t (:inherit default))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:inherit default))))
;;  '(font-lock-keyword-face ((t (:foreground "#a37c53"))))
;;  '(font-lock-preprocessor-face ((t (:inherit default))))
;;  '(font-lock-string-face ((t (:foreground "#be974f"))))
;;  '(font-lock-type-face ((t (:foreground "#a37c53"))))
;;  '(font-lock-variable-name-face ((t (:inherit default))))
;;  '(fringe ((t (:background "#0c100e")))))

;; monokai
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#282923" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:inherit default))))
;;  '(font-lock-comment-face ((t (:foreground "#74705d"))))
;;  '(font-lock-constant-face ((t (:foreground "#ac80ff"))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:foreground "#a6e22c"))))
;;  '(font-lock-keyword-face ((t (:foreground "#f92472"))))
;;  '(font-lock-preprocessor-face ((t (:foreground "#f92472"))))
;;  '(font-lock-string-face ((t (:foreground "#e7db74"))))
;;  '(font-lock-type-face ((t (:foreground "#67d8ef"))))
;;  '(font-lock-variable-name-face ((t (:inherit default))))
;;  '(fringe ((t (:inherit default))))
;;  '(region ((t (:extend t :background "#48473d")))))

;; monokai muted
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#30322a" :foreground "#e6e6d1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:inherit default))))
;;  '(font-lock-comment-face ((t (:foreground "#9bc34b")))) ;; green
;;  '(font-lock-constant-face ((t (:foreground "#b69fdf")))) ;; purple
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:inherit default))))
;;  '(font-lock-keyword-face ((t (:foreground "#c75780")))) ;; red
;;  '(font-lock-preprocessor-face ((t (:foreground "#c75780")))) ;; red
;;  '(font-lock-string-face ((t (:foreground "#d6ce85")))) ;; yellow
;;  '(font-lock-type-face ((t (:foreground "#81c7d5")))) ;; blue
;;  '(font-lock-variable-name-face ((t (:inherit default))))
;;  '(fringe ((t (:inherit default))))
;;  '(region ((t (:extend t :foreground "#000000" :background "#81c7d5")))))

;; PEACH PUFF
(font-lock-add-keywords 'js-mode
                        '(("\\<\\(function\\)\\>" . font-lock-type-face)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#1e1e1e" :foreground "#d8d8d8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Fira Mono"))))
 '(font-lock-builtin-face ((t (:inherit default))))
 '(font-lock-comment-face ((t (:foreground "#7eda09")))) ;; green
 '(font-lock-constant-face ((t (:foreground "#ae5141")))) ;; red
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:inherit default))))
 '(font-lock-keyword-face ((t (:foreground "#c3af48")))) ;; yellow
 '(font-lock-preprocessor-face ((t (:foreground "#946d99")))) ;; magenta
 '(font-lock-string-face ((t (:foreground "#ae5141")))) ;; red
 '(font-lock-type-face ((t (:foreground "#44b0b6")))) ;; blue
 '(font-lock-variable-name-face ((t (:inherit default))))
 '(fringe ((t (:inherit default))))
 '(linum ((t (:foreground "#c3af48"))))
 '(region ((t (:extend t :foreground "#000000" :background "#81c7d5")))))

