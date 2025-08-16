;;; wordy.el --- Wordy (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun calculate (left tokens)
  (if (null tokens)
    left
    (let ((operation (car tokens)))
      (cond
        ((string= operation "plus") (calculate (+ left (string-to-number (cadr tokens))) (drop 2 tokens)))
        ((string= operation "minus") (calculate (- left (string-to-number (cadr tokens))) (drop 2 tokens)))
        ((and (string= operation "multiplied") (string= (cadr tokens) "by")) (calculate (* left (string-to-number (caddr tokens))) (drop 3 tokens)))
        ((and (string= operation "divided") (string= (cadr tokens) "by")) (calculate (/ left (string-to-number (caddr tokens))) (drop 3 tokens)))
        (t (signal 'unknown-operation-one))))))

(defun answer (question)
  (unless (string= (substring question -1) "?") (signal 'syntax-error))
  (let ((tokens (split-string (substring question 0 -1))))
    (unless (string= (car tokens) "What") (signal 'unknown-operation-two))
    (unless (string= (cadr tokens) "is") (signal 'unknown-operation-three))
    (calculate (string-to-number (caddr tokens)) (drop 3 tokens))))


(provide 'wordy)
;;; wordy.el ends here

