;; package.el
;;�C���X�g�[�������p�b�P�[�W�Ƀ��[�h�p�X��ʂ��ă��[�h����
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-verbose t)
;; auto compile elisp
(use-package auto-compile
  :config
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1))
;; ����ɃX�N���v�g�Q
(add-to-list 'load-path (concat user-emacs-directory "site-lisp"))
;; custom variables�̒l�����[�h
(load "custom-variables")
;; �g�p���Ă���p�b�P�[�W�������I�ɃC���X�g�[������
(load "my-packages")
;; ��{�I�Ȑݒ�
(load "common")

(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  :config
  (ivy-mode))

(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-c g" . counsel-git)
   ("C-c j" . counsel-git-grep)))

(use-package swiper
  :ensure t
  :bind
  ("C-s" . swiper))

;; wdired
(use-package wdired
  :bind
  (("C-x C-d" . dired)
  :map dired-mode-map
  ("r" . wdired-change-to-wdired-mode)))

;; yasnippet
(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (yas-global-mode t))

;; junk file
(use-package open-junk-file)

;; rainbow-delimiters
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
;; eldoc
(use-package eldoc
  :config
  (eldoc-mode))

;; elscreen
(use-package elscreen
  :init
  (setq elscreen-tab-display-kill-screen nil)
  :config
  (elscreen-start))

;; powerline
(use-package powerline
  :config
  (powerline-default-theme))
;; theme
;; (use-package darktooth-theme)
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))
;; (use-package gruvbox-theme)
;; (load-theme 'darktooth t)
(load-theme 'spacemacs-dark t)

(global-hl-line-mode t)

(use-package neotree
  :commands neotree
  :init
  ;; �B���t�@�C�����f�t�H���g�ŕ\��
  (setq neo-show-hidden-files t)
  ;; neotree �Ńt�@�C����V�K�쐬������A�����I�Ƀt�@�C�����J��
  (setq neo-create-file-auto-open t)
  ;; delete-other-window �� neotree �E�B���h�E�������Ȃ�
  (setq neo-persist-show t)
  ;; �L�[�o�C���h���V���v���ɂ���
  (setq neo-keymap-style 'concise)
  ;; window�T�C�Y���ςɂ���
  (setq neo-window-fixed-size nil))

(use-package company
  :config
  (global-company-mode t)
  (company-quickhelp-mode t))

;; markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package go-mode
  :config
  (use-package company-go)
  (use-package go-eldoc))

(use-package magit)

;; meghanada
(use-package meghanada
  :ensure t
  :init
  (add-hook 'java-mode-hook
			(lambda ()
			  (meghanada-mode t)))
  :commands meghanada-mode)

(use-package which-key
  :ensure t
  :init
  (setq which-key-use-C-h-commands nil)
  :config
  (which-key-setup-side-window-right-bottom)
  (which-key-mode t))

(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (projectile-mode t))

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'")

(use-package tide
  :ensure t
  :demand typescript-mode
  :init
  (add-hook 'typescript-mode-hook
			(lambda ()
			  (tide-setup)
			  (eldoc-mode t)
			  (company-mode-on)))
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save))

