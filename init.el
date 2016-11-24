;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;�C���X�g�[������f�B���N�g�����w��
(setq package-user-dir (concat user-emacs-directory "elpa"))
;;�C���X�g�[�������p�b�P�[�W�Ƀ��[�h�p�X��ʂ��ă��[�h����
(package-initialize)

;; ��{�I�Ȑݒ�
(load-file (concat
			user-emacs-directory
			(if (file-exists-p (concat user-emacs-directory "common.elc"))
				"common.elc"
			  "common.el")))

;; auto compile elisp
(when-not-installed-then-install auto-compile)
(when (require 'auto-compile)
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1))

;; wdired
(when-not-installed-then-install wdired)
(when (require 'wdired)
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
  (global-set-key (kbd "C-x C-d") 'dired))

(when-not-installed-then-install auto-complete)
(when (require 'auto-complete-config)
  (ac-config-default))

;; yasnippet
(when-not-installed-then-install yasnippet)
(yas-global-mode 1)
;; (global-yascroll-bar-mode 1)

;; junk file
(when-not-installed-then-install open-junk-file)
(require 'open-junk-file)

;; markdown
(when-not-installed-then-install markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; rainbow-delimiters
(when-not-installed-then-install rainbow-delimiters)
(when (require 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; eldoc
(when-not-installed-then-install eldoc)
(when (require 'eldoc)
  (eldoc-mode))

(when (require 'ido)
  (ido-mode t)
  (ido-everywhere t)
  (setq ido-enable-flex-matching t))

(when-not-installed-then-install color-theme)
(when-not-installed-then-install darktooth-theme)
(when (require 'color-theme)
  (load-theme 'darktooth t))

(when-not-installed-then-install neotree)
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

(when (require 'grep)
  (setq grep-program "jvgrep")
  (setq grep-command "jvgrep "))

(when-not-installed-then-install company)
(when (require 'company)
  (global-company-mode 1))

(when-not-installed-then-install go-mode)
(when-not-installed-then-install company-go)
(when (require 'go-mode)
  (require 'company-go))

(defun my-java-setting ()
  "java mode setting"
  (setq tab-width 8))
(add-hook 'java-mode-hook 'my-java-setting)

(when-not-installed-then-install elscreen)
(when (require 'elscreen)
  (elscreen-start))
