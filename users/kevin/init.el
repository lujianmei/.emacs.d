;; add zencoding by lujianmei
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes



;;;;add flymake-easy which is the base function for flymake series.
;;(require 'flymake-easy)
;;(add-hook 'js-mode-hook 'flymake-easy-load)
;;
;;;;add flymake-jslint which is for syntax-checking Javascript source code using jslint, install jslint first, check on:install note.js, then execute: npm -g install jslint to install jslint
;;(require 'flymake-jslint)
;;(add-hook 'js-mode-hook 'flymake-jslint-load)
;;
;;;;add flymake-css wihch An Emacs flymake handler for syntax-checking CSS source code using csslint(https://github.com/CSSLint/csslint).
;;(require 'flymake-css)
;;(add-hook 'css-mode-hook 'flymake-css-load)
;;
;;;;add flymake-sass for checking sass files.
;;(require 'flymake-sass)
;;(add-hook 'sass-mode-hook 'flymake-sass-load)   



;;add scss-mode
(setq exec-path (cons (expand-file-name "~/.gem/ruby/2.2.0/bin") exec-path))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save t)



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
;;(global-set-key "\C-m" 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-<return>") 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-S-i") 'indent-region)


;move line up down
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key [S-C-up] 'move-text-up)
(global-set-key [S-C-down] 'move-text-down)



;; add multi cursors:
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;add angular snippets
(require 'angular-snippets)

(eval-after-load "sgml-mode"
  '(define-key html-mode-map (kbd "C-c C-d") 'ng-snip-show-docs-at-point))



;;add smart forward
(require 'smart-forward)
(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)


;;;;add tagedit
;;(setq tagedit-experimental-features-on nil)
(tagedit-disable-experimental-features)

;;(define-key html-mode-map (kbd "C-t C-d") 'tagedit-disable-experimental-features)
;;(define-key html-mode-map (kbd "C-t C-e") 'tagedit-add-experimental-features)

(define-key html-mode-map (kbd "C-<right>") 'tagedit-forward-slurp-tag)
(define-key html-mode-map (kbd "C-<left>") 'tagedit-forward-barf-tag)
;;(define-key html-mode-map (kbd "M-r") 'tagedit-raise-tag)
;;(define-key html-mode-map (kbd "M-s") 'tagedit-splice-tag)
;;(define-key html-mode-map (kbd "M-J") 'tagedit-join-tags)
;;(define-key html-mode-map (kbd "M-S") 'tagedit-split-tag)
;;(define-key html-mode-map (kbd "M-?") 'tagedit-convolute-tags)
;;(define-key html-mode-map (kbd "C-k") 'tagedit-kill)

(define-key html-mode-map (kbd "S-k") 'tagedit-kill-attribute)


;; set flycheck run on all buffers:
(add-hook 'after-init-hook #'global-flycheck-mode)


;; add support for create new shell based on buffer directory
(require 'shell-current-directory)
;;(shell-current-directory)

;;open eshell as default
;;(add-hook 'after-init-hook 'eshell-mode)
;;(setq eshell-aliases-file "~/.emacs.d/eshell/alias")

;;set shell file
 (setq shell-file-name "/bin/bash")
 (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
 (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
 
;; change theme to solarized,use light frames in the GUI and dark frames in my terminal
(load-theme 'solarized-light t)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-frame-parameter frame
                                 'background-mode
                                 (if (display-graphic-p frame) 'light 'dark))


