(defun install-package-recursion (list)
  (when list
    (let (packaze (car list))
      (unless (package-installed-p packaze)
		(package-install packaze))
      (install-package-recursion (cdr list)))))

(if (fboundp 'package-install-selected-packages)
	(package-install-selected-packages)
  (install-package-recursion (identity package-selected-packages)))

(unless (file-exists-p (expand-file-name "site-lisp/my-packages.elc" user-emacs-directory))
  (byte-compile-file (expand-file-name "site-lisp/my-packages.el" user-emacs-directory)))
