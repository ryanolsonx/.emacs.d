(defvar testing--last-test nil)

(defun testing-run-test ()
  (interactive)
  (when (testing--is-in-test buffer-file-name)
    (setq testing--last-test buffer-file-name))

  (when testing--last-test
    (testing--create-test-process testing--last-test)))

(defun testing--create-test-process (test-file-name)
  (let* ((cmd "yarn")
	 (file-name (testing--get-file-name test-file-name))
	 (args (concat "test " test-file-name))
	 (switches (split-string-and-unquote args))
	 (new-buffer-name (concat "testing " file-name))
	 (termbuf (apply 'make-term new-buffer-name cmd nil switches)))
    (set-buffer termbuf)
    (term-mode)
    (term-char-mode)
    (switch-to-buffer termbuf)))

(defun testing--get-file-name (buffer-file-name)
  (car (last (split-string buffer-file-name "/"))))

(defun testing--is-in-test (buffer-file-name)
  (cl-search "test" buffer-file-name))

(provide 'testing)
