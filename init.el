;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
        helm
        expand-region
        ace-jump-mode
        simpleclip
        switch-window
        which-key
        company
        yasnippet
        json-mode
        multiple-cursors
        projectile
        disable-mouse
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; style and action
(use-package emacs
    :defer t
    :init
    ;; window size and position
    (set-frame-width (selected-frame) (string-to-number (getenv "EMACS_FRAME_WIDTH")))
    (set-frame-height (selected-frame) (string-to-number (getenv "EMACS_FRAME_HEIGHT")))
    (set-frame-position (selected-frame) (string-to-number (getenv "EMACS_FRAME_POSITION_LEFT")) (string-to-number (getenv "EMACS_FRAME_POSITION_RIGHT")))
    (cua-mode t)
    ;; close tool bar
    (tool-bar-mode -1)
    ;; close menu bar
    (menu-bar-mode -1)
    ;; close eldoc
    (global-eldoc-mode -1)
    ;; open selection delete mode
    (delete-selection-mode 1)
    ;; theme
    (load-theme 'gruvbox t)
    ;; frame title
    (setq frame-title-format '("" "MEmacs"))
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
    ;; cursor style like "|"
    (setq-default cursor-type 'bar)
    ;; solve kill ring is empty
    (setq select-enable-primary t)
    ;; English Font
    (set-face-attribute 'default nil :font (getenv "EMACS_ENGLISH_FONT"))
    ;; Chinese Font
    (dolist 
        (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family (getenv "EMACS_CHINESE_FONT") :size (string-to-number (getenv "EMACS_CHINESE_FONT_SIZE"))))
    )
    :if (display-graphic-p)
    :init (scroll-bar-mode -1)
)

;; encoding
(use-package emacs
    :init
    (set-language-environment 'Chinese-GB)
    (set-default buffer-file-coding-system 'utf-8-unix)
    (set-default-coding-systems 'utf-8-unix)
    (setq-default pathname-coding-system 'euc-cn)
    (setq file-name-coding-system 'euc-cn)
    (prefer-coding-system 'cp950)
    (prefer-coding-system 'gb2312)
    (prefer-coding-system 'cp936)
    (prefer-coding-system 'utf-16)
    (prefer-coding-system 'utf-8-dos)
    (prefer-coding-system 'utf-8-unix)
)

;; functions and bindings
(use-package emacs
    :defer t
    :init
    ;; copy region
    (defun c_r_o_w_l()
        (interactive)
        (if mark-active (simpleclip-copy (region-beginning) (region-end))
            (progn (simpleclip-copy (line-beginning-position) (line-end-position))
                (message "copied line")
            )
        )
    )
    ;; cut region
    (defun k_r_o_w_l()
        (interactive)
        (if mark-active (simpleclip-cut (region-beginning) (region-end))
            (progn (simpleclip-cut (line-beginning-position) (line-end-position))
                (message "killed line")
            )
        )
    )
    ;; open config
    (defun open-config-dir()
        (interactive)
	    (find-file (getenv "EMACS_CONFIG_DIR"))
    )
    ;; open jianguoyun
    (defun open-jianguoyun()
        (interactive)
	    (find-file (getenv "JIANGUOYUN_DIR"))
    )
    ;; open diary
    (defun organized-my-life()
        (interactive)
        (setq month (concatenate "\\" (format-time-string "%m" (current-time)) "月" "\\"))
        (setq day  (concatenate (format-time-string "%d" (current-time)) "日" "\\"))
        (find-file (concatenate 'string (getenv "OML_DIR") month day "oml.org"))
    )
    :bind
    ("M-w" . c_r_o_w_l)
    ("C-w" . k_r_o_w_l)
    ("<f5> c" . open-config-dir)
    ("<f5> j" . open-jianguoyun)
    ("<f5> o" . organized-my-life)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; expand region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package expand-region
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
;;;; quick jump
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ace-jump-mode
    :bind
    ("M-g w" . ace-jump-word-mode)
    ("M-g c" . ace-jump-char-mode)
    ("M-g l" . ace-jump-line-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; simpleclip
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package simpleclip
    :init
    (global-set-key (kbd "M-w") nil)
    :config
    (simpleclip-mode)
    :bind 
    ("M-w" . simpleclip-copy)
    ("C-w" . simpleclip-cut)
    ("C-y" . simpleclip-paste)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; recentf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package recentf
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
    :bind
    ("C-x o" . switch-window)
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
;;;; multiple-cursors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package multiple-cursors
    :defer t
    :bind
    ("C->" . mc/mark-next-like-this)
    ("C-<" . mc/mark-previous-like-this)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; disable-mouse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package disable-mouse
    :config
    (global-disable-mouse-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; projectile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package projectile
    :defer t
    :config
    (projectile-mode +1)
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
;;;; Org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org 
    :ensure t
    :defer t
    :init
    (setq org-startup-indented nil)
    (setq org-export-backends (quote (ascii html icalendar latex md)))
    :config
    ;; 使用 M-x org-insert-src-block 插入源码块
    (defun org-insert-src-block (src-code-type)
        (interactive
            (let 
                (
                    (src-code-types
                        '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
                            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
                            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
                            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
                            "scheme" "sqlite"
                        )
                    )
                )
                (list (ido-completing-read "Source code type: " src-code-types))
            )
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
    :bind
    ("C-c l" . org-store-link)
    ("C-c a" . org-agenda)
    ("C-c b" . org-iswitchb)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; markdown
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package markdown-mode
    :defer t
    :bind
    ("C-c k" . markdown-move-up)
    ("C-c j" . markdown-move-down)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; json Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package json-mode
    :defer t
    :config
    (defun json-pretty()
        (interactive)
        (json-pretty-print-buffer)
    )
    (defun json-minify()
        (interactive)
        (message "还没有开发...")   
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; show startup time
(add-hook 'emacs-startup-hook 
    (lambda () 
        (message "Emacs ready in %s with %d garbage collections." 
            (format "%.2f seconds" 
                (float-time (time-subtract after-init-time before-init-time))
            ) 
            gcs-done
        )
    )
)

(provide 'init)
