;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;インストールするディレクトリを指定
(setq package-user-dir (concat user-emacs-directory "elpa"))
;;インストールしたパッケージにロードパスを通してロードする
(package-initialize)

;; 基本的な設定
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
	   ;; 隠しファイルをデフォルトで表示
	   (setq neo-show-hidden-files t)
	   ;; neotree でファイルを新規作成した後、自動的にファイルを開く
	   (setq neo-create-file-auto-open t)
	   ;; delete-other-window で neotree ウィンドウを消さない
	   (setq neo-persist-show t)
	   ;; キーバインドをシンプルにする
	   (setq neo-keymap-style 'concise)
	   ;; windowサイズを可変にする
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
