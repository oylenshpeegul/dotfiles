(require 'pulse)

;; https://karthinks.com/software/batteries-included-with-emacs/
(defun pulse-line (&rest _)
      "Pulse the current line."
      (pulse-momentary-highlight-one-line (point)))

(dolist (command '(scroll-up-command scroll-down-command
                   recenter-top-bottom other-window))
  (advice-add command :after #'pulse-line))

;; https://christiantietze.de/posts/2020/12/emacs-pulse-highlight-yanked-text/
(defun ct/yank-pulse-advice (orig-fn &rest args)
  ;; Define the variables first
  (let (begin end)
    ;; Initialize `begin` to the current point before pasting
    (setq begin (point))
    ;; Forward to the decorated function (i.e. `yank`)
    (apply orig-fn args)
    ;; Initialize `end` to the current point after pasting
    (setq end (point))
    ;; Pulse to highlight!
    (pulse-momentary-highlight-region begin end)))
(advice-add 'yank :around #'ct/yank-pulse-advice)
