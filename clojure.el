;; -*- lexical-binding: t -*-

(defun str/blank? (s)
  "Is a string blank?"
  (cond ((not s) t)
        ((string= "" (string-trim s)) t)
        (t nil)))

(defun str/capitalize (s)
  (if (< (length s) 2)
      (upcase s)
    (concat (upcase (substring s 0 1))
            (downcase (substring s 1 (length s))))))

(defun str/ends-with? (s substr)
  (let* ((s "xyz")
         (substr "yz")
         (start (- (length s) (length substr)))
         (end (length s)))
    (string= (substring s start end) substr)))

(defun str/escape (s cmap)
  (let ((c (car cmap))
        (r (cdr cmap)))
    (replace-regexp-in-string (regexp-quote (char-to-string c)) r s)))

(defun str/includes? (s substr)
  (not (null (string-match-p (regexp-quote substr) s))))

(provide 'clojure)
