;;; init-osx-keys.el --- Configure keys specific to MacOS -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (when *is-a-mac*
;;   (setq mac-command-modifier 'meta)
;;   (setq mac-option-modifier 'none)

;;   ;; I just want keep the origin macos's keybindings
;;   ;; (setq mac-option-modifier 'meta
;;         ;; mac-command-option 'super)

;;   ;; Make mouse wheel / trackpad scrolling less jerky
;;   (setq mouse-wheel-scroll-amount '(1
;;                                     ((shift) . 5)
;;                                     ((control))))
;;   (dolist (multiple '("" "double-" "triple-"))
;;     (dolist (direction '("right" "left"))
;;       (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">")) 'ignore)))
;;   (global-set-key (kbd "M-`") 'ns-next-frame)
;;   (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
;;   (global-set-key (kbd "M-˙") 'ns-do-hide-others)
;;   (with-eval-after-load 'nxml-mode
;;     (define-key nxml-mode-map (kbd "M-h") nil))
;;   (global-set-key (kbd "M-ˍ") 'ns-do-hide-others) ;; what describe-key reports for cmd-option-h
;;   )

(when *is-a-mac*
  (progn
    ;; stop open new frame when use OS X's open
    (setq ns-pop-up-frames nil)
    ;; scroll settings for NS port
    (setq scroll-conservatively 10000
          mouse-wheel-scroll-amount '(2 ((shift) . 1)) ;; one line at a time
          mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
          mouse-wheel-follow-mouse 't ;; scroll window under mouse
          )
    (setq visible-bell nil))

  ;; Mac Key mode by Xu Xin <railwaycat@gmail.com>
  ;; usage: M-x mac-switch-meta
  ;;   switch meta between option and command on a Mac Keyboard

  ;; Keybonds
  (global-set-key [(hyper a)] 'mark-whole-buffer)
  (global-set-key [(hyper v)] 'yank)
  (global-set-key [(hyper c)] 'kill-ring-save)
  (global-set-key [(hyper s)] 'save-buffer)
  (global-set-key [(hyper l)] 'goto-line)
  (global-set-key [(hyper w)] 'delete-frame)
  (global-set-key [(hyper n)] 'make-frame-command)
  (global-set-key [(hyper z)] 'undo)
  (global-set-key [(hyper x)] 'kill-region)
  (global-set-key [(hyper o)] 'find-file)
  (global-set-key [(hyper f)] 'isearch-forward)
  ;; (global-set-key [(hyper g)] 'isearch-repeat-forward)
  ;; (global-set-key [(hyper .)] 'keyboard-quit)
  ;; (global-set-key [(hyper q)] 'save-buffers-kill-emacs)
  (global-set-key [(hyper m)] 'suspend-frame)
  ;; (global-set-key [(hyber n)] 'make-frame-command)
  (global-set-key [(hyper {)] 'previous-buffer)
  (global-set-key [(hyper })] 'next-buffer)
  (global-set-key [(hyper r)] 'revert-buffer)


  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'hyper)


  (defun mac-switch-meta nil
    "switch meta between Option and Command"
    (interactive)
    (if (eq mac-option-modifier nil)
        (progn
          (setq mac-option-modifier 'meta
                mac-command-modifier 'hyper))
      (progn
        (setq mac-option-modifier nil
              mac-command-modifier 'meta))))


  )


(provide 'init-osx-keys)
;;; init-osx-keys.el ends here
