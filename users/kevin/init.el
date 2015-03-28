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
;;(add-to-list 'default-frame-alist '(width  . 165))
;;(add-to-list 'default-frame-alist '(height . 43))

;; maximize frame when open first
(toggle-frame-maximized)
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
                                 (if (display-graphic-p frame) 'light 'dark))))

(provide 'init)
;;; init.el ends here



;; add some of TODO configuration
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "APPT(a)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("STARTED" :forceground "green" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))
(setq org-use-fast-todo-selection t)
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; config agenda view
;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header (concat "Project Next Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Project Subtasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Standalone Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|HOLD/!"
                           ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-tasks)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil))))

;; add css for org-mode export to html files
                                        ; Use org.css from the norang website for export document stylesheets
;;(setq org-html-head-extra "<link rel=\"stylesheet\" href=\"./org.css\" type=\"text/css\" />")
(setq org-html-head-extra "<style type=\"text/css\">body{margin:
1em; border-right: 5px solid #bbb; border-bottom: 5px solid #bbb;
padding: 0; background: #ddd none repeat scroll 0 0; border: 1px
solid #000; margin: 0; padding: 2em; color: #000;
font-family: \"Bitstream Vera Sans\", Verdana, sans-serif;
font-size: 85%;}code{color: #00f;}div#content{border: 1px solid
#bbb; background: #fff; margin: 0; padding: 2em;}a{color: #139;
text-decoration: none; padding: 1px;}a:hover{color:
#900;}#table-of-contents{margin: 1em 0; padding:
.1em;}div#content div#org-div-home-and-up{background: #369;
color: #fff;}div#org-div-home-and-up
a:link,div#org-div-home-and-up a:visited{color: #fff; background:
#369;}div#org-div-home-and-up a:hover{color:
#900;}div.title{margin: -1em -1em 0; font-size: 200%;
font-weight: bold; background: #369; color: #fff; padding: .75em
1em; font-family: \"BitStream Vera Sans\", Verdana; letter-spacing:
.1em;}h1{background: #369 none repeat scroll 0 0; color: #fff;
font-family: \"BitStream Vera Sans\", Verdana; font-size: 200%;
font-weight: bold; letter-spacing: 0.1em; margin: -1em -1em .2em;
padding: 0.75em 1em;}h2{font-size: 180%; border-bottom: 1px solid
#ccc; padding: .2em;}h3{font-size: 120%; border-bottom: 1px solid
#eee;}h4{font-size: 110%; border-bottom: 1px solid
#eee;}tt{color: #00f;}.verbatim{margin: .5em 0;}pre{border: 1px
solid #ccc; background: #eee; padding: .5em; overflow:
auto;}.verbatim pre{margin: 0;}.verbatim-caption{border: 1px
solid #ccc; border-bottom: 0; background: #fff; display: block;
font-size: 80%; padding: .2em;}div#postamble{text-align: left;
color: #888; font-size: 80%; padding: 0; margin: 0;}div#postamble
p{padding: 0; margin: 0;}div#postamble a{color:
#888;}div#postamble a:hover{color: #900;}table{font-size: 100%;
border-collapse: collapse; margin: .5em 0;}th, td{border: 1px
solid #777; padding: .3em; margin: 2px;}th{background:
#eee;}span.underline{text-decoration:
underline;}.fixme{background: #ff0; font-weight:
bold;}.ra{text-align: right;}</style>")

;; key bindings for org
;;(global-set-key (kbd "<f12>") 'org-agenda) ;; configured blew
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "C-c c") 'org-capture)

;; emacs-w3m-cvs, should install emacs-w3m-cvs first
(require 'w3m-load)

;; set parent node into DONE when all sub-tasks are done in org mode
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; add ~/notes/front-end-dev-plan.org into agenda
(setq org-agenda-files (list "~/notes/front-end-dev-plan.org"))
(global-set-key "\C-c a" 'org-agenda)



;; enlarge current window
(global-set-key (kbd "M-[") 'enlarge-window-horizontally)
(global-set-key (kbd "M-]") 'shrink-window-horizontally)
