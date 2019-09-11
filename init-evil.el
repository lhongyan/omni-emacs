;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; activate undo-tree, evil require undo-tree.el
(use-package undo-tree
    :defer t
    :init (undo-tree-mode)
)

;; Evil requires the goto-chg.el package which provides the functions goto-last-change and goto-last-change-reverse
(use-package goto-chg 
    :defer t    
)

;; evil
(use-package evil
    :defer t
    :init  
    (evil-mode)
    ;; remove all keybindings from insert-state keymap
    (setcdr evil-insert-state-map nil) 
    ;; remove all keybindings from insert-state keymap
    (define-key evil-insert-state-map [escape] 'evil-normal-state)
    ;; Use j/k to move one visual line insted of gj/gk
    (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    ;; remove default evil-toggle-key C-z。 default，Emacs use C-z hang up itself
    (setq evil-toggle-key "")
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-evil)
