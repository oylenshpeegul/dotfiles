
;; Make org-mode start up indented
(setq org-startup-indented t)

;; Make org-mode be visual line mode by default
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)

;; http://pragmaticemacs.com/emacs/highlight-latex-text-in-org-mode/
(setq org-highlight-latex-and-related '(latex))

;; Put a timestamp in org-mode TODOs
(setq org-log-done "time")

(use-package org2blog
  :bind (("C-c P" . org2blog/wp-post-buffer))
     ("C-c p" . org2blog/wp-post-buffer-and-publish)
  :init
  (progn)
  (require 'auth-source)
  (add-to-list 'auth-sources "~/.netrc")
  (let (credentials)
    (setq credentials (auth-source-user-and-password "wpblog"))
    (setq org2blog/wp-blog-alist
      `(("wordpress"
         :url "https://oylenshpeegul.wordpress.com/xmlrpc.php"
         :username ,(car credentials)
         :password ,(cadr credentials)))))
  (setq org2blog/wp-track-posts nil))

(use-package org-present)
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))

;; For org-ioslide
(use-package ox-ioslide)

;; For org-impress-js
(use-package ox-impress-js)

