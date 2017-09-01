;; package.el
;;インストールしたパッケージにロードパスを通してロードする
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
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

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
(use-package darktooth-theme)
;; (load-theme 'darktooth t)
(global-hl-line-mode t)

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
  :ensure t
  :config
  (use-package helm-config
	:init
	(setq helm-autoresize-max-height 0)
	(setq helm-autoresize-min-height 20)
	:config
	(use-package helm-command
	  :config (helm-autoresize-mode 1)))
  (use-package helm-descbinds)
  (helm-mode t)
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ([remap occur] . helm-occur)
  ([remap list-buffers] . helm-buffers-list)
  ([remap dabbrev-expand] . helm-dabbrev))

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
  (projectile-mode t)
  (projectile-global-mode t))

(use-package helm-projectile
  :ensure t
  :demand (helm . projectile)
  :pin melpa-stable
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))

(use-package php-mode
  :ensure t
  :mode "\\.php\\'")

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

(use-package vue-mode
  :ensure t
  )
