(load (concat user-emacs-directory "should-be-default.el"))

(setq initial-scratch-message "")

(load-theme 'monokai t)
(set-default-font "Source Code Pro 16")
(global-company-mode)

(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-global-mode)

(which-key-mode)
(exec-path-from-shell-initialize)
(show-paren-mode)
(editorconfig-mode)
(yas-global-mode)
(global-set-key (kbd "C-c s") 'yas-insert-snippet)
(global-set-key (kbd "C-j") 'avy-goto-char)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'prettier-js)
(setq prettier-js-command "prettier-eslint")
(global-set-key (kbd "C-c f") 'prettier-js)

(global-set-key (kbd "C-c g") 'magit-status)

(defun go-to-init ()
  "Open user init.el file"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(global-set-key (kbd "C-c i") 'go-to-init)

;; if the file imports react, use rjsx mode
(add-to-list 'magic-mode-alist '("import.*react" . rjsx-mode))
;; otherwise, use js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook #'lsp)
(add-hook 'rjsx-mode-hook #'lsp)

(add-hook 'js2-mode-hook #'add-node-modules-path)
(add-hook 'rjsx-mode-hook #'add-node-modules-path)
(add-hook 'css-mode-hook #'add-node-modules-path)

;; for snippets
(defun ro-get-file-name ()
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))

(defun ro-get-file-name-camelcase ()
  (from-pascal-to-camelcase (ro-get-file-name)))

(defun from-pascal-to-camelcase (str)
  (setq first (downcase (substring str 0 1)))
  (setq rest (substring str 1 (length str)))
  (concat first rest))

(defun convert-vscode-snippet ()
  "Convert VS Code snippet pasted into a buffer. It should include prefix, body, and description"
  (interactive)
  (setq prefix (get-keys-string-value "prefix"))
  (setq name (get-keys-string-value "description"))
  (get-rid-of-everything-but-body)
  (format-body)
  (add-snippet-header prefix name)
  (write-file (get-file-save-name name))
  (snippet-mode)
  (generate-new-buffer "*scratch*")
  (switch-to-buffer "*scratch*"))

(defun get-file-save-name (name)
  "Get a file friendly name for a snippet"
  (concat user-emacs-directory "snippets/rjsx-mode/"
	  (replace-regexp-in-string "[ |:]" "-" (downcase name))))

(defun add-snippet-header (prefix name)
  "Add the snippet header that outlines snippet triggers"
  (beginning-of-buffer)
  (insert "# -*- mode: snippet -*-\n")
  (insert (concat "# name: " name "\n"))
  (insert (concat "# key: " prefix "\n"))
  (insert "# --\n"))


(defun get-rid-of-everything-but-body ()
  "Kill everything except for the body contents (unformatted)"
  (goto-line 0)
  (setq pos (point))
  (search-forward "[")
  (set-mark pos)
  (kill-region (region-beginning) (region-end))
  (kill-line)
  (search-forward "],")
  (search-backward "\"")
  (forward-char)
  (setq pos (point))
  (end-of-buffer)
  (set-mark pos)
  (kill-region (region-beginning) (region-end)))

(defun format-body ()
  (goto-line 0)
  (setq more-lines t)
  (while more-lines
    (beginning-of-line)
    (search-forward "\"")
    (setq pos (point))
    (beginning-of-line)
    (set-mark pos)
    (kill-region (region-beginning) (region-end))
    (end-of-line)
    (setq pos (point))
    (search-backward "\"")
    (set-mark pos)
    (kill-region (region-beginning) (region-end))
    (setq more-lines (= 0 (forward-line 1)))))

(defun get-keys-string-value (key)
  "Get the string value of the key in this json"
  (goto-line 0)
  (search-forward key)
  (forward-char 4)
  (get-text-in-quotes))

(defun get-text-in-quotes ()
  "Assumes you are at the beginning of the quotes"
  (setq pos (point))
  (search-forward "\"")
  (backward-char)
  (set-mark pos)
  (delete-and-extract-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c C-c") 'convert-vscode-snippet)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet add-node-modules-path prettier-js exec-path-from-shell avy projectile which-key rjsx-mode lsp-mode company editorconfig magit monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
