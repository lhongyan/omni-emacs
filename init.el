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
        evil
        simpleclip
        spacemacs-theme
        yasnippet
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
    ;; cursor style like "|"
    (setq-default cursor-type 'bar)
    ;; close tool bar
    (tool-bar-mode -1)
    ;; close menu bar
    (menu-bar-mode -1)
    ;; open selection delete mode
    (delete-selection-mode 1)
    (global-undo-tree-mode)
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
    ;; indent setting
    (setq default-tab-width 4)
    (setq default-indent-tabs-mode nil)
    :config
    ;; read encode
    (prefer-coding-system 'utf-8)
    ;;write encode
    (setq default-buffer-file-coding-system 'utf-8)
    (use-package switch-window
        :bind
        ("C-x o" . switch-window)
    )
    (use-package simpleclip
        :config
        (simpleclip-mode)
        :bind 
        ("C-w" . simpleclip-cut)
        ("C-y" . simpleclip-paste)
        ("M-w" . simpleclip-copy)
    )
    (use-package recentf
        :init
        ;; recent file
        (setq recentf-max-menu-item 10)
        :config
        ;; recent file
        (recentf-mode t)
    )
    :bind
    ("C-x C-r" . recentf-open-files)
    :if (display-graphic-p)
    :init (scroll-bar-mode -1)
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
    ;;("M-x" . helm-M-x)
    ("C-x C-b" . helm-buffers-list)
    ("C-x b" . helm-buffers-list)
    :config
    (helm-mode)
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
    ;;(setq org-bullets-bullet-list '("☰" "☲" "☱" "☴" "☵" "☶" "☳" "☷"))
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
    (defun org-insert-src-block (src-code-type)
        (interactive
            (let ((src-code-types
            '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
                "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
                "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
                "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
                "scheme" "sqlite")))
            (list (ido-completing-read "Source code type: " src-code-types)))
        )
        (progn
            (newline-and-indent)
            (insert (format "#+BEGIN_SRC %s\n" src-code-type))
            (newline-and-indent)
            (insert "#+END_SRC\n")
            (previous-line 2)
            (org-edit-src-code)
        )
    )
    (setq org-src-fontify-natively t)
    :bind
    ("\C-c l" . org-store-link)
    ("\C-c a" . org-agenda)
    ("\C-c b" . org-iswitchb)
    :config
    (org-mode)
    (auto-image-file-mode)
)

(use-package yasnippet
    :init
    (setq yas-snippet-dirs '("D:/学习项目/awesome-emacs/snippets"))
    :config
    (yas-global-mode 1)
    (yas-reload-all)
    (add-hook 'prog-mode-hook #'yas-minor-mode)
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
