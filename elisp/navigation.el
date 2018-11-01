(defun navigation-toggle-between-source-and-test ()
  (interactive)
  (let* ((is-in-test (navigation--is-in-test buffer-file-name))
	 (next-file-path (if is-in-test
			     (navigation--get-file-name-for-source buffer-file-name)
			   (navigation--get-file-name-for-test buffer-file-name))))
    (find-file next-file-path)))

(defun navigation--is-in-test (buffer-file-name)
  (let* ((result (cl-search "test" buffer-file-name)))
    (if result
	t
	nil)))

(defun navigation--get-file-name-for-test (buffer-file-name)
  "Given a buffer-file-name, it should return the same file name ending in test.js instead of .js"
  (concat (navigation--without-extension buffer-file-name) ".test.js"))

(defun navigation--get-file-name-for-source (buffer-file-name)
  "Given a buffer-file-name, it should return the same file name ending in test.js instead of .js"
  (concat (navigation--without-extension (navigation--without-extension buffer-file-name)) ".js"))

(defun navigation--without-extension (path)
  (combine-and-quote-strings (butlast (split-string path "\\.")) "."))

(provide 'navigation)
