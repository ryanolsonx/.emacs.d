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

(defface special-keyword
  '((t :foreground "black"
       :background "aquamarine"
       ))
  "Face for special keywords."
  :group 'js-mode)

(add-hook 'js-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(function\\|return\\|throw\\)\\>" . 'special-keyword)))))

;; Apple Books
;; v1
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#faf4e9" :foreground "#603e22" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:foreground "#603e22"))))
;;  '(font-lock-comment-face ((t (:foreground "#5f380c" :background "#f9dc78"))))
;;  '(font-lock-constant-face ((t (:foreground "#603e22"))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:foreground "#603e22"))))
;;  '(font-lock-keyword-face ((t (:foreground "#603e22"))))
;;  '(font-lock-preprocessor-face ((t (:foreground "#603e22"))))
;;  '(font-lock-string-face ((t (:foreground "#603e22" :background "#ebe5db"))))
;;  '(font-lock-type-face ((t (:foreground "#5e2718" :background "#fb9ead"))))
;;  '(font-lock-variable-name-face ((t (:foreground "#603e22")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#faf4e9" :foreground "#603e22" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "SF Mono"))))
 '(font-lock-builtin-face ((t (:foreground "#603e22"))))
 '(font-lock-comment-face ((t (:foreground "#603e22" :background "#ebe5db"))))
 '(font-lock-constant-face ((t (:foreground "#603e22"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:foreground "#603e22"))))
 '(font-lock-keyword-face ((t (:foreground "#603e22"))))
 '(special-keyword ((t (:foreground "#603e22" :background "#f9dc78"))))
 '(font-lock-preprocessor-face ((t (:foreground "#603e22"))))
 '(font-lock-string-face ((t (:foreground "#603e22"))))
 '(font-lock-type-face ((t (:foreground "#603e22"))))
 '(font-lock-variable-name-face ((t (:foreground "#603e22")))))

;; summerfruit
;; (font-lock-add-keywords 'js-mode
;;                         '(("\\<\\(function\\|async\\|await\\|export\\|import\\|const\\|var\\|let\\)\\>" . font-lock-type-face)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#fdfdfd" :foreground "#232a2e" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Fira Mono"))))
;;  '(font-lock-builtin-face ((t (:foreground "#fb6e39"))))
;;  '(font-lock-comment-face ((t (:foreground "#358f27" :background "#dcf2cd"))))
;;  '(font-lock-constant-face ((t (:foreground "#fb6e39"))))
;;  '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
;;  '(font-lock-function-name-face ((t (:foreground "#232a2e"))))
;;  '(font-lock-keyword-face ((t (:foreground "#fb6e39"))))
;;  '(font-lock-string-face ((t (:foreground "#348bd3"))))
;;  '(font-lock-type-face ((t (:foreground "#fb2585"))))
;;  '(font-lock-preprocessor-face ((t (:foreground "#fb6e39"))))
;;  '(font-lock-variable-name-face ((t (:foreground "#232a2e")))))

;; my theme
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
