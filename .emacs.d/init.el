;;; init.el -- Ignacio Vargas' Emacs configuration
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; Largely inspired (stolen) from aaronbieber's init.el
;; https://github.com/aaronbieber/dotfiles/
;;
;;; Code:

(package-initialize)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(add-to-list 'exec-path "/usr/local/bin")

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Backups
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

(use-package evil
  :ensure t)

(use-package helm
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package dictionary :ensure t)

(provide 'init)

;;; init.el ends here
