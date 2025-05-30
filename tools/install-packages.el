(require 'cl-extra)
(defun exercism//install-required-packages ()
  (require 'package)
  (package-initialize)
  (let ((required-packages '(mustache ht string-inflection)))
    (when (not (cl-every #'package-installed-p required-packages))
      (add-to-list
       'package-archives '("gnu" . "https://elpa.gnu.org/packages/")
       t)
      (add-to-list
       'package-archives '("melpa" . "https://melpa.org/packages/")
       t)
      (package-refresh-contents)
      (dolist (pkg required-packages)
	(package-install pkg)))))
