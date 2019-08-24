;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Keyboard Setting 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; quick open scratch
(defun bh/switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))
(global-set-key (kbd "<f5> s") 'bh/switch-to-scratch)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-keybindings)