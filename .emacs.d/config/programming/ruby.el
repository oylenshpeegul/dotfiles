(use-package ruby-tools
  :init
  (progn
    (add-hook 'cperl-mode-hook 'ruby-tools-mode)
    (add-hook 'python-mode-hook 'ruby-tools-mode)))
