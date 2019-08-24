;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Vim
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; activate undo-tree, evil require undo-tree.el
(require 'undo-tree)
(undo-tree-mode 1)

;; Evil requires the goto-chg.el package which provides the functions goto-last-change and goto-last-change-reverse
(require 'goto-chg)

;; activate evil
(require 'evil)
(evil-mode 1)

;; remove all keybindings from insert-state keymap
(setcdr evil-insert-state-map nil)

;; use ESC or C-[ escape insert-mode to normal-mode
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; remove default evil-toggle-key C-z。 default，Emacs use C-z hang up itself
(setq evil-toggle-key "")

;; Use j/k to move one visual line insted of gj/gk
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-vim)
