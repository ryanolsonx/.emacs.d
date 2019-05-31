(package-initialize)

;; Syntax highlighting off
(global-font-lock-mode -1)
(global-auto-revert-mode t)
(delete-selection-mode t)

(setq make-backup-files nil
      backup-inhibited t
      auto-save-default nil
      standard-indent 2
      tab-width 2
      indent-tabs-mode nil
      inhibit-startup-screen t
      initial-scratch-message ""
      ring-bell-function 'ignore)

(add-hook 'js-mode-hook (lambda () (setq js-indent-level 2)))

(add-hook 'scss-mode-hook (lambda () (setq css-indent-offset 2)))

(add-to-list 'auto-mode-alist '("\\.cs" . (lambda ()
                                            (setq tab-width 4
                                                  indent-tabs-mode t))))

(defun insert-template (templateFilePath)
  "Insert a template skeleton from a file path"
  (interactive (list (read-file-name "Template File Path: " "~/.emacs/templates/")))
  (insert-file-contents templateFilePath))

(global-set-key (kbd "C-c t") 'insert-template)

(defun run-bash ()
  (interactive)
  (let ((shell-file-name "C:\\Program Files\\Git\\bin\\bash.exe"))
    (shell "*bash*")))

(defun run-cmd ()
  (interactive)
  (let ((shell-file-name "cmd.exe"))
    (shell "*cmd.exe*")))
