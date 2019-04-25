(load (concat user-emacs-directory "should-be-default.el"))
(load (concat user-emacs-directory "private.el"))

(setq initial-scratch-message "")

;;(load-theme 'monokai t)

;; syntax off
(global-font-lock-mode -1)

(set-default-font "Fira Mono 17")

;; enable modes
(global-company-mode)
(blink-cursor-mode -1)
(which-key-mode)
(show-paren-mode)
(editorconfig-mode)

(require 'ivy)
(ivy-mode)
(setq ivy-use-virtual-buffers -1
      ivy-height 15
      ivy-count-format ""
      ivy-initial-inputs-alist nil
      ivy-re-builders-alist '((t . ivy--regex-ignore-order)))

(require 'projectile)
(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
(setq projectile-completion-system 'ivy)
(projectile-global-mode)

;; init
(exec-path-from-shell-initialize)

(setq magit-completing-read-function 'ivy-completing-read)

(setq slack-buffer-emojify t)
(setq slack-prefer-current-team t)

(slack-register-team
 :name "SwipeClock"
 :default t
 :client-id private-slack-client-id
 :token private-slack-token
 :full-and-display-names t
 :subscribed-channels '(dev ess-dev manager-portal-dev))

(require 'slack)
(global-set-key (kbd "C-c s g") 'slack-group-select)
(global-set-key (kbd "C-c s u") 'slack-all-unreads)
(define-key slack-mode-map (kbd "C-c C-p") 'slack-buffer-goto-prev-message)
(define-key slack-mode-map (kbd "C-c C-n") 'slack-buffer-goto-next-message)
(define-key slack-mode-map (kbd "C-c C-k") 'kill-buffer)
(define-key slack-mode-map (kbd "C-c C-c") ":+1:")
(define-key slack-mode-map "@"
  (defun endless/slack-message-embed-mention ()
    (interactive)
    (call-interactively #'slack-message-embed-mention)
    (insert " ")))

(slack-start)

;; key bindings
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

;; hooks!

;; if the file imports react, use rjsx mode
(add-to-list 'magic-mode-alist '(".*import.*react" . rjsx-mode))
;; otherwise, use js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook #'lsp)
(add-hook 'rjsx-mode-hook #'lsp)

(add-hook 'js2-mode-hook #'add-node-modules-path)
(add-hook 'rjsx-mode-hook #'add-node-modules-path)
(add-hook 'css-mode-hook #'add-node-modules-path)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ivy alert-termux slack add-node-modules-path prettier-js exec-path-from-shell avy projectile which-key rjsx-mode lsp-mode company editorconfig magit monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
