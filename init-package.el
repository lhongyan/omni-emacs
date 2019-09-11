
(require 'package)
(setq
 package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/"))
 package-archive-priorities '(("melpa" . 1)));; the package manager

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "/Users/unixman/.emacs.d/use-package")
  (require 'use-package))

(provide 'init-package)
