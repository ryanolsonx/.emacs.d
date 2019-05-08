(load (concat user-emacs-directory "should-be-default.el"))
(load (concat user-emacs-directory "private.el"))

;;(global-font-lock-mode -1)

;; only show menu bar in GUI mode
(if (display-graphic-p)
  (menu-bar-mode t)
  (menu-bar-mode -1))

(set-default-font "Source Code Pro 16")

(blink-cursor-mode -1)
(which-key-mode)
(show-paren-mode)
(editorconfig-mode)
(delete-selection-mode t)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(exec-path-from-shell-initialize)

(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(require 'prettier-js)
(setq prettier-js-command "prettier-eslint")
(global-set-key (kbd "C-c f") 'prettier-js)

;; so that we can find prettier-eslint
(add-hook 'js2-mode-hook #'add-node-modules-path)
(add-hook 'rjsx-mode-hook #'add-node-modules-path)
(add-hook 'css-mode-hook #'add-node-modules-path)

(add-to-list 'magic-mode-alist '(".*import.*react" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(defun go-to-init ()
  "Open user init.el file"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(global-set-key (kbd "C-c i") 'go-to-init)

(global-set-key (kbd "C-j") 'avy-goto-char)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-c g") 'magit-status)

(defun insert-template (templateFilePath)
  "Insert a template skeleton from a file path"
  (interactive (list (read-file-name "Template File Path: " "~/.emacs/templates/")))
  (insert-file-contents templateFilePath))

(global-set-key (kbd "C-c t") 'insert-template)

(defun surround (begin end char)
  "Surround region with character"
  (interactive (list
		(region-beginning)
		(region-end)
		(read-char "char: " t)))
  (setq char (char-to-string char))
  (setq open char)
  (setq close
	(cond ((string= char "[") "]")
	      ((string= char "(") ")")
	      ((string= char "{") "}")
	      (t char)))
  (save-excursion
    (goto-char end)
    (insert close)
    (goto-char begin)
    (insert open)))

(global-set-key (kbd "C-c s") 'surround)

(require 'projectile)
(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
(projectile-global-mode)

(defun use-advanced-config ()
  "Load my FULL config. It starts out in a minimalistic mode."
  (interactive)
  (global-font-lock-mode t)
  ;;(load-theme 'monokai t)
  (global-company-mode)

  (require 'ivy)
  (ivy-mode)
  (setq ivy-use-virtual-buffers -1
	ivy-height 15
	ivy-count-format ""
	ivy-initial-inputs-alist nil
	ivy-re-builders-alist '((t . ivy--regex-ignore-order)))

  (setq projectile-completion-system 'ivy)
  (setq magit-completing-read-function 'ivy-completing-read)

  ;; (setq slack-buffer-emojify t)
  ;; (setq slack-prefer-current-team t)

  ;; (slack-register-team
  ;;  :name "SwipeClock"
  ;;  :default t
  ;;  :client-id private-slack-client-id
  ;;  :token private-slack-token
  ;;  :full-and-display-names t
  ;;  :subscribed-channels '(dev ess-dev manager-portal-dev))

  ;; (require 'slack)
  ;; (global-set-key (kbd "C-c s g") 'slack-group-select)
  ;; (global-set-key (kbd "C-c s u") 'slack-all-unreads)
  ;; (define-key slack-mode-map (kbd "C-c C-p") 'slack-buffer-goto-prev-message)
  ;; (define-key slack-mode-map (kbd "C-c C-n") 'slack-buffer-goto-next-message)
  ;; (define-key slack-mode-map (kbd "C-c C-k") 'kill-buffer)
  ;; (define-key slack-mode-map (kbd "C-c C-c") ":+1:")
  ;; (define-key slack-mode-map "@"
  ;;   (defun endless/slack-message-embed-mention ()
  ;;     (interactive)
  ;;     (call-interactively #'slack-message-embed-mention)
  ;;     (insert " ")))

  ;; (slack-start)
  


  (add-hook 'js2-mode-hook #'lsp)
  (add-hook 'rjsx-mode-hook #'lsp))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (js2-refactor ivy alert-termux slack add-node-modules-path prettier-js exec-path-from-shell avy projectile which-key rjsx-mode lsp-mode company editorconfig magit monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:underline t)))))
