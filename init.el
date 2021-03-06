
;; Needed for packages installed via M-x package-install to work
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
  )
(when (<= emacs-major-version 23)
  (load "~/.emacs.d/lib/package.el")
  (require 'package)
  (add-to-list 'package-archives 
	       '("marmalade" .
		 "http://marmalade-repo.org/packages/"))
  (package-initialize)
)

;(add-to-list 'load-path "~/.emacs.d/lib/starter-kit")
;(load "~/.emacs.d/init-starter-kit.el")
(load "~/.emacs.d/lib/better-defaults/better-defaults.el")

(add-to-list 'load-path "~/.emacs.d/lib/")

(add-to-list 'load-path "~/.emacs.d/lib/epl/")
(add-to-list 'load-path "~/.emacs.d/lib/pkg-info/")

(add-to-list 'load-path "~/.emacs.d/lib/org/")

;;; MAT init el
(load "~/.emacs.d/init-web.el")
(load "~/.emacs.d/init-webmode.el")
(load "~/.emacs.d/init-looks.el")
(load "~/.emacs.d/init-basics.el")
(load "~/.emacs.d/init-dired.el")
(load "~/.emacs.d/init-term.el")
(load "~/.emacs.d/init-commands.el")
(load "~/.emacs.d/init-projectile.el")
(load "~/.emacs.d/init-hotkeys.el")
(load "~/.emacs.d/init-irc.el")
(load "~/.emacs.d/init-helm.el")
(load "~/.emacs.d/init-git.el")
(load "~/.emacs.d/init-w3m.el")
(load "~/.emacs.d/init-markdown.el")
;; (load "~/.emacs.d/init-godmode.el")
(load "~/.emacs.d/init-org.el")
(load "~/.emacs.d/init-elscreen.el")

(require 'fill-column-indicator)

;; Proper autopair/autoclose parenthesis
(add-to-list 'load-path "~/.emacs.d/lib/autopair/") ;; comment if autopair.el is in standard load path 
(require 'autopair)
;(autopair-global-mode) ;; enable autopair in all buffers
;(add-hook 'term-mode-hook #'(lambda () (setq autopair-dont-activate t))) ;; except term modes

; https://code.google.com/p/autopair/issues/detail?id=54
(add-hook 'term-mode-hook
           #'(lambda () 
               (setq autopair-dont-activate t) ;; for emacsen < 24
               (autopair-mode -1))             ;; for emacsen >= 24
)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-clock-idle-time 10) ; emacs idle time before org-mode will alert of running clock
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
(setq org-time-stamp-rounding-minutes (quote (5 5))) ; round clock times to 5 mins

(setq snake-score-file
      "~/.emacs.d/snake-scores")

(load "~/.emacs.d/init-ace.el")


;; emacs code browser
(load "~/.emacs.d/init-ecb.el")

;; load undo-tree mode, ensure C-x u is still regular undo and C-c u is now undo-tree-visualize
(load "~/.emacs.d/lib/undo-tree-0.6.4.el")
(require 'undo-tree)
(define-key undo-tree-map (kbd "C-x u") 'undo-tree-undo)
(define-key undo-tree-map (kbd "C-x y") 'undo-tree-redo)
(define-key undo-tree-map (kbd "C-c u") 'undo-tree-visualize)
(global-undo-tree-mode)
(add-hook 'undo-tree-visualizer-mode-hook (lambda () (local-set-key (kbd "RET") 'undo-tree-visualizer-quit)))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
