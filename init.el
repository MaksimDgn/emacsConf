;; -*- lexical-binding: t-*-
;;; initialization

;; added by package.el.  this must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; нумерацыя строк слева

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; (load-theme 'leuven)



(menu-bar-mode -1) 
(tool-bar-mode -1) 

(scroll-bar-mode -1) 

(add-to-list 'load-path "~/.emacs.d/lisp")

;; (package-initialize)

(require 'linum)
(setq linum-format "%d ")
(global-linum-mode 1)

;; открывает буфер по Ф2
(require 'bs)
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))
(global-set-key (kbd "<f2>") 'bs-show)
 

(set-default 'cursor-type 'hbar)
(column-number-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(ido-mode)

(setq column-number-mode 1) ;; Номера строк слева
;; (require 'init)


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(package-initialize)
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (ac-config-default)
;;(ac-source-yasnippet)

;;(require 'yasnippet)
(add-to-list 'load-path
                "~/path-to-yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;  _________________________ Mike Zamansky _________________________
;; Using Emacs - Intro to Org Mode
;; (use-package org-bullets
;; :ensure t
;; :config
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;;
;; https://youtu.be/49kBWM3RQQ8?list=PL9KxKa8NpFxIcNQa9js7dQQIHc81b0-Xg
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
	     :ensure t)

(use-package which-key
	     :ensure t
	     :config (which-key-mode))




;; it looks like counsel is a requirement for swiper
(use-package counsel
	     :ensure t
)

(use-package swiper
	     :ensure try
	     :config
	     (progn
	       (ivy-mode 1)
	       (setq ivy-use-virtual-buffers t)
	       (global-set-key "\C-s" 'swiper)
	       (global-set-key (kbd "C-c C-r") 'ivy-resume)
	       (global-set-key (kbd "<f6>") 'ivy-resume)
	       (global-set-key (kbd "M-x") 'counsel-M-x)
	       (global-set-key (kbd "C-x C-f") 'counsel-find-file)
	       (global-set-key (kbd "<f1> f") 'counsel-describe-function)
	       (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
	       (global-set-key (kbd "<f1> l") 'counsel-load-library)
	       ;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
	       ;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
	       (global-set-key (kbd "C-c g") 'counsel-git)
	       (global-set-key (kbd "C-c j") 'counsel-git-grep)
	       (global-set-key (kbd "C-c k") 'counsel-ag)
	       (global-set-key (kbd "C-x l") 'counsel-locate)
	       (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
	       (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
	       ))


;; Using Emacs - Lesson 4 - Buffers
;; (setq indo-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

(defalias 'list-buffers 'ibuffer)
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

;; Using Emacs 7 - Navigating with Avy - https://youtu.be/ziytRbASKeU
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;; auto-complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (avy jedi flycheck color-theme yasnippet-snippets which-key use-package try org-plus-contrib org-bullets org lorem-ipsum counsel auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
