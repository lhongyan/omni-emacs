;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Change Emacs Default Setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; open line mode
(global-linum-mode 1)

;; no backup
(setq-default make-backup-files -1)

;; open selection mode
(delete-selection-mode 1)

;; recent file
(recentf-mode 1)

;; close bell
(setq visible-bell -1)

;;; indent setting
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(electric-indent-mode -1)

;; cursor type
(setq-default cursor-type 'bar)

;;;;
(provide 'init-better-defaults)
