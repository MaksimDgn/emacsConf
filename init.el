;; info emacs25.2.2


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

(ido-mode)

(setq column-number-mode 1) ;; Номера строк слева
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))



(defalias 'list-buffers 'ibuffer)
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

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

;; auto-complete
;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;;     (ac-config-default)
;;     (global-auto-complete-mode t)
;;     ))

