;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Package Manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(require 'cl)

;; Add Packages
(defvar my/packages '(
		    company
		    smex
            goto-chg
		    evil
		    which-key
            json-mode
            linum-relative
            ace-jump-mode
        ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

;;;;
(provide 'init-package)
