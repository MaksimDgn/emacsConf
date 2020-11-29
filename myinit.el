
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

(use-package try
             :ensure t)

(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package which-key
           :ensure t
           :config (which-key-mode))

(use-package auto-complete
:ensure t
:init
(progn
  (ac-config-default)
  (global-auto-complete-mode t)
  ))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; (counsel :repo "abo-abo/swiper"
;;         :fetcher github
;;         :files ("counsel.el"))


