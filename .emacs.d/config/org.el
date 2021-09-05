
;; Make org-mode start up indented
(setq org-startup-indented t)

;; Make org-mode be visual line mode by default
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)

;; http://pragmaticemacs.com/emacs/highlight-latex-text-in-org-mode/
(setq org-highlight-latex-and-related '(latex))

;; Put a timestamp in org-mode TODOs
(setq org-log-done "time")

;; Make the asterisks more attractive
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))
