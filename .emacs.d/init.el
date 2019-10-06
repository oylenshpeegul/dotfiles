(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(package-selected-packages
   (quote
    (dired-git-info use-package tuareg toml-mode swift-mode smartparens smart-mode-line-powerline-theme scala-mode ruby-tools rg rainbow-delimiters racer python-black powershell ponylang-mode php-mode parinfer paredit ox-ioslide ox-impress-js org-present multiple-cursors magithub lua-mode julia-mode htmlize haskell-mode golint go-guru go-eldoc go-autocomplete fsharp-mode flycheck-cask erlang encourage-mode elm-mode elixir-mode csharp-mode clojure-mode cask-mode cask cargo)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 143 :width normal))))
 '(region ((t (:background "goldenrod")))))

;;; https://www.emacswiki.org/emacs/DotEmacsModular
;;; Load all ".el" files under ~/.emacs.d/config directory.
(load "~/.emacs.d/load-directory")
(load-directory "~/.emacs.d/config")
