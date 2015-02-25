;; add zencoding by lujianmei
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes



;;add flymake-easy which is the base function for flymake series.
(require 'flymake-easy)
(add-hook 'js-mode-hook 'flymake-easy-load)

;;add flymake-jslint which is for syntax-checking Javascript source code using jslint, install jslint first, check on:install note.js, then execute: npm -g install jslint to install jslint
(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)

;;add flymake-css wihch An Emacs flymake handler for syntax-checking CSS source code using csslint(https://github.com/CSSLint/csslint).
(require 'flymake-css)
(add-hook 'css-mode-hook 'flymake-css-load)

;;add flymake-sass for checking sass files.
(require 'flymake-sass)
(add-hook 'sass-mode-hook 'flymake-sass-load)   

;;add scss-mode
(setq exec-path (cons (expand-file-name "~/.gem/ruby/2.2.0/bin") exec-path))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))




;;设置窗口位置为屏库左上角(0,0)
(set-frame-position (selected-frame) 6 0)
;;设置宽和高,大家可以调整这个参数来适应自己屏幕大小，下面的数字是显示字符数量
(add-to-list 'default-frame-alist '(width  . 165))
(add-to-list 'default-frame-alist '(height . 43))

(split-window-right 50)



;; tab 缩进
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
(setq tab-stop-list (cons (* x 4) tab-stop-list)))
 
;; 回车缩进
(global-set-key "\C-m" 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-<return>") 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-S-i") 'indent-region)
