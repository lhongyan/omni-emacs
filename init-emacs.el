;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Change Emacs Default Setting
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

;; set read file encoding
(prefer-coding-system 'utf-8)

;; set write file encoding
(setq default-buffer-file-coding-system 'utf-8)

;; start the rainbow mode automatically in most programming modes (Emacs 24 and above)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; close auto save
(setq auto-save-default nil)

;; close bibi voice
(setq ring-bell-function 'ignore)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Package Manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Package
(require 'init-package)

;; UI
(require 'init-ui)

;; Complete
(require 'init-complete)

;; Org Mode
(require 'init-org)

;; Vim
(require 'init-evil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-emacs)
