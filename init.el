(package-initialize)

;; Syntax highlighting off
(global-font-lock-mode -1)
(global-auto-revert-mode t)
(delete-selection-mode t)

(setq make-backup-files nil
      standard-indent 2
      tab-width 2
      indent-tabs-mode nil
      inhibit-startup-screen t
      initial-scratch-message ""
      visible-bell t)

(add-hook 'js-mode-hook (lambda () (setq js-indent-level 2)))

(add-to-list 'auto-mode-alist '("\\.cs" . (lambda ()
					    (setq tab-width 4
						  indent-tabs-mode t))))
