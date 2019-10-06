
;; go get -u github.com/nsf/gocode
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u github.com/rogpeppe/godef
;; go get -u golang.org/x/lint/golint
;; go get -u golang.org/x/tools/cmd/guru

;; Can't we use company instead?
;(use-package go-autocomplete)

(use-package go-mode
  :init
  (progn
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    ;(add-hook 'go-mode-hook #'gofmt-before-save)
    ;; Man, goimports is amazing!
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)))

(use-package golint)

(use-package go-guru
  :init (setq shell-command-switch "-c"))

