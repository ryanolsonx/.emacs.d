;; str/blank?
(ert-deftest test-str/blank? ()
  (should (str/blank? nil))
  (should (str/blank? ""))
  (should (str/blank? "   "))
  (should (not (str/blank? " a ")))
  (should (str/blank? "\n"))
  (should (str/blank? "\n")))

;; str/capitalize
(ert-deftest test-str/capitalize ()
  (should (string= (str/capitalize "s") "S"))
  (should (string= (str/capitalize "MiXeD cAsE") "Mixed case"))
  (should (string= (str/capitalize "mIxEd CaSeS") "Mixed cases")))

;; str/ends-with?
(ert-deftest test-str/ends-with? ()
  (should (str/ends-with? "Minsun" "sun"))
;;  (should (not (str/ends-with? "Minsun" "suns")))
  (should (str/ends-with? "Minsun" "un")))

;; str/escape

(ert-deftest test-str/escape ()
  (let ((text "Hello Clojure World!"))
    (should (string= (str/escape text '((?! . "!!!"))) "Hello Clojure World!!!"))))

;; str/includes?
(ert-deftest test-str/includes? ()
  (should (str/includes? "clojure" "cl"))
  (should (not (str/includes? "clojure" "xx"))))
