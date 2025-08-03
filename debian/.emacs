;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(desktop-save-mode t)
 '(indicate-buffer-boundaries 'right)
 '(package-selected-packages '(d-mode evil markdown-mode rust-mode))
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight regular :height 211 :width normal)))))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(require 'evil)
(evil-mode 1)

(add-hook 'd-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)

(require 'eglot)
(setq project-vc-extra-root-markers '("Cargo.toml"))
;(setq eglot-server-programs ())
(add-to-list 'eglot-server-programs `(d-mode . ("serve-d")))
