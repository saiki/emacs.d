;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;�C���X�g�[�������p�b�P�[�W�Ƀ��[�h�p�X��ʂ��ă��[�h����
(setq load-prefer-newer t)
(package-initialize)
(require 'use-package)
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

;; wdired
(use-package wdired
  :bind (
		 ("C-x C-d" . dired)
		 :map dired-mode-map
			  ("r" . wdired-change-to-wdired-mode)
		 ))

;; yasnippet
(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (yas-global-mode t))

;; junk file
(use-package open-junk-file)

;; markdown
(use-package markdown-mode
  :commands markdown-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

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
  :config
  (elscreen-start))

;; powerline
(use-package powerline
  :config
  (powerline-default-theme))
;; theme
(load-theme 'darktooth t)

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

(use-package go-mode
  :config
  (use-package company-go)
  (use-package go-eldoc))

;; helm
(use-package helm
  :config
  (use-package helm-config
	:init
	(setq helm-autoresize-max-height 0)
	(setq helm-autoresize-min-height 20)
	:config
	(use-package helm-command
	  :config (helm-autoresize-mode 1)))
  :bind (
	([remap find-file] . helm-find-files)
	([remap occur] . helm-occur)
	([remap list-buffers] . helm-buffers-list)
	([remap dabbrev-expand] . helm-dabbrev)
	("M-x" . helm-M-x)))
;; (when (require 'helm-config)
;;   (when (require 'helm-command)
;; 	(setq helm-autoresize-max-height 0)
;; 	(setq helm-autoresize-min-height 20)
;; 	(helm-autoresize-mode 1)
;; 	(define-key global-map [remap find-file] 'helm-find-files)
;; 	(define-key global-map [remap occur] 'helm-occur)
;; 	(define-key global-map [remap list-buffers] 'helm-buffers-list)
;; 	(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
;; 	(global-set-key (kbd "M-x") 'helm-M-x)
;; 	(helm-mode 1)))

(use-package magit)
