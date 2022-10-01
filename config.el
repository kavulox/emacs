;; Require blocks
(require 'evil)
(require 'yasnippet)
(require 'general)
(require 'beacon)
(require 'tree-sitter)
(require 'tree-sitter-langs)
(setq warning-minimum-level :emergency)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(setq use-short-answers t)
;; theme
(setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
(load-theme 'dracula t)
(add-to-list 'default-frame-alist '(font . "Inconsolata-17"))
;; load with emacsclient
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
;; disable all menu bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(tab-bar-mode -1)
(scroll-bar-mode -1) 

; line numbers
(setq display-line-numbers-type 'relative)
;; Map "C-c to C-g
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-c") 'evil-normal-state)
(define-key key-translation-map (kbd "C-c C-c") (kbd "C-g"))

;; Dump to .tmp
(setq temporary-file-directory "~/.tmp/")
 (setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
;;(setq auto-save-file-name-transforms
;;      `((".*" ,temporary-file-directory t)))
(setq auto-save-default nil)


;; Save quit with evil, dont actually quit
(defun save-and-kill-this-buffer()
  (interactive)
  (save-buffer)
  (kill-current-buffer))
(defun quit-buffer()
  (interactive)
  (kill-current-buffer))
; > the actual mappings
(evil-ex-define-cmd "wq" 'save-and-kill-this-buffer)
(evil-ex-define-cmd "q" 'quit-buffer)
;; Set the title
;; Set the banner

;; smooth scrolling
(setq sublimity-scroll-weight 5
      sublimity-scroll-drift-length 5)
;; for vim like tab
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
	
(yas-global-mode 1)
 (tree-sitter-require 'cpp)
(tree-sitter-require 'c)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; lsp
;; Autopair
(defun electric-pair ()
      "If at end of line, insert character pair without surrounding spaces.
    Otherwise, just insert the typed character."
  (interactive)
  (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))
(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-map "\"" 'electric-pair)
            (define-key c-mode-map "\'" 'electric-pair)
            (define-key c-mode-map "(" 'electric-pair)
            (define-key c-mode-map "[" 'electric-pair)
            (define-key c-mode-map "{" 'electric-pair)))
(setq-default auto-save-no-message t)
;; ex
(setq use-dialog-box nil)
;; simple fix
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))
;; smooth scrolling
(setq sublimity-scroll-weight 5
      sublimity-scroll-drift-length 5)
;; for vim like tab
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)      
