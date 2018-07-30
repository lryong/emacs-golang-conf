
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (elpy ahungry-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 加载一些包
(require 'package)
(add-to-list 'package-archives
	     '("elpy" . "https://jorgenschaefer.github.io/packages"))

;; Add go-mode by lryong
(add-to-list 'load-path "~/.emacs.d/elisp/golang")
(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")
(require 'go-flymake)

(add-to-list 'load-path "~/.emacs.d/elisp/common/auto-complete")
(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)


;;go-remove-unused-imports的hook
(add-hook 'go-mode-hook (lambda()
			  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

;;控制大小写
;;设置t表示忽略大小写，设置为nil表示区分大小写
;;默认情况下为smart，表示如果输入的字符不含有大写字符才会忽略大小写
(setq ac-ignore-case t)

;; 设置提示选项的快捷键
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)


;;修改auto-complete匹配项可能会重复出项的问题
(add-hook 'go-mode-hook #'(lambda() (setq ac-sources '(ac-source-go ac-source-abbrev ac-sources-dictionary))))

;;solarized主题
(add-to-list 'load-path "~/.emacs.d/elisp/common/emacs-color-theme-solarized")
(require 'solarized-theme)
(set-frame-parameter nil 'background-mode 'dark) ;;solarized dark
(set-terminal-parameter nil 'background-mode 'dark)
(enable-theme 'solarized)

;; 全局显示行号
(global-linum-mode 1)

;; goflymake的快捷键绑定
(add-hook 'flymake-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c C-e n") 'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c C-e p") 'flymake-goto-prev-error)))
(add-hook 'flymake-mode-hook
	  (lambda()
	    (local-set-key (kbd "C-c C-e m") 'flymake-popup-current-error-menu)))

;;elpy Emacs Python development environment
(elpy-enable)
(add-hook 'python-mode-hook 'anaconda-mode)

;; 不自动备份
(setq make-backup-files nil)

;; 默认开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 高亮当前行
(global-hl-line-mode 1)

;; 添加Org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 默认设置Org Agenda文件目录
(setq org-agenda-file '("~/org"))

;; 设置org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)


(require 'dired-x)
;; Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区。
(put 'dired-find-alternate-file 'disabled nil)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; Org-mode 管理Emacs配置
(require 'org-install)
(require 'ob-tangle)
;;(org-babel-load-file (expand-file-name "org-file-name.org" '("~/org-babel")))

;;启用Pallet

