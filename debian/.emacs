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
 '(package-selected-packages
   '(adoc-mode afternoon-theme cmake-mode company consult consult-company
	       consult-eglot consult-flycheck d-mode dune dune-format
	       editorconfig evil evil-collection gnuplot iceberg-theme
	       imenu-list kuronami-theme laguna-theme magit
	       markdown-mode meson-mode metalheart-theme
	       northcode-theme ocaml-eglot rust-mode starlit-theme
	       tomorrow-night-deepblue-theme tuareg urgrep wgrep
	       which-key))
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight regular :height 181 :width normal)))))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)

(add-hook 'd-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)

(require 'eglot)
(setq project-vc-extra-root-markers '("Cargo.toml" "dub.json" "meson.build" "dune-project"))
;(setq eglot-server-programs ())
(add-to-list 'eglot-server-programs `(d-mode . (substitute-in-file-name "$HOME/local-src/serve-d/serve-d")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-hook 'after-init-hook 'global-company-mode)

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(editorconfig-mode 1)

(add-hook 'c-mode-hook
          (lambda ()
            (evil-local-set-key 'normal (kbd "M-o") 'ff-find-related-file)))

(add-hook 'c-mode-hook 'eglot-ensure)

(evil-collection-init)


; ocaml ocp-indent
(add-to-list 'load-path (substitute-in-file-name "$HOME/.opam/default/share/emacs/site-lisp"))
(require 'ocp-indent)
(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode)))
(use-package ocaml-eglot
  :ensure t
  :after tuareg
  :hook
  (tuareg-mode . ocaml-eglot)
  (ocaml-eglot . eglot-ensure))

(add-hook 'tuareg-mode-hook
          (lambda ()
            (evil-local-set-key 'normal (kbd "M-o") 'tuareg-find-alternate-file)))

(global-auto-revert-mode t)
(recentf-mode 1)
(setq recentf-max-saved-items 50)
