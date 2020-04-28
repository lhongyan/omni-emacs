;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; variable
;;;; Windows use setenv/getenv, because setenv/getenv is quickly
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; yasnippet snippets path
(setq yas-snippet-dirs '(
    ;; my snippets
    "C:\\Users\\unixman\\.emacs.d\\MEmacs\\snippets"
    ;; https://github.com/AndreaCrotti/yasnippet-snippets
    "C:\\Users\\unixman\\.emacs.d\\yasnippet-snippets\\snippets"
))

;; use deft manage my snippets
(setq deft-directory "D:\\Users\\unixman\\坚果云\\SnippetsHub\\")

;; pandoc
(setq markdown-command "D:\\software\\pandoc-2.9-windows-x86_64\\pandoc.exe")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; style and action
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
    :init
    ;; english Font
    (set-face-attribute 'default nil :font "Consolas 12")
    ;; chinese Font
    (dolist 
        (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "STKaiTi" :size 18))
    )
    (set-frame-width (selected-frame) 150)
    (set-frame-height (selected-frame) 40)
    ;; window size and position
    (set-frame-position (selected-frame) 300 200)
    ;; close tool bar
    (tool-bar-mode -1)
    ;; close menu bar
    (menu-bar-mode -1)
    ;; close eldoc
    (global-eldoc-mode -1)
    ;; column
    (column-number-mode 1)
    ;; frame title
    (setq frame-title-format '("" "MEmacs"))
    ;; no backup
    (setq make-backup-files nil)
    ;; close auto save
    (setq auto-save-default nil)
    ;; close bibi voice
    (setq ring-bell-function 'ignore)
    ;; close bell
    (setq visible-bell nil)
    ;; solve kill ring is empty
    (setq select-enable-primary t)
    ;; close home page
    (setq inhibit-splash-screen t)
    ;; 关闭起动时闪屏
    (setq inhibit-startup-message t)
    :if (display-graphic-p)
        :init (scroll-bar-mode -1)
    :config
    (use-package gruvbox-theme
        :config
        (load-theme 'gruvbox-dark-medium t)
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
    :defer 1
    :config
    ;; open config
    (defun open-config-dir()
        (interactive)
	    (find-file "C:\\Users\\unixman\\.emacs.d\\MEmacs")
    )
    ;; open jianguoyun
    (defun open-jianguoyun()
        (interactive)
	    (find-file "D:\\Users\\unixman\\坚果云")
    )
    :bind
    ("<f5> c" . open-config-dir)
    ("<f5> j" . open-jianguoyun)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load core
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-core
    :defer 1
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-evil
    :defer 1
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load write
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-write
    :defer 1
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-org
    :defer 1
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load macro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-macro
    :defer 1
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-win
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-win)

(add-hook 'emacs-startup-hook 
	(lambda () 
			(message "Emacs ready in %s with %d garbage collections." 
	              (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time))) 
	              gcs-done
	        )
	)
)