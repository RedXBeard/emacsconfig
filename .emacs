;;(setq base "~/.EmacsConf/")
;;(load (concat base "ca-init.el"))
;;(setq base "~/.minimal-emacs-configuration/")
;;(load (concat base "init.el"))
 
;;(setq py-install-directory "/Users/denizci/.emacs.d/python-mode.el/")
;;(add-to-list 'load-path py-install-directory)
;;(require 'python-mode)
;;(add-to-list 'load-path "~/.emacs.d/neotree")
;;(require 'neotree)

(load "package")
(package-initialize)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(load-theme 'deeper-blue)
(windmove-default-keybindings 'shift)
(show-paren-mode t)
(setq visible-bell nil)

(fringe-mode '(nil . 0))
(global-hl-line-mode 1)
(setq standard-indent 2)
(setq scroll-step 1)
(setq-default indent-tabs-mode nil)
(mouse-wheel-mode t)
(setq make-backup-files nil)
(line-number-mode 1)
(column-number-mode 1)
(setq-default fill-column 120)
(global-linum-mode t)
(setq auto-fill-mode 1)
(menu-bar-mode -1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq inhibit-splash-screen t
      initial-scratch-message nil)
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
(show-paren-mode t)

(when (eq system-type 'darwin)
  (setq mac-right-option-modifier 'none))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)


(setq package-archive-enable-alist '(("melpa" pip-requirements py-autopep8 virtualenvwrapper ido neotree ipython deft magit column-marker python-mode pungi yasnippet jedi auto-complete autopair find-file-in-repository flycheck python-environment auto-virtualenv anaconda-mode)))

(require 'ido)
(require 'magit)
(require 'auto-complete)
(require 'autopair)
(require 'yasnippet)
(require 'flycheck)
(require 'neotree)
(require 'virtualenvwrapper)
(require 'py-autopep8)
;;(elpy-enable)
;;(elpy-use-ipython)

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=120"))

(global-set-key "\C-xg" 'magit-status)

(venv-initialize-interactive-shells)
(setq venv-location "/Users/denizci/virtualenvs/")

(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(global-flycheck-mode t)

(global-set-key [f7] 'find-file-in-repository)

; auto-complete mode extra settings
(setq
 ac-auto-start 2
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20)

;; ;; Python mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("requirements$" . pip-requirements-mode))
(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'elpy-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'auto-complete-mode)

;; -------------------- extra nice things --------------------
;; use shift to move around windows
(ido-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq echo-keystrokes 0.1
      use-dialog-box nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
;; '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))


(setq python-shell-interpreter "ipython"
       python-shell-interpreter-args "-i")

(defun hs-enable-and-toggle ()
  (interactive)
  (hs-minor-mode 1)
  (hs-toggle-hiding))
(defun hs-enable-and-hideshow-all (&optional arg)
  "Hide all blocks. If prefix argument is given, show all blocks."
  (interactive "P")
  (hs-minor-mode 1)
  (if arg
      (hs-show-all)
      (hs-hide-all)))
(global-set-key (kbd "C-c C-h") 'hs-enable-and-toggle)
(global-set-key (kbd "C-c C-j") 'hs-enable-and-hideshow-all)
