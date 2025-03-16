;;; init.el --- Main configuration file -*- lexical-binding: t; no-byte-compile: t-*-

;; Author: Paulo
;; Keywords: Emacs configuration
;; Homepage:

;;; Code:

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(column-number-mode 1)
(show-paren-mode 1)
(add-hook 'window-setup-hook 'toggle-frame-maximized t); Tela cheia startup
(delete-selection-mode 1); replace highlighted text with what I type

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-14"))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-auto-merge-work-directories-length -1)
(ido-mode 1)

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups/"))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package gruber-darker-theme
  :ensure t)

;; (use-package whitespace
;;   :hook (before-save . whitespace-cleanup))

(use-package rg)

(use-package move-text
  :config (move-text-default-bindings))

(use-package eldoc
  :custom (eldoc-echo-area-use-multiline-p t))

(use-package magit)

(use-package company
  :config (add-hook 'after-init-hook 'global-company-mode))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1) ;; da problema com haskell mode
  )

(use-package org)

(use-package files
  :preface
  (defvar backup-dir
    (locate-user-emacs-file ".cache/backups")
    "Directory to store backups.")
  (defvar auto-save-dir
    (locate-user-emacs-file ".cache/auto-save/")
    "Directory to store auto-save files.")
  :custom
  (backup-by-copying t)
  (create-lockfiles nil)
  (backup-directory-alist
   `(("." . ,backup-dir)))
  (auto-save-file-name-transforms
   `((".*" ,auto-save-dir t)))
  (auto-save-no-message t)
  (auto-save-interval 100)
  (require-final-newline t)
  :bind ("<f5>" . revert-buffer-quick)
  :init
  (unless (file-exists-p auto-save-dir)
    (make-directory auto-save-dir t)))

(use-package eglot
  :hook (( python-mode clojure-mode typescript-mode rjsx-mode
	   go-mode haskell-mode elixir-mode)
	 . eglot-ensure)
  :custom
  (eglot-eldoc-max-lines 10)
  :config
  (add-to-list 'eglot-server-programs '(elixir-mode "/opt/elixir-ls/release/language_server.sh"))
  )

(use-package pyvenv)

(use-package python
  :config
  (defun venv-search ()
    (let ((venv-path (locate-dominating-file default-directory "venv")))
      (when venv-path
	(pyvenv-activate (expand-file-name "venv" venv-path)))))
  (defun run-python3-current-file ()
    (interactive)
    (shell-command (concat "python3 " (shell-quote-argument (buffer-file-name)))))
  (defun setup-python-keybinds ()
    (define-key python-mode-map (kbd "C-<return>") 'run-python3-current-file))
  (add-hook 'python-mode-hook 'setup-python-keybinds)
  :hook
  (python-mode . venv-search))

;; (use-package go-mode
;;   :config
;;   (add-hook 'go-mode-hook
;;	  (lambda ()
;;	    (add-hook 'before-save-hook
;;		      #'gofmt-before-save
;;		      nil t))))

(use-package clojure-mode
  :hook
  (clojure-mode . paredit-mode))

(use-package cider ;C-c C-d d shows func cursor docs
  :after clojure-mode
  :hook (((cider-repl-mode cider-mode) . eldoc-mode)
	 (cider-popup-buffer-mode . cider-disable-linting)))


(defun run-eslint-on-file-in-project ()
  (interactive)
  (let* ((project-root "/home/paulo/lab/syn4tdf-frontend/")
	 (current-file (buffer-file-name))
	 (relative-path (and current-file
			     (file-relative-name current-file project-root))))
    (if (and relative-path (not (string-prefix-p ".." relative-path)))
	(let ((command (format "cd %s && eslint --fix %s"
			       project-root
			       (shell-quote-argument current-file))))
	  (shell-command command)
	  (revert-buffer t t t)
	  (message "eslint --fix %s" current-file)
	  )
      )))


(use-package emmet-mode)

(use-package rjsx-mode
  :mode ("\\.js\\'" . rjsx-mode)
  :config
  (add-hook 'after-save-hook 'run-eslint-on-file-in-project)
  :hook
  (rjsx-mode . emmet-mode)
  :custom
  (js-indent-level 2)
  (sgml-basic-offset 2)
  (js-switch-indent-offset 2))

(use-package typescript-mode
  :config
  (add-hook 'after-save-hook 'run-eslint-on-file-in-project)
  :hook
  (typescript-mode . emmet-mode))

(use-package haskell-mode
  :hook (haskell-mode . interactive-haskell-mode))

(use-package elixir-mode
  :ensure t)

(use-package html-mode
  :hook (html-mode . emmet-mode))

					; Substituir por projectile
(defun custom-compile ()
  (interactive)
  (let ((compile-command
	 (cond
	  ((derived-mode-p 'python-mode)
	   (concat "python3 " (shell-quote-argument (buffer-file-name))))

	  ;; ((derived-mode-p 'c-mode)
	  ;;  (concat "gcc -o " (file-name-sans-extension (buffer-file-name)) " "
	  ;;	   (shell-quote-argument (buffer-file-name))))

	  ((derived-mode-p 'c-mode)
	   "clang -Wall -Wextra -o main main.c -lm && ./main")

	  ((derived-mode-p 'c++-mode)
	   (concat "g++ -o " (file-name-sans-extension (buffer-file-name)) " "
		   (shell-quote-argument (buffer-file-name))))

	  ((derived-mode-p 'go-mode)
	   (concat "go run " (shell-quote-argument (buffer-file-name))))

	  (t
	   (error "Não há um comando definido para este modo")))))
    (compile compile-command)))

(defun setup-mode-specific-keybinds ()
  (local-set-key (kbd "M-<return>") 'custom-compile))

(dolist (hook '(python-mode-hook
		c-mode-hook
		c++-mode-hook
		go-mode-hook))
  (add-hook hook 'setup-mode-specific-keybinds))
