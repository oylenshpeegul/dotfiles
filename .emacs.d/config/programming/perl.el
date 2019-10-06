
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

