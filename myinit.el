(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)

(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package color-theme-modern
:ensure t)

(use-package zenburn-theme
:ensure t
:config (load-theme 'zenburn t))

(load-theme 'leuven t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'Python-mode-hook 'jedi:ac-setup))
