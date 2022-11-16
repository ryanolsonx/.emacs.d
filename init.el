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
  (find-file (format-time-string "~/journal/%Y/%m/%d.md")))

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


