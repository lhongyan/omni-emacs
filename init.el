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
        helm
        magit
        ace-jump-mode
        rainbow-delimiters
        multiple-cursors
        simpleclip
        switch-window
        color-theme-sanityinc-tomorrow
        evil
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
    :init
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
    ;; indent setting
    (setq default-tab-width 4)
    (setq default-indent-tabs-mode nil)
    (electric-indent-mode nil)
    ;; cursor style like "|"
    (setq-default cursor-type 'bar)
    ;; close tool bar
    (tool-bar-mode -1)
    ;; close menu bar
    (menu-bar-mode -1)
    ;; high line
    (global-hl-line-mode 1)
    ;; open selection delete mode
    (delete-selection-mode 1)
    ;; window size and position
    (set-frame-width (selected-frame) 150)
    (set-frame-height (selected-frame) 50)
    (set-frame-position (selected-frame) 500 200)
    ;; recent file
    (recentf-mode t)
    (setq recentf-max-menu-item 10)
    (global-undo-tree-mode)
    ;; theme
    (load-theme 'sanityinc-tomorrow-eighties t)
    :bind
    ("C-x C-r" . recentf-open-files)
    :if (display-graphic-p)
    :init (scroll-bar-mode -1)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package evil
    :ensure t
    :defer t
    :init  
    (evil-mode)
    ;; remove all keybindings from insert-state keymap
    (setcdr evil-insert-state-map nil) 
    ;; remove all keybindings from insert-state keymap
    (define-key evil-insert-state-map [escape] 'evil-normal-state)
    ;; Use j/k to move one visual line insted of gj/gk
    (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    ;; remove default evil-toggle-key C-zã€‚ defaultï¼ŒEmacs use C-z hang up itself
    (setq evil-toggle-key "")
    :config
    (evil-mode 1)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; active company
(use-package company
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
;;;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helm
    :ensure t
    :defer t
    :init
    (setq helm-M-x-fuzzy-match t)
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-recentf-fuzzy-match t)
    (require 'helm-config)
    :bind 
    ("M-x" . helm-M-x)
    ("C-x C-b" . helm-buffers-list)
    ("C-x b" . helm-buffers-list)
    :config
    (helm-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Org Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org 
    :defer t
    :init
    (setq org-startup-indented t)
    (setq org-todo-keywords
        (quote (
                (sequence "TODO(t)" "DONE(d)" "HOLD(h)" "CANCELLED(c)")
                (sequence "CALL/MAIL(p)" "WAITING(w)" "AGENDA(a)" "MEETING(m)")
                (sequence "BUG(b)" "FIX(f)")
            )
        )
    )
    (setq org-todo-keyword-faces
        (quote (("TODO" . (:foreground "white"  :weight bold))
            ("DONE" . (:foreground "forest green" :weight bold))
            ("HOLD" . (:foreground "magenta" :weight bold))
            ("CANCELLED" . (:foreground "red" :weight bold))
            ("CALL" . (:foreground "blue" :weight bold))
            ("WAITING" . (:foreground "orange" :weight bold))
            ("AGENDA" . (:foreground "orange" :weight bold))
            ("MEETING" . (:foreground "yello" :weight bold))
            ("MAIL" . (:foreground "purple" :weight bold))))
    )
    (setq org-startup-indented t)
    (setq org-tag-alist '(
        ("HOLD" . ?h)
        ("CANCEL" . ?c)
        ("CALL" . ?l)
        ("EMAIL" . ?e)
        ("WAITING" . ?w)
        ("AGENDA" . ?a)
        ("METTING" . ?m)
    ))
    (setq org-bullets-bullet-list '("☰" "☲" "☱" "☴" "☵" "☶" "☳" "☷"))
    (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode t)))
    (setq org-agenda-files 
        (list 
            "./agenda/agenda.org"
            "./agenda/anywhere.org"
            "./agenda/all-mail.org"
            "./agenda/company.org"
            "./agenda/computer.org"
            "./agenda/errands.org"
            "./agenda/home.org"
            "./agenda/maybe.org"
            "./agenda/shopping.org"
            "./agenda/waiting-for.org"
        )
    )
    :bind
    ("\C-c l" . org-store-link)
    ("\C-c a" . org-agenda)
    ("\C-c b" . org-iswitchb)
    :config
    (org-mode)
    (auto-image-file-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; multiple-cursors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package multiple-cursors
    :defer t
    :bind
    ("C-S-c C-S-c" . mc/edit-lines)
    ("C->" . mc/mark-next-like-this)
    ("C-<" . mc/mark-previous-like-this)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; system clipboard
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
;;;; switch window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package switch-window
    :defer t
    :bind
    ("C-x o" . switch-window)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ace-jump-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ace-jump-mode
    :defer t
    :bind
    ("C-;" . ace-jump-mode)
    ("M-g l" . ace-jump-line-mode)
    ("M-g c" . ace-jump-char-mode)
    ("M-g w" . ace-jump-word-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; rainbow-delimiters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rainbow-delimiters
    :defer t
    :config
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; popwin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package popwin
    :defer t
    :config
    (popwin-mode +1))

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
