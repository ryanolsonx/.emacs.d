(savehist-mode)
(global-auto-revert-mode t)
(setq-default indent-tabs-mode nil
              tab-width 2
              js-indent-level 2
              css-indent-offset 2)
(add-hook 'js-mode-hook '(lambda () (local-set-key (kbd "M-.") 'xref-find-definitions)))

