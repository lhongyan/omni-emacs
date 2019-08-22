;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Change Emacs Default Setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; no backup
(setq make-backup-files nil)

;; open selection mode
(delete-selection-mode 1)

;; recent file
(recentf-mode 1)

;;; indent setting
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(electric-indent-mode nil)

;;设置默认读入文件编码
(prefer-coding-system 'utf-8)

;;设置写入文件编码
(setq default-buffer-file-coding-system 'utf-8)

;;;;
(provide 'init-better-defaults)
