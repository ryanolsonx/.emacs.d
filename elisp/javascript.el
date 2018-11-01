(add-to-list 'magic-mode-alist '("input.*react" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(defun setup-tide-for-javascript ()
  (interactive)
  (tide-setup)
  (eldoc-mode +1)
  (company-mode +1)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(
					      save
					      mode-enabled
					      new-line
					      idle-change)))

(add-hook 'js2-mode-hook #'setup-tide-for-javascript)
(add-hook 'rjsx-mode-hook #'setup-tide-for-javascript)
  
