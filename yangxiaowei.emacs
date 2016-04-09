;========================================
;;添加 Emacs 搜索目录 可以将自定的扩展放该目录
;;========================================
(add-to-list 'load-path "~/.emacs.d")
;如果有其它配置文件，使此命令读取
;(load "addon.el")

;;========================================
;; 外观设置
;;========================================

;;禁用工具栏
;; (tool-bar-mode nil)

;;禁用菜单栏，F10 开启关闭菜单
;; (menu-bar-mode nil)

;;禁用滚动栏，用鼠标滚轮代替
;;(scroll-bar-mode nil)

;;禁用启动画面
(setq inhibit-startup-message t)

;;========================================
;; 键绑定
;;========================================

;; C-t 交换字母
(global-set-key (kbd "C-t") 'transpose-chars)

;; C-t 设置标记
;; (global-set-key (kbd "C-t") 'set-mark-command)

;; C-x b => CRM bufer list
;;(global-set-key "\C-xb" 'electric-buffer-list)

;;---------- redo,这个组合在百度的机器上出不来，用c-\
;; (global-set-key ( kbd "C-.") 'redo)
(global-set-key ( kbd "C-\\") 'redo)
(global-set-key ( kbd "C-/") 'undo)
(global-set-key ( kbd "C-_") 'undo)     ;for C-/ trigger C-_ on baidu machine

;;========================================
;;关闭当前缓冲区 Alt+4  ;; C-x 0
(global-set-key (kbd "M-4") 'delete-window)
;;关闭其它缓冲区 Alt+1  ;; C-x 1
(global-set-key (kbd "M-1") 'delete-other-windows)
;;水平分割缓冲区 Alt+2  ;; C-x 2
(global-set-key (kbd "M-2") 'split-window-vertically)
;;垂直分割缓冲区 Alt+3  ;; C-x 3
(global-set-key (kbd "M-3") 'split-window-horizontally)
;;切换到其它缓冲区 Alt+0 ;; C-x o
(global-set-key (kbd "M-0") 'other-window)

;;org-todo 模式 Ctrl-c Ctrl-t
;;(global-set-key (kbd "C-c C-t") 'org-todo-list)

;;orgagenda mode C-c a
(global-set-key (kbd "C-c a") 'org-agenda)

;;org-capture
(global-set-key (kbd "C-c c") 'org-capture)

;;F10 显示/隐藏菜单栏 ;; M-x menu-bar-open
;;(global-set-key (kbd "F10") 'menu-bar-mode)

;;M-s M-s -> shell
(global-set-key (kbd "M-s M-s") 'shell)


;;========================================
;; 缓冲区
;;========================================

;;设定行距
(setq default-line-spacing 0)

;;页宽
(setq default-fill-column 90)

;;缺省模式 text-mode
(setq default-major-mode 'text-mode)

;;设置删除纪录
(setq kill-ring-max 200)

;;以空行结束
(setq require-final-newline t)


;;语法加亮
(global-font-lock-mode t)

;;高亮显示区域选择
(transient-mark-mode t)

;;页面平滑滚动， scroll-margin 5 靠近屏幕边沿3行时开始滚动，可以很好的看到上下文。
;; (setq scroll-margin 1                  
     ;; scroll-conservatively 1000)
;; (setq redisplay-dont-pause t)
(setq redisplay-dont-pause t
      scroll-margin 10
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;高亮显示成对括号，但不来回弹跳
(show-paren-mode t)
(setq show-paren-style 'parentheses)


;;鼠标指针规避光标
;(mouse-avoidance-mode 'animate)

;;粘贴于光标处，而不是鼠标指针处
(setq mouse-yank-at-point t)

;;========================================
;; 回显区
;;========================================

;;打开闪屏报警
;; (setq visible-bell t)
;; 关闭闪屏报警
(setq visible-bell nil)

;;使用 y or n 提问
(fset 'yes-or-no-p 'y-or-n-p)

;;锁定行高
(setq resize-mini-windows nil)

;;递归 minibuffer
(setq enable-recursive-minibuffers t)

;; 当使用 M-x COMMAND 后，过 1 秒钟显示该 COMMAND 绑定的键。
;;(setq suggest-key-bindings 1) ;;

;;========================================
;; 状态栏
;;========================================

;;显示时间
(display-time)
;;时间格式
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

;;显示列号
(setq column-number-mode t)

;;标题栏显示 %f 缓冲区完整路径 %p 页面百分数 %l 行号
(setq frame-title-format "%f")


;;========================================
;; 编辑器设定
;;========================================

;;不生成临时文件
;;(setq-default make-backup-files nil)


;;只渲染当前屏幕语法高亮，加快显示速度
(setq font-lock-maximum-decoration t)

;;将错误信息显示在回显区
;(condition-case err
;    (progn
;    (require 'xxx) )
;  (error
;   (message "Can't load xxx-mode %s" (cdr err))))

;;使用X剪贴板
(setq x-select-enable-clipboard t)
;;;;;;;; 使用空格缩进 ;;;;;;;;
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
(setq indent-tabs-mode nil)
(setq tab-always-indent nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;;========================================
;; 颜色设置
;;========================================

;; 指针颜色
(set-cursor-color "black")
;; 鼠标颜色
(set-mouse-color "black")
;; 背景和字体颜色
(set-foreground-color "gainsboro")
(set-background-color "grey30")
(set-border-color "black")
;; 语法高亮显示，区域选择，二次选择 ;;前景和背景色
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;;日历配色
;(setq calendar-load-hook
;'(lambda ()
;(set-face-foreground 'diary-face "skyblue")
;(set-face-background 'holiday-face "slate blue")
;(set-face-foreground 'holiday-face "white")))

;;========================================
;; 字体设置
;;========================================
(set-default-font "Monospace-12")
(if window-system
   (set-fontset-font (frame-parameter nil 'font)
	  'unicode '("Microsoft YaHei" . "unicode-bmp"))
)


;;========================================
;; 必备扩展
;;========================================


;;---------- color-theme
;(require 'color-theme)
;(color-theme-gray30)

;;========== ibuffer
(require 'ibuffer)
(global-set-key ( kbd "C-x C-b ")' ibuffer)

;;========== outline
(setq outline-minor-mode-prefix [(control o)])

;;---------- Docbook
;(require 'docbook-xml-mode)

;(add-hook 'docbook-xml-mode-hook
;	  (function (lambda ()
;                  (setq outline-regexp "<!\\-\\-\\*+")
;		      (outline-minor-mode)
;		      (hide-body)
;	    		)))


;;开启服务器模式
;(server-start)

;;org-mode
;; (setq org-hide-leading-stars t)
;;  (define-key global-map "\C-ca" 'org-agenda)
;;  (setq org-log-done 'time)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; F5 运行当前文件 ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(defun run-current-file ()
;  "Execute or compile the current file.
;For example, if the current buffer is the file x.pl,
;then it'll call “perl x.pl” in a shell.
;The file can be php, perl, python, bash, java.
;File suffix is used to determine what program to run."
;(interactive)
;  (let (ext-map file-name file-ext prog-name cmd-str)
;; get the file name
;; get the program name
;; run it
;    (setq ext-map
;          '(
;            ("php" . "php")
;            ("pl" . "perl")
;            ("py" . "python")
;            ("sh" . "bash")
;            ("java" . "javac")
;            )
;          )
;    (setq file-name (buffer-file-name))
;    (setq file-ext (file-name-extension file-name))
;    (setq prog-name (cdr (assoc file-ext ext-map)))
;    (setq cmd-str (concat prog-name " " file-name))
;;    (compile cmd-str)))
;    (shell-command cmd-str)))
;
;(global-set-key (kbd "<f5>") 'run-current-file)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; 以下为实现 redo 的代码 ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'redo)

(defvar redo-version "1.02"
  "Version number for the Redo package.")

(defvar last-buffer-undo-list nil
  "The head of buffer-undo-list at the last time an undo or redo was done.")
(make-variable-buffer-local 'last-buffer-undo-list)

(make-variable-buffer-local 'pending-undo-list)

;; Emacs 20 variable
(defvar undo-in-progress)

(defun redo (&optional count)
  "Redo the the most recent undo.
Prefix arg COUNT means redo the COUNT most recent undos.
If you have modified the buffer since the last redo or undo,
then you cannot redo any undos before then."
  (interactive "*p")
  (if (eq buffer-undo-list t)
      (error "No undo information in this buffer"))
  (if (eq last-buffer-undo-list nil)
      (error "No undos to redo"))
  (or (eq last-buffer-undo-list buffer-undo-list)
      ;; skip one undo boundary and all point setting commands up
      ;; until the next undo boundary and try again.
      (let ((p buffer-undo-list))
	(and (null (car-safe p)) (setq p (cdr-safe p)))
	(while (and p (integerp (car-safe p)))
	  (setq p (cdr-safe p)))
	(eq last-buffer-undo-list p))
      (error "Buffer modified since last undo/redo, cannot redo"))
  (and (or (eq buffer-undo-list pending-undo-list)
	   (eq (cdr buffer-undo-list) pending-undo-list))
       (error "No further undos to redo in this buffer"))
  (or (eq (selected-window) (minibuffer-window))
      (message "Redo..."))
  (let ((modified (buffer-modified-p))
	(undo-in-progress t)
	(recent-save (recent-auto-save-p))
	(old-undo-list buffer-undo-list)
	(p (cdr buffer-undo-list))
	(records-between 0))
    ;; count the number of undo records between the head of the
    ;; undo chain and the pointer to the next change.  Note that
    ;; by `record' we mean clumps of change records, not the
    ;; boundary records.  The number of records will always be a
    ;; multiple of 2, because an undo moves the pending pointer
    ;; forward one record and prepend a record to the head of the
    ;; chain.  Thus the separation always increases by two.  When
    ;; we decrease it we will decrease it by a multiple of 2
    ;; also.
    (while p
      (cond ((eq p pending-undo-list)
	     (setq p nil))
	    ((null (car p))
	     (setq records-between (1+ records-between))
	     (setq p (cdr p)))
	    (t
	     (setq p (cdr p)))))
    ;; we're off by one if pending pointer is nil, because there
    ;; was no boundary record in front of it to count.
    (and (null pending-undo-list)
	 (setq records-between (1+ records-between)))
    ;; don't allow the user to redo more undos than exist.
    ;; only half the records between the list head and the pending
    ;; pointer are undos that are a part of this command chain.
    (setq count (min (/ records-between 2) count)
	  p (primitive-undo (1+ count) buffer-undo-list))
    (if (eq p old-undo-list)
            nil ;; nothing happened
      ;; set buffer-undo-list to the new undo list.  if has been
      ;; shortened by `count' records.
      (setq buffer-undo-list p)
      ;; primitive-undo returns a list without a leading undo
      ;; boundary.  add one.
      (undo-boundary)
      ;; now move the pending pointer backward in the undo list
      ;; to reflect the redo.  sure would be nice if this list
      ;; were doubly linked, but no... so we have to run down the
      ;; list from the head and stop at the right place.
      (let ((n (- records-between count)))
	(setq p (cdr old-undo-list))
	(while (and p (> n 0))
	  (if (null (car p))
	      (setq n (1- n)))
	  (setq p (cdr p)))
	(setq pending-undo-list p)))
    (and modified (not (buffer-modified-p))
	 (delete-auto-save-file-if-necessary recent-save))
    (or (eq (selected-window) (minibuffer-window))
	(message "Redo!"))
    (setq last-buffer-undo-list buffer-undo-list)))

(defun undo (&optional arg)
  "Undo some previous changes.
Repeat this command to undo more changes.
A numeric argument serves as a repeat count."
  (interactive "*p")
  (let ((modified (buffer-modified-p))
	(recent-save (recent-auto-save-p)))
    (or (eq (selected-window) (minibuffer-window))
	(message "Undo..."))
    (or (eq last-buffer-undo-list buffer-undo-list)
	;; skip one undo boundary and all point setting commands up
	;; until the next undo boundary and try again.
	(let ((p buffer-undo-list))
	  (and (null (car-safe p)) (setq p (cdr-safe p)))
	  (while (and p (integerp (car-safe p)))
	    (setq p (cdr-safe p)))
	  (eq last-buffer-undo-list p))
	(progn (undo-start)
	       (undo-more 1)))
    (undo-more (or arg 1))
    ;; Don't specify a position in the undo record for the undo command.
    ;; Instead, undoing this should move point to where the change is.
    ;;
    ;;;; The old code for this was mad!  It deleted all set-point
    ;;;; references to the position from the whole undo list,
    ;;;; instead of just the cells from the beginning to the next
    ;;;; undo boundary.  This does what I think the other code
    ;;;; meant to do.
    (let ((list buffer-undo-list)
    	  (prev nil))
      (while (and list (not (null (car list))))
    	(if (integerp (car list))
    	    (if prev
    		(setcdr prev (cdr list))
    	      ;; impossible now, but maybe not in the future
    	      (setq buffer-undo-list (cdr list))))
    	(setq prev list
    	      list (cdr list))))
    (and modified (not (buffer-modified-p))
	 (delete-auto-save-file-if-necessary recent-save)))
  (or (eq (selected-window) (minibuffer-window))
      (message "Undo!"))
  (setq last-buffer-undo-list buffer-undo-list))





(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(default-input-method "eim-wb")
 '(display-time-mode t)
 '(show-paren-mode t))
 ;; '(tool-bar-mode nil)
 ;; '(menu-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "grey30" :foreground "gainsboro" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 121 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


;;自动备份到~/.backup
(setq
 backup-by-copying t
 backup-directory-alist
 '(("."."~/.backup"))
 delete-old-versions t
 kept-new-versions 3
 kept-old-versions 1
 version-control t)


;;auto-complete
(add-to-list 'load-path "/home/yangxiaowei/.emacs.d/auto-complete-1.3.1/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/yangxiaowei/.emacs.d/auto-complete-1.3.1/ac-dict/")
(ac-config-default) ;; can't execute in 251,so comment

;;智能注释，选中则注释选中，否则注释当前行
(defun qiang-comment-dwim-line (&optional arg)
"Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;;智能拷贝 M－W在不选中时作全行拷贝，选中作选中拷贝
;; Smart copy, if no region active, it simply copy the current whole line
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; Copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
                  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "M-k") 'qiang-copy-line)


;; ;; 设置agenda文件所在的todo文件位置
;; (setq org-agenda-files (list "~/todo/todo.org"))


;; ;; 设置todo文件的标签与快捷健
;; (setq org-tag-alist '(("技术" . ?t)
;;                       ("工作" . ?w)
;;                       ("@Home" . ?h)
;;                       ("生活" . ?l)))

;; 默认打开org文件的缩进
;; (setq org-startup-indented t)

;; 启动默认模式
(setq auto-complete-mode t)
(setq abbrev-mode t)
(setq linum-mode nil)

;; open todo file function
;; (defun open_todo_file ()
;;   "Open todo file"
;;    (interactive)
;;    (find-file-other-window "/home/yangxiaowei/todo/todo.org")
;; )
;; ;; (define-key global-map [(f6)] 'open_todo_file)

;; ;; open note file function
;; (defun open_note_file ()
;;   "Open note file"
;;    (interactive)
;;    (find-file-other-window "/home/yangxiaowei/todo/notes.org")
;; )
;; (define-key global-map [(f7)] 'open_note_file)

;;因为在百度的机器上无法使用M-up等组合键，因此只好重新设置一组键来对应了，后来由secureCRT换成putty，回归在org模式中使用方向键
;; (global-set-key (kbd "<up>") 'org-move-subtree-up)
;; (global-set-key (kbd "<down>") 'org-move-subtree-down)
;; (global-set-key (kbd "<right>") 'org-demote-subtree)
;; (global-set-key (kbd "<left>")  'org-promote-subtree)


;; install org-mode
;; (setq load-path (cons "/home/yangxiaowei/.emacs.d/org-8.2.7b/lisp"
;;                 load-path))
;; (require 'org-install)

;; start remember-mode in org-mode
;; (autoload 'remember "remember" nil t)
;; (autoload 'remember-region "remember" nil t)
;; (setq org-reverse-note-order t)
;; (when (file-exists-p "/home/yangxiaowei/todo/")
;;   (define-key global-map [(f8)] 'remember)
;;   (setq remember-annotation-functions '(org-remember-annotation))
;;   (setq remember-handler-functions '(org-remember-handler))
;;   (add-hook 'remember-mode-hook 'org-remember-apply-template)

;;   (setq org-directory "~/todo/")
;;   (setq org-remember-templates
;;         `((?t "* TODO %?\n  %i"
;;               ,(expand-file-name "todo.org" org-directory) "临时储物箱")
;;           (?n "* %U\n\n  %?%i\n  %a"
;;               ,(expand-file-name "notes.org" org-directory) "Notes")))

;;   (let ((todo (expand-file-name "todo.org" org-directory)))
;;     (when (file-exists-p todo)
;;       (add-to-list 'org-agenda-files todo))))


;; C-x f -> find file
(global-set-key (kbd "\C-xf") 'find-file)


;; eim-wb for emacs
;; (add-to-list 'load-path "~/.emacs.d/eim")
;; (autoload 'eim-use-package "eim" "Another emacs input method")
;; Tooltip 暂时还不好用
;; (setq eim-use-tooltip nil)

;; (register-input-method
;;  "eim-wb" "euc-cn" 'eim-use-package
;;  "五笔" "汉字五笔输入法" "wb.txt")
;; (register-input-method
;;  "eim-py" "euc-cn" 'eim-use-package
;;  "拼音" "汉字拼音输入法" "py.txt")

;; 用 ; 暂时输入英文
;; (require 'eim-extra)
;; (global-set-key ";" 'eim-insert-ascii)
;; (global-set-key (kbd "M-o")'eim-insert-ascii)

;; C->eim-table-add-word
;; (global-set-key (kbd "\C-c +") 'eim-table-add-word)

;; 增加gbk词库
;; (setq eim-wb-use-gbk t)

;;; M-R -> replace-string
(global-set-key "\M-r" 'replace-string)


;;; M-` -> auto-complete-mode
(global-set-key "\M-`" 'auto-complete-mode)

;;; M-/ -> abbrev-mode
(global-set-key "\M-/" 'abbrev-mode)

;;; C-\ -> C-; 这个组合键不知道被谁占走了，只好换一个了
;;(global-set-key (kbd "C-;") 'toggle-input-method)
;; (global-set-key (kbd "M-i") 'toggle-input-method)

;;add todo state
(setq org-todo-keywords
     '((sequence "TODO" "ONGOING"  "|" "DONE" "CANCEL" "DELEGATED")))



;; C-\ -> linum-mode 无奈 redo 那个组合键又不能出来，只好把linum-mode这个给占了
;; (global-set-key (kbd "C-\\") 'linum-mode)
;; C-c l 来启动行号模式吧
(global-set-key (kbd "\C-cl") 'linum-mode)


;; M-n -> next-line
(global-set-key (kbd "M-n") 'next-line)

;;M-p -> previouse-line
(global-set-key (kbd "M-p") 'previous-line)

;;C-x c -> calendar
(global-set-key (kbd "\C-xc") 'calendar)

;;C-x ! -> compile
;; (global-set-key (kbd "f5") 'compile)
(define-key global-map [(f5)] 'compile)

;; 删除尾部空格
(global-set-key (kbd "C-<") 'delete-trailing-whitespace)

;;高亮当前编辑的行
(require 'hl-line)


(global-hl-line-mode 1)
;; for hight line mode
(or (facep 'my-hl-line-face) (make-face 'my-hl-line-face))
(setq hl-line-face 'my-hl-line-face)
(face-spec-set 'my-hl-line-face '((t (
                                      :background "DodgerBlue4"
                                                  :bold
                                                  ;;:weight nil
                                      :inverse-video nil
                                      ))))
(defun wcy-color-theme-adjust-hl-mode-face()
  "interactive"
  (let* ((color  (x-color-values (face-attribute 'default :background))))
    (if (null color)
        (error "not support.")
      (let ((my-color (mapcar
                       (lambda (x)
                         (let ((y (/ #XFFFF 4))
                               (delta #X18FF))
                           (cond
                            ((< x (* y 1))
                             (+ x delta))
                            ((< x (* y 2))
                             (+ x delta))
                            ((< x (* y 3))
                             (- x delta))
                            (t
                             (- x delta)))))
                       color)))
        (message "%S %S" color my-color)
        (set-face-attribute
         'my-hl-line-face nil
         :background
         (concat "#"
                 (mapconcat
                  (lambda (c) (format "%04X" c))
                  my-color
                  "")))))))
(wcy-color-theme-adjust-hl-mode-face)


;; C-^ -> revert-buffer
(global-set-key (kbd "C-^") 'revert-buffer)

;; <F12> -> restore the layout of gdb
(define-key global-map [(f12)] 'gdb-restore-windows)



;;set C indent-style
(add-hook 'c-mode-hook 'linux-c-mode)
(add-hook 'c++-mode-hook 'linux-cpp-mode)

(defun linux-c-mode ()
  (define-key c-mode-map [return] 'newline-and-indent)
  (interactive)
  (c-set-style "K&R")
  (c-toggle-hungry-state)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode 1))
  ;; (c-toggle-auto-state)  ;;关闭;自动换行

(defun linux-cpp-mode()
  (define-key c++-mode-map [return] 'newline-and-indent)
  (interactive)
  (c-set-style "stroustrup")
  (c-toggle-hungry-state)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode 1))
  ;; (c-toggle-auto-state)

;; <F11> -> start grep
(define-key global-map [(f11)] 'rgrep)

;; <F6> -> start find
(define-key global-map [(f6)] 'find-dired)


;; set the default test coding system
(setq default-buffer-file-coding-system 'utf-8)

;; <F9> -> Save all file
;;(define-key global-map [(f9)] 'save-some-buffers)
;; <F9> -> linum-mode
;(define-key global-map [(f9)] 'linum-mode)





;; insert-current-time
(defun insert-current-date ()
    "Insert the current date"
    (interactive "*")
    (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))
    ;; (insert (format-time-string "%Y/%m/%d" (current-time))))
    (global-set-key "\C-xt" 'insert-current-date)


;; idel-highlight-mode
(autoload 'idle-highlight-mode "/home/yangxiaowei/.emacs.d/idle-highlight-mode-master/idle-highlight-mode.el"
  "hight the word the point is on" t)
(add-hook 'emacs-lisp-mode-hook 'idle-highlight-mode)
(add-hook 'c++-mode-hook 'idle-highlight-mode)
(add-hook 'c-mode-hook 'idle-highlight-mode)
(add-hook 'python-mode-hook 'idle-highlight-mode)

;; (add-hook 'find-file 'idle-highlight-mode)
(define-key global-map [(f9)] 'idle-highlight-mode)

;; evim for get features like vim
;(add-to-list 'load-path "/home/yangxiaowei/.emacs.d/evil-evil/")
;(require 'evil)
;(evil-mode 0)


;; tabbar mode
;; (add-to-list 'load-path "/home/yangxiaowei/.emacs.d/tabbar/")
;; (require 'tabbar)
;; (tabbar-mode 1)


;; highlight-parentheses
(add-to-list 'load-path "/home/yangxiaowei/.emacs.d/highlight-parenthese/")
(require 'highlight-parentheses)
(add-hook 'find-file-hook 'highlight-parentheses-mode)
;(add-hook 'emacs-lisp-mode-hook 'highlight-parenthese)
;(add-hook 'c++-mode-hook 'highlight-parenthese)
;(add-hook 'c-mode-hook 'highlight-parenthese)
;(add-hook 'python-mode-hook 'highlight-parenthese)


;; command-shell
(define-key global-map [(f4)] 'shell-command)



;; highlight-focus
;; (add-to-list 'load-path "/home/yangxiaowei/.emacs.d/highlight-focus/")
;; (require 'highlight-focus)


(set-face-attribute  'mode-line
                 nil 
                 ;; :foreground "green"
                 ;; :background "brown"
                 :foreground "red"
                 :background "white"
                 :box '(:line-width 1 :style released-button))
(set-face-attribute  'mode-line-inactive
                 nil
                 :foreground "blue"
                 :background "white" 
                 :box '(:line-width 1 :style released-button))

;; highlight current line
;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#3e4446")
;; (set-face-foreground 'highlight nil)
(setq semantic-idle-scheduler-idle-time 432000)



;; set color of comment in code file
(set-face-foreground 'font-lock-string-face "red")
(set-face-foreground 'font-lock-comment-face "light blue")



;; speedbar
(add-to-list 'load-path "/home/yangxiaowei/.emacs.d/speedbar/")
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-width 40)
(setq sr-speedbar-right-side nil)
(global-set-key (kbd "<f4>") (lambda()
                               (interactive)
                               (sr-speedbar-toggle)
			       (semantic-mode)))
(require 'semantic/sb)
(setq speedbar-use-images nil)

;; calender appointment checking enable-theme
(setq appt-activate t)

;; create multiple shell in emacs
(defun rename-buffer-in-ssh-login (cmd) 
  "Rename buffer to the destination hostname in ssh login"
  (if (string-match "ssh [-_a-z0-9A-Z]+@[-_a-z0-9A-Z.]+[ ]*[^-_a-z0-9-A-Z]*$" cmd) 
      (let (( host (nth 2 (split-string cmd "[ @\n]" t) ))) 
        (rename-buffer (concat "@" host)) ;       
	;; (add-to-list 'shell-buffer-list (concat "*" host));
	;; (message "%s" shell-buffer-list)
        ) 
    ) 
  )
(add-hook 'comint-input-filter-functions 'rename-buffer-in-ssh-login)

(defun kill-shell-buffer(process event) 
  "The one actually kill shell buffer when exit. "
  (kill-buffer (process-buffer process)) 
  ) 

(defun kill-shell-buffer-after-exit() 
  "kill shell buffer when exit."
  (set-process-sentinel (get-buffer-process (current-buffer)) 
			#'kill-shell-buffer) 
  )
(add-hook 'shell-mode-hook 'kill-shell-buffer-after-exit t)


;; bind command of shell with key
;; (global-set-key (kbd "M-s M-w")
;;                 (interactive)
;;                 (shell-command "ssh relay00.baidu.com"))
;; (global-set-key (kbd "M-s M-w")
;;                 (interactive)
;;                 (insert (shell-command-to-string "date")))
(global-set-key (kbd "M-s M-w")  "ssh relay00.baidu.com")
(global-set-key (kbd "M-s M-z")  "stty -echo")


(defun insert-baidu-comment-1()  
  (interactive)
  (insert "// Copyright 2016 Baidu Inc. All Rights Reserved.
// Author : yangxiaowei (yangxiaowei@baidu.com)
// 
// Breif :
"))
(global-set-key (kbd "M-s c 1") 'insert-baidu-comment-1)


(defun insert-baidu-comment-2()  
  (interactive)
  (insert (message "/** **************************************************************************
*
*         Copyright (c) 2016 Baidu.com, Inc. All Rights Reserved
* 
* ****************************************************************************
*/

/**
* @File %s
* @Author yangxiaowei <yangxiaowei@baidu.com>
* @Date %s
* @Version 1.0
* @Brief : 
**/
" (current-buffer) (format-time-string "%Y/%m/%d %H:%M:%S" (current-time)))))
(global-set-key (kbd "M-s c 2") 'insert-baidu-comment-2)


;; set interpreter for sheme
;;; Always do syntax highlighting
(global-font-lock-mode 1)

;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;;; This is the binary name of my scheme implementation
(setq scheme-program-name "mit-scheme")

;; find head/source file
(global-set-key (kbd "M-o") 'ff-find-other-file)

;; protobuf
(add-to-list 'load-path "/home/yangxiaowei/.emacs.d/")
(require 'protobuf-mode)
(setq auto-mode-alist  (cons '(".proto$" . protobuf-mode) auto-mode-alist))
