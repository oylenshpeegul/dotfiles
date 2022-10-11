;; https://robert.kra.hn/posts/2021-02-07_rust-with-emacs/
(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status)
              ;; toggle inlay hints
              ("C-c C-c e" . lsp-rust-analyzer-expand-macro)
              ;; toggle inlay hints
              ("C-c C-c t" . lsp-rust-analyzer-inlay-hints-mode))
  :config)
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)    

  ;; To do less when your cursor moves
  ;; (setq lsp-signature-auto-activate nil)
  ;; (setq lsp-enable-symbol-highlighting nil))
  
  ;; comment to disable rustfmt on save
  ;(setq rustic-format-on-save t))
  ;; Use C-c C-c C-f to format buffer

(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  ;(lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  ;; (lsp-rust-analyzer-server-display-inlay-hints nil)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  ;; (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))
