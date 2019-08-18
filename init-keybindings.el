;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Keyboard Setting 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; open config setting
(defun open-my-config-file()
	(interactive)
	(find-file "C:\\Users\\unixman\\AppData\\Roaming\\.emacs")
)
(global-set-key (kbd "<f2> c") 'open-my-config-file)

(defun bh/switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))
(global-set-key (kbd "<f2> s") 'bh/switch-to-scratch)

;;;;
(provide 'init-keybindings)