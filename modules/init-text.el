;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 文本操作
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package drag-stuff 
    :bind (
        ("<M-up>". drag-stuff-up) 
        ("<M-down>" . drag-stuff-down)
    )
)

(delete-selection-mode t)

(use-package expand-region
    :bind
    ("C-= =" . er/expend-region)
    ("C-= w" . er/mark-word)
    ("C-= u" . er/mark-url)
    ("C-= d" . er/mark-defun)
    ("C-= s" . er/mark-sentence)
    ("C-= p" . er/mark-paragraph)
    ;; ()
    ("C-= i p" . er/mark-inside-pairs)
    ("C-= o p" . er/mark-outside-pairs)
    ;; "" ''
    ("C-= i q" . er/mark-inside-quotes)
    ("C-= o q" . er/mark-outside-quotes)
)


(defun er/mark-inside-square-brackets ()
    "Mark inside square brackets (as defined by the mode), not including the square brackets."
    (interactive)
    (progn
        (isearch-backward "[")
        (forward-char)
        (set-mark-command)
        (isearch-forward "]")
        (backward-char)
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-text)