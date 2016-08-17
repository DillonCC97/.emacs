(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dark-blu)))
 '(custom-safe-themes
   (quote
    ("190565308dd27485b4275ae5deb1af1e798e9de351216e93518bcf7b53783411" default)))
 '(word-wrap nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "brightblue" :foreground "brightblack" :weight extra-bold)))))
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-font-lock-mode t)
(global-set-key "\C-xs" 'save-buffer)
(global-set-key "\C-xv" 'quoted-insert)
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-xf" 'search-forward)
(global-set-key "\C-xc" 'compile)
(global-set-key "\C-xt" 'text-mode);
(global-set-key "\C-xr" 'replace-string);
(global-set-key "\C-xa" 'repeat-complex-command);
(global-set-key "\C-xm" 'manual-entry);
(global-set-key "\C-xw" 'what-line);
(global-set-key "\C-x\C-u" 'shell);
(global-set-key "\C-x0" 'overwrite-mode);
(global-set-key "\C-x\C-r" 'toggle-read-only);
(global-set-key "\C-t" 'kill-word);
(global-set-key "\C-p" 'previous-line);
(global-set-key "\C-u" 'backward-word);
(global-set-key "\C-o" 'forward-word);
(global-set-key "\C-h" 'backward-delete-char-untabify);
(global-set-key "\C-x\C-m" 'not-modified);
(global-set-key "\C-g" 'next-error);
(global-set-key (kbd "M-x") 'smex);
(setq make-backup-files 'nil);
(setq default-major-mode 'text-mode);
(setq text-mode-hook 'turn-on-auto-fill);
(set-default-font "-misc-fixed-medium-r-normal--15-140-*-*-c-*-*-1");
(setq auto-mode-alist (cons '("\\.cxx$" . c++-mode) auto-mode-alist));
(setq auto-mode-alist (cons '("\\.hpp$" . c++-mode) auto-mode-alist));
(setq auto-mode-alist (cons '("\\.tex$" . latex-mode) auto-mode-alist));

;(require 'font-lock)
;(add-hook 'c-mode-hook 'turn-on-font-lock)
;(add-hook 'c++-mode-hook 'turn-on-font-lock)

;(defun my-c-mode-hook () 
;  (linum-mode 1)) 
;(add-hook 'c-mode-hook 'my-c-mode-hook) 

;(defun my-python-mode-hook () 
;  (linum-mode 1)) 
;(add-hook 'python-mode-hook 'my-python-mode-hook) 

;(when (>= emacs-major-version 24)
;  (require 'package)
;  (add-to-list
;   'package-archives
;   '("melpa" . "http://melpa.org/packages/")
;   t)
;  (package-initialize))

(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)
(when (not package-archive-contents)
    (package-refresh-contents))

(load-theme 'dark-blu)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(set-face-foreground 'mode-line nil)
(set-face-background 'mode-line "#333333")
(set-face-background 'mode-line-inactive "5d6687")
;(set-face-background 'mode-line-inactive "#1f222d")

;; enter key indents to previous line

(global-set-key (kbd "TAB") 'insert-tab-char) ; same as Ctrl+i
(global-set-key (kbd "<tab>") 'insert-tab-char)

;; • the syntax (kbd "TAB") corresponds to ASCII 9 control character, which is also equivalent to (kbd "C-i"). At the core, Emacs uses characters with control bits to represent key press.

;; • the syntax (kbd "<tab>") is the tab key, higher level. when emacs is running in GUI, it can distinguish <tab> key vs the ASCII control character ASCII 9.

;; • by default (kbd "<tab>") is translated to (kbd "TAB").

;; example of a function that just insert a tab char
(defun insert-tab-char ()
  "insert a tab char. (ASCII 9, \t)"
  (interactive)
  (insert "\s\s\s\s")
  ;(insert "\t") ;change tab to tab
)

(global-set-key (kbd "RET") 'newline-and-indent)


;; home now goes to first character that isnt whitespace
(global-set-key (kbd "C-a") 'back-to-indentation)

;(defvar my-offset 4 "My indentation offset. ")
;(defun backspace-whitespace-to-tab-stop ()
;    "Delete whitespace backwards to the next tab-stop, otherwise delete one character."
;      (interactive)
;       (if (or indent-tabs-mode
;		          (region-active-p)
;			            (save-excursion
;				                  (> (point) (progn (back-to-indentation)
;								                             ;     (point)))))
;	          (call-interactively 'backward-delete-char-untabify)
;	      (let ((movement (% (current-column) my-offset))
;		              (p (point)))
;		      (when (= movement 0) (setq movement my-offset))
;		            ;; Account for edge case near beginning of buffer
;		            (setq movement (min (- p 1) movement))
;			          (save-match-data
;				            (if (string-match "[^\t ]*\\([\t ]+\\)$" (buffer-;substring-no-properties (- p movement) p))
;						            (backward-delete-char (- (match-end 1) (match-beginning 1)))
;					                (call-interactively 'backward-delete-char))))))
(setq backward-delete-char-untabify-method 'hungry)
(global-set-key (kbd "DEL") 'backward-delete-char-untabify)

;;AutoComplete
(add-to-list 'load-path "~/.emacs.d/lisp")    ; This may not be appeared if you have already added

;;line highlighting
(global-hl-line-mode 1)

;;centered cursor mode
(require 'centered-cursor-mode)

;;set highlight colors
(set-face-background 'hl-line "#333333")
(set-face-foreground 'highlight nil)


;;skip startup
(setq inhibit-splash-screen t
            initial-scratch-message nil
	          initial-major-mode 'org-mode)

;;disable bars
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;;misc
(setq echo-keystrokes 0.1
            use-dialog-box nil
	          visible-bell t)
(show-paren-mode t)

(package-initialize)
(elpy-enable)

(setq linum-format "%d ")

    ;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(defun select-all-tabify ()
  (interactive)
  (lambda ()
  (mark-whole-buffer)
  (tabify)))

(global-set-key (kbd "C-c t") 'select-all-tabify)

;(xclip-mode 1)

(ido-mode 1)
(ido-everywhere 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(setq highlight-symbol-idle-delay 0.3)
(add-hook 'prog-mode-hook #'highlight-symbol-mode)

(package-install 'color-identifiers-mode)
(add-hook 'after-init-hook 'global-color-identifiers-mode)

(add-hook 'text-mode-hook 'flyspell-mode)

;(setq auto-mode-alist
      ;(append
       ;; File name (within directory) starts with a dot.
       ;'(("/\\.[^/]*\\'" . fundamental-mode)
         ;; File name has no dot.
         ;'(("/[^\\./]*\\'" . fundamental-mode)
         ;; File name ends in ‘.C’.
         ;("\\.C\\'" . c++-mode))
          ;auto-mode-alist))



;TODO look into packages: flycheck, semantic, rtags, cmake-ide

;(require 'rtags) ;; optional, must have rtags installed
;(cmake-ide-setup)
