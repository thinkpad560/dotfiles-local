(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(setq-default line-spacing 4)
(menu-bar-mode t)
;; (setq visible-bell t)

(load-theme 'tango)

;; (require 'package)

;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;; 			 ("org" . "https://orgmode.org/elpa/")
;; 			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; (package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; (unless (package-installed-p 'use-package)
;;   (package-install 'use-package))

;; (require 'use-package)
;; (setq use-package-always-ensure t)

;; (use-package ivy
;;   :diminish
;;   :bind (("C-s" . swiper)
;; 	 :map ivy-minibuffer-map
;; 	 ("TAB" . ivy-alt-done)
;; 	 ("C-l" . ivy-alt-donw)
;; 	 ("C-j" . ivy-next-line)
;; 	 ("C-k" . ivy-previous-line)
;; 	 :map ivy-switch-buffer-map
;; 	 ("C-k" . ivy-previous-line)
;; 	 ("C-l" . ivy-done)
;; 	 ("C-d" . ivy-switch-buffer-kill)
;; 	 :map ivy-reverse-i-search-map
;; 	 ("C-k" . ivy-previous-line)
;; 	 ("C-d" . ivy-reverse-i-search-kill))
;;   :config
;;   (ivy-mode 1))

;; (use-package all-the-icons)
;; (use-package all-the-icons-dired
;;   :hook (dired-mode . all-the-icons-dired-mode))

;; (use-package doom-modeline
;;   :hook (after-init . doom-modeline-mode)
;;   :custom ((doom-modeline-height 15)))

;; (use-package rainbow-delimiters
;;   :hook (prog-mode . rainbow-delimiters-mode))

;; (use-package which-key
;;   :init (which-key-mode)
;;   :diminish (which-key-mode)
;;   :config
;;   (setq which-key-idle-delay 1))

;; (use-package ivy-rich
;;   :init
;;   (ivy-rich-mode 1))

(setq display-line-numbers 'relative)

