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
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t))

(package-initialize)

(global-company-mode +1)
(which-key-mode)
(editorconfig-mode +1)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'lsp-mode)
(add-hook 'js-mode-hook #'lsp)

(require 'flycheck)
(flycheck-add-mode 'javascript-eslint 'js-mode)
(add-hook 'js-mode-hook #'flycheck-mode)

(add-hook 'js-mode-hook #'add-node-modules-path)

(defun shell-command-with-file-name (command &optional output-buffer error-buffer)
  (interactive
   (list
    (read-shell-command "Shell command: " nil nil
			(let ((filename
			       (cond
				(buffer-file-name)
				((eq major-mode 'dired-mode)
				 (dired-get-filename nil t)))))
			  (and filename (file-relative-name filename))))
    current-prefix-arg
    shell-command-default-error-buffer))
  (shell-command (concat command " " buffer-file-name) output-buffer error-buffer))

(global-set-key (kbd "M-1") 'shell-command-with-file-name)

(global-set-key (kbd "C-c y f") (lambda ()
				  (interactive)
				  (shell-command-with-file-name "yarn format")))

(global-set-key (kbd "C-c n f") (lambda ()
				  (interactive)
				  (shell-command-with-file-name "npm run format")))

(custom-set-variables
 '(package-selected-packages
   '(add-node-modules-path editorconfig which-key company-lsp flycheck lsp-mode cider company magit paredit)))
(custom-set-faces
 )
