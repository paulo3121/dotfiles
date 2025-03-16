(setq user-emacs-directory "~/dotfiles/emacs/")
(load (expand-file-name "init.el" user-emacs-directory))
(setq custom-file "~/dotfiles/emacs/custom.el")
(load-file custom-file)
