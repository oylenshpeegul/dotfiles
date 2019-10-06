;; http://julienblanchard.com/2016/fancy-rust-development-with-emacs/
;;
;; https://github.com/racer-rust/emacs-racer
(use-package rust-mode
  :bind ("TAB" . #'company-indent-or-complete-common)
  :config (setq company-tooltip-align-annotations t)
  :init
  (progn
    (add-hook 'rust-mode-hook 'cargo-minor-mode)
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)))


;; The rust-format-buffer function will format your code with rustfmt
;; if installed. By default, this is bound to C-c C-f.
;;
;; Placing (setq rust-format-on-save t) in your ~/.emacs will enable
;; automatic running of rust-format-buffer when you save a buffer.

