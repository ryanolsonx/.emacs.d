(savehist-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode t)
(delete-selection-mode t)
(global-auto-revert-mode t)
(global-display-line-numbers-mode t)

(setq-default inhibit-startup-screen t
	      ring-bell-function 'ignore
	      indent-tabs-mode nil
	      js-indent-level 2
              typescript-indent-level 2
              css-indent-offset 2
              make-backup-file nil
              auto-save-default nil)

(set-face-attribute 'default nil :height 160)

(defun go-to-journal ()
  (interactive)
  (let ((day-file (format-time-string "~/n/journal/%Y/%m/%d.md"))
        (time (format-time-string "\n\n# %I:%M\n\n")))
    (find-file day-file)
    (append-to-file time nil day-file)))

(global-set-key (kbd "C-0") 'delete-window)
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-vertically)
(global-set-key (kbd "C-3") 'split-window-horizontally)
(global-set-key (kbd "C-o") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)
(global-set-key (kbd "s-j") 'go-to-journal)
(global-set-key (kbd "s-q") 'query-replace)
(global-set-key (kbd "s-g") 'magit-status)
(global-set-key (kbd "s-t") 'tab-bar-mode)
(global-set-key (kbd "s-1") (lambda () (interactive) (tab-bar-select-tab 1)))
(global-set-key (kbd "s-2") (lambda () (interactive) (tab-bar-select-tab 2)))
(global-set-key (kbd "s-3") (lambda () (interactive) (tab-bar-select-tab 3)))
(global-set-key (kbd "s-4") (lambda () (interactive) (tab-bar-select-tab 4)))
(global-set-key (kbd "s-5") (lambda () (interactive) (tab-bar-select-tab 5)))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js-mode))


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
 '(font-lock-builtin-face ((t (:foreground "#AF00DB"))))
 '(font-lock-comment-face ((t (:foreground "#008000"))))
 '(font-lock-constant-face ((t (:foreground "#0000FF"))))
 '(font-lock-function-name-face ((t (:foreground "#267F99"))))
 '(font-lock-keyword-face ((t (:foreground "#0000FF"))))
 '(font-lock-string-face ((t (:foreground "#A31515"))))
 '(font-lock-type-face ((t (:foreground "#795E26"))))
 '(font-lock-variable-name-face ((t (:foreground "#0070C1")))))
