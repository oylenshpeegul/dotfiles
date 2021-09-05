;; https://depp.brause.cc/nov.el/
;;
;; Open the EPUB file with C-x C-f ~/FBooks/mastering-emacs-v3.epub,
;; scroll with SPC and switch chapters with n and p. More keybinds can
;; be looked up with F1 m.

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Liberation Serif"
                                           :height 1.0))
(add-hook 'nov-mode-hook 'my-nov-font-setup)

