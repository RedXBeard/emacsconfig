(setq home-directory (concat (getenv "HOME") "/"))
(load "package")
(package-initialize)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
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

(defun install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))

;; make more packages available with the package installer
(setq to_install '(ample-theme tabbar minimap kivy-mode pip-requirements py-autopep8 virtualenvwrapper ido neotree deft magit column-marker python-mode pungi yasnippet jedi auto-complete autopair find-file-in-repository flycheck python-environment auto-virtualenv anaconda-mode))

(mapc 'install-if-needed to_install)


(setq package-archive-enable-alist '(("melpa" ample-theme tabbar minimap kivy-mode pip-requirements py-autopep8 virtualenvwrapper ido neotree deft magit column-marker python-mode pungi yasnippet jedi auto-complete autopair find-file-in-repository flycheck python-environment auto-virtualenv anaconda-mode)))

;; then in your init you can load all of the themes
;; without enabling theme (or just load one)
(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
;; choose one to enable
(enable-theme 'ample-flat)

(require 'tabbar-ruler)
(require 'ido)
(require 'magit)
(require 'auto-complete)
(require 'autopair)
(require 'yasnippet)
(require 'flycheck)
(require 'neotree)
(require 'virtualenvwrapper)
(require 'py-autopep8)
(require 'python-mode)
(require 'pip-requirements)
(require 'kivy-mode)

(global-set-key "\C-xg" 'magit-status)

(venv-initialize-interactive-shells)
(setq venv-location (concat home-directory "virtualenvs/"))

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
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.kv$" . kivy-mode))
(add-to-list 'auto-mode-alist '("requirements$" . pip-requirements-mode))
(setq py-electric-colon-active t)
;;(add-hook 'python-mode-hook 'elpy-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
;;(add-hook 'elpy-mode-hook 'auto-complete-mode)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=120"))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


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
 '(custom-safe-themes
   (quote
    ("12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" default)))
 '(mode-icons-mode nil)
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


(defun close-all-buffers ()

  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(global-set-key (kbd "\C-ck") 'close-all-buffers)
 ;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(hl-line ((t (:background '#757B80'))))
 ;; '(minimap-active-region-background ((t (:background "DodgerBlue4"))))
 ;; '(vline ((t (:background "DeepSkyBlue4")))))

(set-face-background 'hl-line "#404040")
