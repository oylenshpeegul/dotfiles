;; Show/hide Emacs dired details in style
;; http://xenodium.com/showhide-emacs-dired-details-in-style/
(use-package dired
  :hook (dired-mode . dired-hide-details-mode)
  :config
  ;; Colourful columns.
  (use-package diredfl
    :ensure t
    :config
    (diredfl-global-mode 1)))

;; Show git info in Emacs dired 
;; https://github.com/clemera/dired-git-info
(with-eval-after-load 'dired
  (define-key dired-mode-map ")" 'dired-git-info-mode))
