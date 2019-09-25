;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; package manager
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

;; Packages
(defvar my/packages '(
        use-package
        company
        which-key
        simpleclip
        spacemacs-theme
        yasnippet
        expand-region
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
    :defer t
    :init
    ;; cursor style like "|"
    (setq-default cursor-type 'bar)
    ;; close tool bar
    (tool-bar-mode -1)
    ;; close menu bar
    (menu-bar-mode -1)
    ;; close eldoc
    (global-eldoc-mode -1)
    ;; open selection delete mode
    (delete-selection-mode 1)
    ;; theme
    (load-theme 'spacemacs-dark t)
    ;; frame title
    (setq frame-title-format '("" "Emacs " emacs-version))
    ;; no backup
    (setq make-backup-files nil)
    ;; close home page
    (setq inhibit-splash-screen t)
    ;; close auto save
    (setq auto-save-default nil)
    ;; close bibi voice
    (setq ring-bell-function 'ignore)
    ;; close bell
    (setq visible-bell nil)
    ;; tab size
    (setq default-tab-width 4)
    ;; indent
    (setq default-indent-tabs-mode nil)
    :config
    ;; read encode
    (prefer-coding-system 'utf-8)
    ;;write encode
    (setq default-buffer-file-coding-system 'utf-8)
)

(use-package emacs
    :defer t
    :if (display-graphic-p)
    :init (scroll-bar-mode -1)
)

(use-package emacs
    :defer t
    :init
    (defun c_r_o_w_l()
        (interactive)
        (if mark-active (simpleclip-copy (region-beginning) (region-end))
            (progn
                (simpleclip-copy (line-beginning-position) (line-end-position))
                (message "copied line")
            )
        )
    )
    (defun k_r_o_w_l()
        (interactive)
        (if mark-active (simpleclip-cut (region-beginning) (region-end))
            (progn
                (simpleclip-cut (line-beginning-position) (line-end-position))
                (message "killed line")
            )
        )
    )
    :bind
    ("M-w" . c_r_o_w_l)
    ("C-w" . k_r_o_w_l)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
    :defer t
    :ensure t
    :init
    (setq company-dabbrev-ignore-case nil)
    (setq company-dabbrev-code-ignore-case nil)
    (setq company-dabbrev-downcase nil)
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 3)
    :config
    (global-company-mode)
    (define-key company-active-map [tab] nil)
    (define-key company-active-map (kbd "TAB") nil)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; which key
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key
    :defer t
    :ensure t
    :init
    (setq which-key-separator " -> " )
    (setq which-key-special-keys nil)
    (setq which-key-idle-delay 0.5)
    (setq which-key-idle-secondary-delay 0.05)
    :config
    (which-key-mode 1)
    (which-key-setup-minibuffer)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Org Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org 
    :defer t
    :init
    (setq org-startup-indented t)
    (setq org-src-fontify-natively t)
    :bind
    ("C-c l" . org-store-link)
    ("C-c a" . org-agenda)
    ("C-c b" . org-iswitchb)
    :config
    (org-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package yasnippet
    :defer t
    :init
    (setq yas-snippet-dirs '("D:/学习项目/awesome-emacs/snippets"))
    :config
    (yas-global-mode 1)
    (yas-reload-all)
    (add-hook 'prog-mode-hook #'yas-minor-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; expand region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package expand-region
    :defer t
    :bind
    ("C-= =" . er/expand-region)
    ("C-= w" . er/mark-word)
    ("C-= s" . er/mark-symbol)
    ("C-= i q" . er/mark-inside-quotes)
    ("C-= o q" . er/mark-outside-quotes)
    ("C-= i p" . er/mark-inside-pairs)
    ("C-= o p" . er/mark-outside-pairs)
    ("C-= c" . er/mark-comment)
    ("C-= u" . er/mark-url)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ace jump
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ace-jump-mode
    :defer t
    :bind
    ("C-' w" . ace-jump-word-mode)
    ("C-' c" . ace-jump-char-mode)
    ("C-' l" . ace-jump-line-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; simpleclip
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package simpleclip
    :defer t
    :config
    (simpleclip-mode)
    :bind 
    ("C-w" . simpleclip-cut)
    ("C-y" . simpleclip-paste)
    ("M-w" . simpleclip-copy)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; recentf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package recentf
    :defer t
    :init
    (setq recentf-max-menu-item 10)
    :config
    (recentf-mode t)
    :bind
    ("C-x C-r" . recentf-open-files)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; switch-window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package switch-window
    :defer t
    :bind
    ("C-x o" . switch-window)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; show startup time
(add-hook 'emacs-startup-hook 
(lambda () 
    (message "Emacs ready in %s with %d garbage collections." 
        (format "%.2f seconds" 
            (float-time 
                (time-subtract after-init-time before-init-time))) 
    gcs-done)
))

(provide 'init)
