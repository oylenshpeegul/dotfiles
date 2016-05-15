
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "dark red" "dark green" "dark orange" "midnight blue" "dark magenta" "RoyalBlue2" "dark gray"])
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(font-use-system-font t)
 '(recentf-mode t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "bitstream" :slant normal :weight normal :height 151 :width normal))))
 '(cperl-array-face ((t (:foreground "Blue"))))
 '(cperl-hash-face ((t (:foreground "Red"))))
 '(cperl-nonoverridable-face ((t (:foreground "OrangeRed4"))))
 '(org-code ((t nil))))

;; Default size and colors
;; (setq default-frame-alist '((background-color . "gainsboro")
;;                            (foreground-color . "black")
;;                            (width . 80)
;;                            (height . 26)))
(setq default-frame-alist '((width . 80)(height . 26)))

;; make C-k work.
(setq kill-whole-line t)

;; Don't mix tabs and spaces!
;(setq-default indent-tabs-mode nil)

;; Why is the default 8?
(setq default-tab-width 4)

;; Prefer CPerl mode
(defalias 'perl-mode 'cperl-mode)
(defalias 'perldoc 'cperl-perldoc)

;; Try getting used to indenting 4, rather than just 2.
(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)

;; Use CPerl mode for tests and Perl 6 files.
(add-to-list 'auto-mode-alist '("\\.t$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.p6$" . cperl-mode))

;; Get rid of the underline representing blanks at the ends of lines.
(setq cperl-invalid-face 'default)

;; Use some Perl to insert the date.
(defun myday ()
  "print the date"
  (interactive)
  (call-process "perl" nil t nil "-e" "

     # perl code here
     my @Monat = qw(Januar Februar Maerz April Mai Juni Juli August
	            September Oktober November Dezember);
     my @Tag = qw(Sonntag Montag Dienstag Mittwoch Donnerstag Freitag
	          Samstag);

     my (undef, undef, undef, $mday, $mon, $year, $wday, $yday) = localtime;
     $year += 1900;
     $yday += 1;

     print qq/$Tag[$wday], den $mday $Monat[$mon] $year (yday $yday)\n/;

  "
))
;; C-c m calls myday
(global-set-key (kbd "C-c m") 'myday)

;; Make file executable if it is a script.
(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

;; Invoke goto-line with only one M-g, rather than two
(define-key global-map (kbd "M-g") 'goto-line)

;; Make cut-and-paste work like Emacs <= 23
(when (>= emacs-major-version 24)
  (setq select-active-regions nil)
  (setq mouse-drag-copy-region t)
  (setq x-select-enable-primary t)
  (setq x-select-enable-clipboard nil)
  (global-set-key (kbd "<mouse-2>") 'mouse-yank-at-click))

;; http://emacs-fu.blogspot.com/2009/02/transparent-emacs.html
(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

 ;; C-8 will increase opacity (== decrease transparency)
 ;; C-9 will decrease opacity (== increase transparency
 ;; C-0 will returns the state to normal
(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))

;; The Emacs shell command (M-!) is not interactive by default so bash
;; will not load your .bashrc.
(setq shell-command-switch "-ic")

;; make whitespace-mode use “¶” for newline and “▷” for tab.
;; together with the rest of its defaults
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space, ·
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [182 10]) ; newlne, ¶
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
))

;; Let's use Cask to manage our configuration!
;; http://cask.readthedocs.org/en/latest/
(require 'cask "~/.cask/cask.el")
(cask-initialize)
;; See $HOME/.emacs.d/Cask file for more.

;; Can we tidy up with use-package?
;; https://github.com/jwiegley/use-package
(require 'use-package)

;; (use-package ace-jump-mode
;;   :bind ("C-." . ace-jump-mode))
;; (use-package ace-window
;;   :bind ("M-g" . avy-goto-line))
(use-package ace-window
	:init
	(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
	;(setq aw-background nil)
	:bind
	("M-p" . ace-window)
	("C-." . avy-goto-char)
	("C-'" . avy-goto-char-2)
	("M-g" . avy-goto-line))

;; http://emacsredux.com/blog/2016/02/07/auto-indent-your-code-with-aggressive-indent-mode/
(use-package aggressive-indent
  :init
  (progn
	(global-aggressive-indent-mode 1)
	(add-to-list 'aggressive-indent-excluded-modes 'python-mode)
	(add-to-list 'aggressive-indent-excluded-modes 'elixir-mode)))

(use-package auto-complete-config
  :init
  (progn
	(add-hook 'cperl-mode-hook 'auto-complete-mode)
	(add-hook 'python-mode-hook 'auto-complete-mode)
	(add-hook 'ruby-mode-hook 'auto-complete-mode)
	(add-hook 'go-mode-hook 'auto-complete-mode)))

;; https://github.com/Wilfred/cask-mode
(use-package cask-mode)

;; http://oremacs.com/2015/05/22/define-word/
(use-package define-word
  :bind (("C-c d" . define-word-at-point)
		 ("C-c D" . define-word)))

;; http://pragmaticemacs.com/emacs/dynamically-filter-directory-listing-with-dired-narrow/
(use-package dired-narrow
  :ensure t
  :bind (:map dired-mode-map
              ("/" . dired-narrow)))

;; https://oylenshpeegul.wordpress.com/2015/12/07/supergood/
(use-package encourage-mode
  :ensure t
  :config
  (encourage-mode t))
(setq encourage-encouragements
  (nconc encourage-encouragements
    '("Aw, yeah!"
	  "Excellent!"
      "Fuck, yeah!"
	  "Hot sandwich!"
	  "Mein lieber Schwan!"
	  "Nice!"
	  "Outstanding!"
	  "Ossum!"
	  "Pisser!"
	  "Quit it!"
      "Scwhanky!"
	  "Spanakopita!"
	  "SPHINX!"
	  "Supergood!"
	  "Sweet!"
	  "That is so Batman!"
	  "Well done, you!"
	  "Whoa!"
	  "Wicked good!"
	  "Wicked nice!"
	  "Wicked pisser!")))

;; https://github.com/pidu/git-timemachine
(use-package git-timemachine)

;; go get -u github.com/nsf/gocode
;; go get -u github.com/bradfitz/goimports
;; go get -u code.google.com/p/rog-go/exp/cmd/godef
(use-package go-autocomplete)

(use-package go-mode
  :init
  (progn
	(add-hook 'go-mode-hook 'go-eldoc-setup)
	;; Man, goimports is amazing!
	(setq gofmt-command "goimports")
	(add-hook 'before-save-hook 'gofmt-before-save)))

;; go get -u github.com/golang/lint/golint
(use-package golint)

;; http://pragmaticemacs.com/emacs/move-through-edit-points/
(use-package goto-chg
  :bind (("C-c b ," . goto-last-change)
		 ("C-c b ." . goto-last-change-reverse)))
  
(use-package haskell-mode
  :init
  (progn
	(add-hook 'haskell-mode-hook 'haskell-indent-mode)
	(add-hook 'haskell-mode-hook 'interactive-haskell-mode)))

(use-package htmlize
  :bind ("C-c h" . htmlize-region)
  :init (setq htmlize-output-type "inline-css"))

(use-package iedit)

;; Starting with version 0.8, ivy is a separate package
;; http://oremacs.com/2016/04/26/ivy-0.8.0/
(use-package ivy
  :init (ivy-mode 1)
  :config (setq ivy-use-virtual-buffers t))

(use-package key-chord
  :init (key-chord-mode 1)
  :config
  (key-chord-define-global
   "--"
   (lambda ()
	 "insert an underscore."
	 (interactive)
	 (insert "_"))))

(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
		 ("C-<" . mc/mark-previous-like-this)
		 ("C-c C-<" . mc/mark-all-like-this)))

(use-package nlinum)

(use-package org2blog
  :bind (("C-c P" . org2blog/wp-post-buffer)
		 ("C-c p" . org2blog/wp-post-buffer-and-publish))
  :init
  (progn
	(require 'auth-source)
	(add-to-list 'auth-sources "~/.netrc")
	(let (credentials)
	  (setq credentials (auth-source-user-and-password "wpblog"))
	  (setq org2blog/wp-blog-alist
			`(("wordpress"
			   :url "https://oylenshpeegul.wordpress.com/xmlrpc.php"
			   :username ,(car credentials)
			   :password ,(cadr credentials)))))
	;;))))
	(setq org2blog/wp-track-posts nil)))

;; For org-reveal
(use-package ox-reveal)

(use-package ponylang-mode
  :ensure t
  :config
  (progn
    (add-hook
     'ponylang-mode-hook
     (lambda ()
       (set-variable 'indent-tabs-mode nil)
       (set-variable 'tab-width 2)))))

(use-package recentf
  :bind ("C-c r" . recentf-open-files)
  :config
  (setq recentf-exclude
        '("COMMIT_MSG" "COMMIT_EDITMSG" "github.*txt$"
          ".*png$"))
  (setq recentf-max-saved-items 60))

(use-package ruby-tools
  :init
  (progn
    (add-hook 'cperl-mode-hook 'ruby-tools-mode)
    (add-hook 'python-mode-hook 'ruby-tools-mode)))

;; http://emacsist.com/10470
(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-emacs-theme))

;; https://github.com/mrkkrp/vimish-fold
(use-package vimish-fold)

;; volatile highlights - temporarily highlight changes from pasting etc
(use-package volatile-highlights
  :config
  (volatile-highlights-mode t))

;; http://endlessparentheses.com/beacon-never-lose-your-cursor-again.html
(use-package beacon
  :init
  (progn
	(beacon-mode 1)
	(setq beacon-push-mark 35)
	(setq beacon-color "#336633")))

;; http://pragmaticemacs.com/emacs/get-pop-up-help-for-keybindings-with-which-key/
(use-package which-key
  :config
  (which-key-mode t))

;; I think zenburn is the first "dark" theme I've ever liked.
;; (use-package zenburn-theme
;;   :ensure t
;;   :config
;;   (load-theme 'zenburn t))

;; I need a light theme for blogging, though.
(use-package soft-stone-theme
  :ensure t
  :config
  (load-theme 'soft-stone t))

;; ~/.profile.d/keymap.sh results in Emacs complaining: <key-4660> is undefined
(global-set-key (kbd "<key-4660>") 'ignore)

;; http://webonastick.com/emacs-lisp/
(add-to-list 'load-path "~/.emacs.d/vendor")
(autoload 'hide-mode-line "hide-mode-line" nil t)

;; cobol?!
(require 'cobol-mode)

;; Does the server start itself or not?
(server-start)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

