;; 回车缩进
;;(global-set-key "\C-m" 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-<return>") 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-S-i") 'indent-region)

;; Config the mark
(global-set-key (kbd "S-SPC") 'set-mark-command)

;; move text up or down
(global-set-key [S-C-up] 'move-text-up)
(global-set-key [S-C-down] 'move-text-down)

;; copy whole lines without select
(global-set-key (kbd "C-c l") 'copy-whole-lines)

;; add multi cursors:
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; config for smart forward
(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)



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

;; key bindings for org
;;(global-set-key (kbd "<f12>") 'org-agenda) ;; configured blew
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "C-c c") 'org-capture)

;; add ~/notes/front-end-dev-plan.org into agenda
(setq org-agenda-files (list "~/notes/front-end-dev-plan.org"))
(global-set-key "\C-c a" 'org-agenda)


;; enlarge current window
(global-set-key (kbd "M-[") 'enlarge-window-horizontally)
(global-set-key (kbd "M-]") 'shrink-window-horizontally)

;; Using dired-view for allowing select file in Dired-Mode by file's fist name.
(define-key dired-mode-map (kbd ";") 'dired-view-minor-mode-toggle)
(define-key dired-mode-map (kbd ":") 'dired-view-minor-mode-dired-toggle)

(provide 'my-key-binding)
;;; my-key-binding.el ends here

