(use-package python-black
  :bind (("C-c b" . python-black-buffer)
         ("C-c d" . python-black-partial-dwim))
  :demand t
  :after python)



