(global-font-lock-mode -1)
(set-frame-font "Hack 10" nil t)
(global-auto-revert-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(column-number-mode t)

(setq-default make-backup-files nil
	      backup-inhibited t
	      auto-save-default nil
	      inhibit-startup-screen t
	      initial-scratch-message ""
	      ring-bell-function 'ignore)

(require 'sgml-mode)
(add-hook 'js-mode-hook (lambda ()
			  (setq tab-width 2
				js-indent-level 2
				sgml-basic-offset 2
				sgml-attribute-offset 2
				indent-tabs-mode nil)
			  (local-set-key (kbd "RET") 'electric-indent-just-newline)))

(add-hook 'scss-mode-hook (lambda ()
			    (setq tab-width 2
				  css-indent-offset 2
				  indent-tabs-mode nil)))

(add-to-list 'auto-mode-alist '("\\.cs" . (lambda ()
                                            (setq tab-width 4
                                                  indent-tabs-mode t))))

(when (eq system-type 'windows-nt)
  (defun run-bash ()
    (interactive)
    (let ((shell-file-name "C:\\Program Files\\Git\\bin\\bash.exe"))
      (shell "*bash*"))))
