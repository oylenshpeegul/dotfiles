(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(package-selected-packages
   '(go-mode parinfer-rust-mode company rustic flycheck lsp-mode haskell-mode scala-mode ruby-tools python-black rainbow-delimiters htmlize multiple-cursors rg visual-fill-column org-bullets nov anti-zenburn-theme use-package))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 151 :width normal)))))

(when (>= emacs-major-version 27)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "https://melpa.org/packages/")
   t)

  ;; https://www.emacswiki.org/emacs/DotEmacsModular
  (load "~/.emacs.d/load-directory")
  (load-directory "~/.emacs.d/config"))

