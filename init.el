;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; use-package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq
    package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/"))
    package-archive-priorities '(("melpa" . 1)))

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; change default
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; no backup
(setq make-backup-files nil)

;; open selection mode
(delete-selection-mode 1)

;; recent file
(recentf-mode 1)

;; indent setting
(setq default-tab-width 4)
(setq default-indent-tabs-mode nil)
(electric-indent-mode nil)

;; close auto save
(setq auto-save-default nil)

;; close bibi voice
(setq ring-bell-function 'ignore)

;; close bell
(setq visible-bell nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; UI 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; close tool bar
(tool-bar-mode -1)

;; close scroll bar
(scroll-bar-mode -1)

;; close menu bar
(menu-bar-mode -1)

;; cursor style like "|"
(setq-default cursor-type 'bar)

;; close home page
(setq inhibit-splash-screen t)

;; window size
(set-frame-width (selected-frame) 150)
(set-frame-height (selected-frame) 50)

;; window position
(set-frame-position (selected-frame) 500 200)

;; time
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; high line
(global-hl-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key global-map (kbd "C-x C-r") 'recentf-open-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; enhance emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; start the rainbow mode automatically
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; show startup time
(add-hook 'emacs-startup-hook 
(lambda () 
    (message "Emacs ready in %s with %d garbage collections." 
        (format "%.2f seconds" 
            (float-time 
                (time-subtract after-init-time before-init-time))) 
    gcs-done)
))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; better move
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
;;;; multiple-cursors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package multiple-cursors
    :defer t
    :bind (
        ("C-S-c C-S-c" . mc/edit-lines)
        ("C->" . mc/mark-next-like-this)
        ("C-<" . mc/mark-previous-like-this)
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; system clipboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package simpleclip
    :defer t
    :config
    (simpleclip-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; switch window
;;;; use switch-window-mode quick switch window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package switch-window
    :defer t
    :bind
    ("C-x o" . switch-window)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; active company
(use-package company
    :defer t
    :ensure t
    :diminish company-mode
    :commands company-mode
    :config
    (global-company-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; which key
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key
    :init
    (setq which-key-separator " -> " )
    (setq which-key-special-keys nil)
    :config
    (which-key-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helm
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
    (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
    :bind
    ("\C-c l" . org-store-link)
    ("\C-c a" . org-agenda)
    ("\C-c b" . org-iswitchb)
    :config
    (org-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; activate undo-tree, evil require undo-tree.el
(use-package undo-tree
    :init (undo-tree-mode)
)

;; Evil requires the goto-chg.el package which provides the functions goto-last-change and goto-last-change-reverse
(use-package goto-chg)

;; evil
(use-package evil
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
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package magit
    :defer t
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init)
