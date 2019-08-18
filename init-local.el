;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; define local operation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; open config dir
(defun open-config-dir()
    (interactive)
    (find-file "/Users/unixman/Documents/github/emacs.d"))
(global-set-key (kbd "<f5> c") 'open-config-dir)

;; open jianguoyun
(defun open-jianguoyun()
    (interactive)
    (find-file "/Users/unixman/Documents/坚果云/Emacs")
)
(global-set-key (kbd "<f5> j") 'open-jianguoyun)

;; font
(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(tool-bar-mode nil))
(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(default ((t (:family "Source Code Pro For Powerline" :foundry "outline" :slant normal :weight normal :height 120 :width normal :size 14)))))

;;;;
(provide 'init-local)