(use-package haskell-mode
  :init
  (progn
	(add-hook 'haskell-mode-hook 'haskell-indent-mode)
	(add-hook 'haskell-mode-hook 'interactive-haskell-mode)))
