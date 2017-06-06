;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;インストールしたパッケージにロードパスを通してロードする
(setq load-prefer-newer t)
(package-initialize)
(require 'use-package)
;; auto compile elisp
(use-package auto-compile
  :config
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1))
;; 自作にスクリプト群
(add-to-list 'load-path (concat user-emacs-directory "site-lisp"))
;; custom variablesの値をロード
(load "custom-variables")
;; 使用しているパッケージを自動的にインストールする
(load "my-packages")
;; 基本的な設定
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
  ;; 隠しファイルをデフォルトで表示
  (setq neo-show-hidden-files t)
  ;; neotree でファイルを新規作成した後、自動的にファイルを開く
  (setq neo-create-file-auto-open t)
  ;; delete-other-window で neotree ウィンドウを消さない
  (setq neo-persist-show t)
  ;; キーバインドをシンプルにする
  (setq neo-keymap-style 'concise)
  ;; windowサイズを可変にする
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
