;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;�C���X�g�[�������p�b�P�[�W�Ƀ��[�h�p�X��ʂ��ă��[�h����
(package-initialize)
;; ����ɃX�N���v�g�Q
(add-to-list 'load-path (concat user-emacs-directory "site-lisp"))
;; custom variables�̒l�����[�h
(load "custom-variables")
;; �g�p���Ă���p�b�P�[�W�������I�ɃC���X�g�[������
(load "my-packages")
;; ��{�I�Ȑݒ�
(load "common")

;; auto compile elisp
(when (require 'auto-compile)
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1))

;; wdired
(when (require 'wdired)
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
  (global-set-key (kbd "C-x C-d") 'dired))

;; yasnippet
(yas-global-mode 1)
;; (global-yascroll-bar-mode 1)

;; junk file
(require 'open-junk-file)

;; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; rainbow-delimiters
(when (require 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; eldoc
(when (require 'eldoc)
  (eldoc-mode))

;; elscreen
(when (require 'elscreen)
  (elscreen-start))

;; powerline
(when (require 'powerline)
  (powerline-default-theme))
;; theme
(when (require 'color-theme)
  (load-theme 'darktooth t))

(when (require 'neotree)
	   ;; �B���t�@�C�����f�t�H���g�ŕ\��
	   (setq neo-show-hidden-files t)
	   ;; neotree �Ńt�@�C����V�K�쐬������A�����I�Ƀt�@�C�����J��
	   (setq neo-create-file-auto-open t)
	   ;; delete-other-window �� neotree �E�B���h�E�������Ȃ�
	   (setq neo-persist-show t)
	   ;; �L�[�o�C���h���V���v���ɂ���
	   (setq neo-keymap-style 'concise)
	   ;; window�T�C�Y���ςɂ���
	   (setq neo-window-fixed-size nil)
	   )

(when (require 'company)
  (global-company-mode t)
  (company-quickhelp-mode t))

(when (require 'go-mode)
  (require 'company-go)
  (require 'go-eldoc))

(require 'projectile)

;; helm
(when (require 'helm-config)
  (when (require 'helm-command)
	(setq helm-autoresize-max-height 0)
	(setq helm-autoresize-min-height 20)
	(helm-autoresize-mode 1)
	(define-key global-map [remap find-file] 'helm-find-files)
	(define-key global-map [remap occur] 'helm-occur)
	(define-key global-map [remap list-buffers] 'helm-buffers-list)
	(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
	(global-set-key (kbd "M-x") 'helm-M-x)
	(helm-mode 1)))

(when (require 'jdee)
  (setq jdee-server-dir (concat user-emacs-directory "jdee-server.jar")))

(require 'magit)
