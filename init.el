(global-font-lock-mode -1)
(column-number-mode t)
(savehist-mode)
(global-auto-revert-mode t)
(setq-default indent-tabs-mode nil
              tab-width 2
              js-indent-level 2
              css-indent-offset 2
              vc-follow-symlinks t)
(add-to-list 'auto-mode-alist '("\\.cs" . (lambda () (setq tab-width 4 indent-tabs-mode t))))
(add-hook 'js-mode-hook '(lambda () (local-set-key (kbd "M-.") 'xref-find-definitions)))

