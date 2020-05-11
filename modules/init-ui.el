;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 外观 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
	:init
	;; 设置标题
	;(setq frame-title-format '("" "OmniEmacs"))
	;; 关闭备份
	(setq make-backup-files nil)
	;; 关闭自动保存
	(setq auto-save-default nil)
	;; 关闭提示声音
	(setq ring-bell-function 'ignore)
	;; 关闭响铃
	(setq visible-bell nil)
	;; solve kill ring is empty
	(setq select-enable-primary t)
	;; 关闭首页
	;(setq inhibit-splash-screen t)
	;; 关闭起动时闪屏
	(setq inhibit-startup-message t)
)

(use-package emacs
    :init
	;; 关闭工具栏
	(tool-bar-mode -1)
	;; 关闭菜单栏
	(menu-bar-mode -1)
	;; 关闭滚动条
	(scroll-bar-mode -1)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-ui)
