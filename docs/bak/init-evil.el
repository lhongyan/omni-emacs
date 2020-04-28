;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package evil
    :ensure t
    :init
    (evil-mode)
    ;; remove default evil-toggle-key C-z, manually setup later
    (setq evil-toggle-key "")
    ;; don't bind [tab] to evil-jump-forward
    (setq evil-want-C-i-jump nil)
    ;; remove all keybindings from insert-state keymap
    (setcdr evil-insert-state-map nil) 
    ;; remove all keybindings from insert-state keymap
    (define-key evil-insert-state-map [escape] 'evil-normal-state)
    ;; Use j/k to move one visual line insted of gj/gk
    (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-evil)
