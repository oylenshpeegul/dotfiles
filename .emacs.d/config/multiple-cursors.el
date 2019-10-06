(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
		 ("C-<" . mc/mark-previous-like-this)
		 ("C-c C-<" . mc/mark-all-like-this)
		 ("C-S-<mouse-1>" . mc/add-cursor-on-click)))
