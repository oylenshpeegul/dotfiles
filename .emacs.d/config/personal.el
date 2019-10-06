;; Default size and colors
;; (setq default-frame-alist '((background-color . "gainsboro")
;;                            (foreground-color . "black")
;;                            (width . 80)
;;                            (height . 26)))
(setq default-frame-alist '((width . 80)(height . 26)))

;; make C-k work.
(setq kill-whole-line t)

;; Why is the default 8?
(setq default-tab-width 4)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

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

     print qq/* $Tag[$wday], den $mday $Monat[$mon] $year (yday $yday)\n/;

  "
))
;; C-c m calls myday
(global-set-key (kbd "C-c m") 'myday)

;; Make file executable if it is a script.
(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

;; Invoke goto-line with only one M-g, rather than two
(define-key global-map (kbd "M-g") 'goto-line)

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

;; Make cursor the width of the character it is under (e.g. TAB)
(setq x-stretch-cursor t)

;; Can we tidy up with use-package?
;; https://github.com/jwiegley/use-package
(require 'use-package)

;; Does the server start itself or not?
(server-start)
