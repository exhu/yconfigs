;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-save-mode t)
 '(package-selected-packages '(evil markdown-mode rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight regular :height 188 :width normal)))))
(use-package eglot
  :ensure nil
  :defer t
  :bind (:map eglot-mode-map
              ("C-c a" . eglot-code-actions)
              ("C-c d" . eldoc)
              ("C-c f" . eglot-format-buffer)
              ("C-c r" . eglot-rename))
  :hook (rust-mode . eglot-ensure))

(use-package rust-mode
  :ensure t
  :defer t
  :init
					;(setq rust-mode-treesitter-derive t)
  )

(use-package markdown-mode
  :ensure t)

(require 'evil)
(evil-mode 1)

