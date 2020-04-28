;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 状态栏
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package spaceline-config
	:init
	(setq powerline-default-separator 'arrow-fade)
	(setq winum-auto-setup-mode-line nil)
	:config
	(spaceline-spacemacs-theme)
	(spaceline-toggle-minor-modes-off)
	(spaceline-toggle-buffer-size-off)
	;;(spaceline-toggle-major-mode-off)
	(spaceline-toggle-selection-info-off)
	(spaceline-toggle-helm-number-on)
	(spaceline-toggle-helm-help-off)
	(spaceline-toggle-buffer-position-off)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-modeline)