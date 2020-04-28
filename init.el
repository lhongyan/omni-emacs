;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(
        ("melpa" . "http://elpa.emacs-china.org/melpa/")
        ("gnu"   . "http://elpa.emacs-china.org/gnu/")
    )
))

(require 'cl)

;; package list
(defvar my/packages '(
        use-package
        helm
        company
        company-quickhelp
        expand-region
        simpleclip
        ace-window
        which-key
        yasnippet
        multiple-cursors
        projectile
        rainbow-delimiters
        youdao-dictionary
        markdown-mode
        deft
        disable-mouse
	neotree
    	
    	diminish
    	kaesar-file
        
        spaceline

        benchmark-init
        crux
        drag-stuff

	avy
        nyan-mode
        ;; code
        lsp-mode
        lsp-ui
        lsp-treemacs 
        company-lsp
        helm-lsp
        flycheck
        emmet-mode
	hydra
	smartparens
    ) 
    "Default packages"
)

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
            (package-install pkg)
        )
    )
)

;; use package config
(eval-and-compile 
    (setq use-package-always-demand nil)
    (setq use-package-expand-minimally t)
    (setq use-package-verbose t)
)

(setq gc-cons-threshold most-positive-fixnum)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 公用，但不必单独成文件的配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 编码
;(setq-default pathname-coding-system 'euc-cn)
(prefer-coding-system 'utf-8)
(setenv "LANG" "zh_CN.UTF-8")
(setenv "LC_ALL" "zh_CN.UTF-8")
(setenv "LC_CTYPE" "zh_CN.UTF-8")

(set-default-coding-systems 'utf-8) 
(set-terminal-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load custom
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package custom)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init)
