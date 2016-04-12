
;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)
(add-to-list 'load-path "~/.emacs.d/plugins")  
;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

(global-set-key (kbd "M-4") 'delete-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-0") 'other-window)
(global-set-key (kbd "M-s M-s") 'shell)
(global-set-key (kbd "\C-xf") 'find-file)
(global-set-key ( kbd "C-\\") 'redo)
(global-set-key ( kbd "C-/") 'undo)
(global-set-key ( kbd "C-_") 'undo) 
(global-set-key (kbd "C-^") 'revert-buffer)
(global-set-key "\M-r" 'replace-string)
(global-set-key (kbd "M-s c 3") 'comment-or-uncomment-region)  
(global-set-key (kbd "M-s c 1") 'insert-baidu-comment-1)

;;========================================
;; 缓冲区
;;========================================

;;设定行距
(setq default-line-spacing 0)

;;页宽
(setq default-fill-column 90)

;;缺省模式 text-mode
;; (setq default-major-mode 'text-mode)

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
;; (setq redisplay-dont-pause t
;;       scroll-margin 10
;;       scroll-step 1
;;       scroll-conservatively 10000
;;       scroll-preserve-screen-position 1)

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



;;;; Smart copy, if no region active, it simply copy the current whole line
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

; auto complete

(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")  
(require 'auto-complete-config)  
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/ac-dict")  
(ac-config-default)

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;(load-theme 'solarized t)
;(set-frame-parameter nil 'background-mode 'dark)    ;;选择solarized dark
;(enable-theme 'solarized)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'molokai t)
;(load-theme 'solarized t)
;(enable-theme 'solarized)

(require 'package)  
(add-to-list 'package-archives       '("marmalade" .        "http://marmalade-repo.org/packages"))  
(package-initialize)

;;swbuf
(require 'swbuff)
(global-set-key (kbd "M-p") 'swbuff-switch-to-previous-buffer)
(global-set-key (kbd "M-n") 'swbuff-switch-to-next-buffer)
(setq swbuff-exclude-buffer-regexps 
     '("^ " "\\*.*\\*"))

(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)

;;yasnippet                    
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;column no 
(setq mouse-yank-at-point t)

;;highlight
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;;autopairs
(add-to-list 'load-path "~/.emacs.d/plugins") ;; comment if autopair.el is in standard load path 
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;;C-x ! -> compile
;; (global-set-key (kbd "f5") 'compile)
(define-key global-map [(f5)] 'compile)

;; 删除尾部空格
(global-set-key (kbd "C-<") 'delete-trailing-whitespace)

;;高亮当前编辑的行
(require 'hl-line)


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
(define-key global-map [(f9)] 'linum-mode)





;; insert-current-time
(defun insert-current-date ()
    "Insert the current date"
    (interactive "*")
    (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))
    ;; (insert (format-time-string "%Y/%m/%d" (current-time))))
    (global-set-key "\C-xt" 'insert-current-date)


;; idel-highlight-mode
(autoload 'idle-highlight-mode "~/.emacs.d/idle-highlight-mode-master/idle-highlight-mode.el"
  "hight the word the point is on" t)
(add-hook 'emacs-lisp-mode-hook 'idle-highlight-mode)
(add-hook 'c++-mode-hook 'idle-highlight-mode)
(add-hook 'c-mode-hook 'idle-highlight-mode)
(add-hook 'python-mode-hook 'idle-highlight-mode)

;; (add-hook 'find-file 'idle-highlight-mode)
(define-key global-map [(f9)] 'idle-highlight-mode)

;; evim for get features like vim
;(add-to-list 'load-path "~/.emacs.d/evil-evil/")
;(require 'evil)
;(evil-mode 0)


;; tabbar mode
;; (add-to-list 'load-path "~/.emacs.d/tabbar/")
;; (require 'tabbar)
;; (tabbar-mode 1)


;; highlight-parentheses
(add-to-list 'load-path "~/.emacs.d/highlight-parenthese/")
(require 'highlight-parentheses)
(add-hook 'find-file-hook 'highlight-parentheses-mode)
;(add-hook 'emacs-lisp-mode-hook 'highlight-parenthese)
;(add-hook 'c++-mode-hook 'highlight-parenthese)
;(add-hook 'c-mode-hook 'highlight-parenthese)
;(add-hook 'python-mode-hook 'highlight-parenthese)


;; command-shell
(define-key global-map [(f4)] 'shell-command)



;; highlight-focus
;; (add-to-list 'load-path "~/.emacs.d/highlight-focus/")
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



(defun insert-baidu-comment-1()  
  (interactive)
  (insert "// Copyright 2016 Baidu Inc. All Rights Reserved.
// Author : moon (moon@baidu.com)
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
x* ****************************************************************************
*/

/**
* @File %s
* @Author moon <moon@baidu.com>
* @Date %s
* @Version 1.0
* @Brief : 
**/
" (current-buffer) (format-time-string "%Y/%m/%d %H:%M:%S" (current-time)))))
(global-set-key (kbd "M-s c 2") 'insert-baidu-comment-2)


;;格式化整个文件函数
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))
;;绑定到F7键
(global-set-key [f7] 'indent-whole)

(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line) 

(define-auto-insert 'sh-mode '(nil "#!/bin/bash\n\n"))
;; 自动为 C/C++ 的头文件添加 #define 保护。
(define-auto-insert
  '("\\.\\([Hh]\\|hh\\|hxx\\|hpp\\)\\'" . "C / C++ header")
  '((upcase (concat "_"
                    (replace-regexp-in-string
                     "[^a-zA-Z0-9]" "_"
                     (format "%s_%d_" (file-name-nondirectory buffer-file-name) (random)))))
    "#ifndef " str \n
    "#define " str "\n\n"
    _ "\n\n#endif"))

;; the following elisp code is use to
;; construct the compile command automatically.
;; so you don't need to write or choose the compile
;; command in the minibuffer.
;;
;; the rule is as following:
;; first, find GNUmakefile" "makefile" "Makefile"
;; if found, compile command is "make -C ."
;; else try to find one of make file in ".."
;; if found, compile command is "make -C .."
;; continue until reach the root directory "/"
;; if the make file still isn't found, try the
;; trivial compile command , that is,
;; if in the c++ mode:
;;         g++ -o your_source your_source.cc
;; if in the c mode
;;         gcc -o your_source your_source.c
;; if all is failed, do nothing.
;;
;; if you like this command, you can put the following
;; line in your .emacs
;;
;; (global-set-key (kbd "<f7>") 'smart-compile)
;;

(defun smart-compile-is-root-dir(try-dir)
  (or
   ;; windows root dir for a driver or Unix root
   (string-match "\\`\\([a-zA-Z]:\\)?/$" try-dir)
   ;; tramp root-dir
   (and (featurep 'tramp)
        (string-match (concat tramp-file-name-regexp ".*:/$") try-dir))))
(defun smart-compile-throw-final-path(try-dir)
  (cond
   ;; tramp root-dir
   ((and (featurep 'tramp)
         (string-match tramp-file-name-regexp try-dir))
    (with-parsed-tramp-file-name try-dir foo
        foo-localname))
   (t try-dir)))

(defun smart-compile-find-make-dir( try-dir)
  "return a directory contain makefile. try-dir is absolute path."
  (if (smart-compile-is-root-dir try-dir)
      nil ;; return nil if failed to find such directory.
    (let ((candidate-make-file-name `("GNUmakefile" "makefile" "Makefile")))
      (or (catch 'break
            (mapc (lambda (f)
                    (if (file-readable-p (concat (file-name-as-directory try-dir) f))
                        (throw 'break (smart-compile-throw-final-path try-dir))))
                  candidate-make-file-name)
            nil)
          (smart-compile-find-make-dir
           (expand-file-name (concat (file-name-as-directory try-dir) "..")))))))


(defun wcy-tramp-compile (arg-cmd)
  "reimplement the remote compile."
  (interactive "scompile:")
  (with-parsed-tramp-file-name default-directory foo
    (let* ((key (format "/plink:%s@%s:" foo-user foo-host))
           (passwd (password-read "PASS:" key))
           (cmd (format "plink %s -l %s -pw %s \"(cd %s ; %s)\""
                         foo-host foo-user
                         passwd
                         (file-name-directory foo-localname)
                         arg-cmd)))
      (password-cache-add key passwd)
      (save-some-buffers nil nil)
      (compile-internal cmd "No more errors")
      ;; Set comint-file-name-prefix in the compilation buffer so
      ;; compilation-parse-errors will find referenced files by ange-ftp.
      (with-current-buffer compilation-last-buffer
        (set (make-local-variable 'comint-file-name-prefix)
             (format "/plink:%s@%s:" foo-user foo-host))))))
(defun smart-compile-test-tramp-compile()
  (or (and (featurep 'tramp)
           (string-match tramp-file-name-regexp (buffer-file-name))
           (progn
             (if (not (featurep 'tramp-util)) (require 'tramp-util))
             'wcy-tramp-compile))
      'compile))
(defun smart-compile-get-local-file-name(file-name)
  (if (and
       (featurep 'tramp)
       (string-match tramp-file-name-regexp file-name))
      (with-parsed-tramp-file-name file-name foo
        foo-localname)
    file-name))
(defun smart-compile ()
  (interactive)
  (let* ((compile-func (smart-compile-test-tramp-compile))
         (dir (smart-compile-find-make-dir (expand-file-name "."))))
    (funcall compile-func
             (if dir
                 (concat "make -C " dir (if (eq compile-func 'tramp-compile) "&" ""))
               (concat
                (cond
                 ((eq major-mode 'c++-mode) "g++ -g -o ")
                 ((eq major-mode 'c-mode) "gcc -g -o "))
                (smart-compile-get-local-file-name (file-name-sans-extension (buffer-file-name)))
                " "
                (smart-compile-get-local-file-name (buffer-file-name)))))))"))"

(global-set-key (kbd "<f7>") 'smart-compile)

;; C-x C-j open the directory of current buffer
(global-set-key (kbd "C-x C-j")
                (lambda ()
                  (interactive)
                  (if (buffer-file-name)
                      (dired default-directory))))

(setq wcy-shell-mode-directory-changed t)

(defun wcy-shell-mode-auto-rename-buffer-output-filter (text)
  (if (and (eq major-mode 'shell-mode)
           wcy-shell-mode-directory-changed)
      (progn
        (let ((bn  (concat "sh:" default-directory)))
          (if (not (string= (buffer-name) bn))
              (rename-buffer bn t)))
        (setq wcy-shell-mode-directory-changed nil))))


(defun wcy-shell-mode-auto-rename-buffer-input-filter (text)
  (if (eq major-mode 'shell-mode)
      (if ( string-match "^[ \t]*cd *" text)
          (setq wcy-shell-mode-directory-changed t))))
(add-hook 'comint-output-filter-functions 'wcy-shell-mode-auto-rename-buffer-output-filter)
(add-hook 'comint-input-filter-functions 'wcy-shell-mode-auto-rename-buffer-input-filter )
;;exit shell and exit buffer
(add-hook 'shell-mode-hook 'wcy-shell-mode-hook-func)
(defun wcy-shell-mode-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
                            #'wcy-shell-mode-kill-buffer-on-exit)
      )
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))

;(require 'ido)                          ;
;; (ido-mode t)
;; ;ido                    
;; (add-to-list 'load-path
;; "~/.emacs.d/plugins")


(prefer-coding-system 'gbk) ; 此时buffer新建和读取都默认是gbk,也可以M-x prefer-coding-system 只执行一次
(setq default-buffer-file-coding-system 'gbk)

