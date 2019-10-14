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

(setq-default inhibit-splash-screen t
	      ring-bell-function 'ignore
	      auto-save-default nil
	      backup-inhibited t
	      initial-scratch-message ";; Hack away, my friend.\n\n")

(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "IBM Plex Mono 14" nil t)
(load-theme 'dracula 'noconfirm)

(savehist-mode +1)
(column-number-mode +1)
(delete-selection-mode +1)
(global-company-mode +1)
(which-key-mode)
(editorconfig-mode +1)
(show-paren-mode +1)

(global-set-key (kbd "C-x g") 'magit-status)

(defun setup-javascript ()
  "When opening a javascript file, set it up so that it uses a lot of nice things"
  )

(require 'lsp-mode)
(setq-default lsp-enable-snippet nil)
(add-hook 'js-mode-hook #'lsp)
(add-hook 'js-mode-hook (lambda ()
			  (local-set-key (kbd "M-.") 'xref-find-definitions)
			  (local-set-key [f2] 'lsp-rename)
			  (local-set-key [f5] (lambda ()
						(interactive)
						(revert-buffer t t)))
			  (local-set-key [f12] 'xref-find-definitions)))

(require 'flycheck)
(flycheck-add-mode 'javascript-eslint 'js-mode)
(add-hook 'js-mode-hook #'flycheck-mode)

(add-hook 'js-mode-hook #'add-node-modules-path)

(global-set-key (kbd "C-=") 'er/expand-region)

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
  (shell-command
   (replace-regexp-in-string "%" buffer-file-name command)
   output-buffer
   error-buffer))

(global-set-key (kbd "M-1") 'shell-command-with-file-name)

(global-set-key (kbd "C-c y f") (lambda ()
				  (interactive)
				  (shell-command-with-file-name "yarn format %")))

(global-set-key (kbd "C-c n f") (lambda ()
				  (interactive)
				  (shell-command-with-file-name "npm run format -- %")
				  (shell-command-with-file-name "npm run lint-fix -- %")
				  (revert-buffer t t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dracula-theme smex expand-region night-owl-theme add-node-modules-path editorconfig which-key company-lsp flycheck lsp-mode cider company magit paredit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
