;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; define variable
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 路径
(setq EMACS_CONFIG_DIR "~/Documents/坚果云/MEmacs")
(setq JIANGUOYUN_DIR "~/Documents/坚果云/")
(setq OML_DIR "~/Documents/坚果云/晨间日记/")

;; yasnippet snippets path
(setq yas-snippet-dirs '(
    ;; my snippets
    "~/Documents/坚果云/MEmacs/snippets"
    ;; https://github.com/AndreaCrotti/yasnippet-snippets
    "~/Documents/Github/yasnippet-snippets/snippets"
))

;; use deft manage snippets
(setq deft-directory "~/Documents/坚果云/SnippetsHub")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(use-package gruvbox-theme
;    :config
;    (load-theme 'gruvbox-light-medium t)
;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; style and action
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
    :defer 2
    :init
    ;; English Font
    (set-face-attribute 'default nil :font "Menlo 14")
    ;; Chinese Font
    (dolist 
        (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "STKaiTi" :size 16))
    )
    ;; window size and position
    (set-frame-position (selected-frame) 300 150)
    ;; close tool bar
    (tool-bar-mode -1)
    ;; close menu bar
    (menu-bar-mode -1)
	;; close scroll
	(scroll-bar-mode -1)
    ;; close eldoc
    (global-eldoc-mode -1)
	;; window width
	(set-frame-width (selected-frame) 150)
	;; window height
	(set-frame-height (selected-frame) 50)
    ;; column
    (column-number-mode 1)
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
    ;; solve kill ring is empty
    (setq select-enable-primary t)
    :if (display-graphic-p)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
    :defer 2
    :init
    ;; open config
    (defun open-config-dir()
        (interactive)
	    (find-file EMACS_CONFIG_DIR)
    )
    ;; open jianguoyun
    (defun open-jianguoyun()
        (interactive)
	    (find-file JIANGUOYUN_DIR)
    )
    :bind
    ("<f5> c" . open-config-dir)
    ("<f5> j" . open-jianguoyun)
    ("<f5> o" . organized-my-life)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load base
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-core
    :defer 1
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load write
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-write
    :defer 2
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; load code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package init-code
    :defer 2
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-mac
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-mac)
