;;; init.el -- Ignacio Vargas' Emacs configuration
;-*-Emacs-Lisp-*-

(package-initialize)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(eval-when-compile
    (require 'use-package))

;; Basic settings
(setq inhibit-splash-screen t
    inhibit-startup-message t
    inhibit-startup-echo-area-message t)

;; Backup
(defvar backup-dir "~/.emacs.d/backup/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

;; Evil
(use-package evil
    :ensure t
    :config
    (evil-mode 1)

    (use-package evil-leader
        :ensure t
        :config
        (global-evil-leader-mode))

    (use-package evil-surround
        :ensure t
        :config
        (global-evil-surround-mode))

    (use-package evil-indent-textobject
        :ensure t))

(use-package evil-org
        :ensure t
        :after org
        :config
        (add-hook 'org-mode-hook 'evil-org-mode)
        (add-hook 'evil-org-mode-hook
            (lambda ()
                (evil-org-set-key-theme))))

(dolist (mode '(ag-mode
        flycheck-error-list-mode
        git-rebase-mode))
    (add-to-list 'evil-emacs-state-modes mode))

(add-hook 'occur-mode-hook
            (lambda ()
                (evil-add-hjkl-bindings occur-mode-map 'emacs
                    (kbd "/")       'evil-search-forward
                    (kbd "n")       'evil-search-next
                    (kbd "N")       'evil-search-previous
                    (kbd "C-d")     'evil-scroll-down
                    (kbd "C-u")     'evil-scroll-up
                    (kbd "C-w C-w") 'other-window)))

;; Org

(setq org-todo-keywords
    '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))

(setq org-agenda-files '("~/Dropbox/org/"))

;; Tiny Menu
(use-package tiny-menu
    :ensure t)

;; Helm
(use-package helm
    :ensure t)

;; Markdown-Mode
(use-package markdown-mode
    :ensure t)

;; Dictionary
(use-package dictionary :ensure t)

(provide 'init)

;;(set-default-font "Inconsolata-g-14")

;; Gruvbox
(use-package gruvbox-theme :ensure t)
(load-theme 'gruvbox-light-medium t)

;; Julia
(use-package julia-mode :ensure t)

;;; init.el ends here
