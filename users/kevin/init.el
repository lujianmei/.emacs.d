;; add zencoding by lujianmei
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes


;;设置窗口位置为屏库左上角(0,0)
(set-frame-position (selected-frame) 6 0)
;;设置宽和高,大家可以调整这个参数来适应自己屏幕大小，下面的数字是显示字符数量
(add-to-list 'default-frame-alist '(width  . 165))
(add-to-list 'default-frame-alist '(height . 43))

(split-window-right 50)