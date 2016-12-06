;; ツールバー / メニューバーを表示しない
(if window-system
    (progn
      (tool-bar-mode 0)
      (menu-bar-mode -1)
      (setq custom-theme-directory (expand-file-name "themes" user-emacs-directory))
      ;; (load-theme 'gnome2 t t)
      ;; (enable-theme 'gnome2)
	  (scroll-bar-mode 0)
      ))

;; ビープ音,画面フラッシュなし
(setq ring-bell-function 'ignore)

;; [#]のつくバックアップファイルを作らない
(setq auto-save-default nil)
;; 日本語環境設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
;; (set-default-coding-systems 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (cond
;;  ((eq system-type 'darwin)
;;   (if (require-safe 'ucs-normalize)
;;       (set-file-name-coding-system 'utf-8-hfs)))
;;  ((eq system-type 'windows-nt)
;;   (set-file-name-coding-system 'cp932)))
;; (setq initial-scratch-message "")

;; tab width
(setq-default tab-width 4)

;; mode on
;; (iswitchb-mode 1)
(display-time-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(transient-mark-mode 1)
(delete-selection-mode 1)
(auto-compression-mode 1)
(auto-image-file-mode 1)
(temp-buffer-resize-mode 1)
;; (electric-indent-mode 1)
(electric-pair-mode 1)
;; (electric-layout-mode -1)

(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

(global-linum-mode t)
(setq-default show-trailing-whitespace t)

(cua-mode t)
(setq cua-enable-cua-keys nil)

;; customize eshell
(setq eshell-cmpl-ignore-case t)
(setq eshell-cmpl-cycle-completions t)
;; (defun my-eshell-prompt-function ()
;; 	  (lambda ()
;; 		(concat
;; 		 (eshell/pwd)
;; 		 "\n$ ")))
;; (setq eshell-prompt-function 'my-eshell-prompt-function)
(defun my-eshell-propt-function()
  (concat
   (eshell/pwd)
   "\n$ "))

(setq eshell-prompt-function 'my-eshell-propt-function)
;; (setq eshell-prompt-function
;; 	  (lambda ()
;; 		(concat
;; 		 (eshell/pwd)
;; 		 "\n$ ")))
;; 先頭に戻るときに入力箇所の先頭に移動させる
(setq eshell-prompt-regexp "^[^#$]*[$#] ")

(global-set-key (kbd "C-x l") 'windmove-right)
(global-set-key (kbd "C-x h") 'windmove-left)
(global-set-key (kbd "C-x k") 'windmove-up)
(global-set-key (kbd "C-x j") 'windmove-down)

(global-set-key (kbd "C-x C-n") 'next-window)
(global-set-key (kbd "C-x C-p") 'previous-window)

(keyboard-translate ?\C-h ?\C-?)
;; (keyboard-translate ?\C-] ?\M)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))

(unless (file-exists-p (expand-file-name "site-lisp/common.elc" user-emacs-directory))
  (byte-compile-file (expand-file-name "site-lisp/common.el" user-emacs-directory)))
