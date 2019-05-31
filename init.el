(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-refresh-contents)
(package-initialize)

(setq is-windows (string-equal system-type "windows-nt"))

;; Syntax highlighting off
(global-font-lock-mode -1)

(if is-windows
    (set-frame-font "Consolas 16" nil t)
  (set-frame-font "Anonymous Pro-16" nil t))

(global-auto-revert-mode t)
(delete-selection-mode t)
(fringe-mode 0)
(tool-bar-mode -1)
(scroll-bar-mode -1)

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
  (interactive (list (read-file-name "Template File Path: " "~/.emacs.d/templates/")))
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

(defun require-package (package)
  (unless (package-installed-p package)
    (package-install package)))

(defun require-packages (packages)
  (mapc #'require-package packages))

(require-packages '(magit))

(global-set-key (kbd "C-c g") 'magit-status)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
