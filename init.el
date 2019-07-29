(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

;;; remove SC if you are not using sunrise commander and org if you like outdated packages
(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of my init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#5f5f5f" "#ff4b4b" "#a1db00" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#ffffff"])
 '(custom-safe-themes
   (quote
    ("5057614f7e14de98bbc02200e2fe827ad897696bfd222d1bcab42ad8ff313e20" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" default)))
 '(ivy-mode t)
 '(org-agenda-files (list org-directory))
 '(org-directory "~/org/agenda")
 '(org-export-backends (quote (ascii beamer html icalendar latex)))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (nov haskell-snippets haskell-mode ox-reveal tile tiling buffer-move cmake-font-lock julia-repl color-identifiers-mode ido-vertical-mode smart-region iedit modern-cpp-font-lock helm-swoop phi-search yapfify markdown-mode json-mode cmake-mode vlf multiple-cursors google-c-style zzz-to-char github-theme counsel-gtags counsel-gtags-mode pretty-mode helm-gtags helm-ggtags helm-gitignore helm ggtags synosaurus gitattributes-mode gitconfig-mode gitignore-mode company-statistics ess-R-data-view ess-view ess-smart-underscore dired-rainbow latex-math-preview graphviz-dot-mode vimrc-mode yaml-tomato yaml-mode logview csv-mode config-general-mode powerthesaurus academic-phrases ox-rss ox-publish ox-html ox-hugo org2web git-timemachine git-gutter yasnippet-snippets which-key use-package undo-tree try switch-window sudo-edit sublimity sphinx-doc spacemacs-theme smooth-scrolling smooth-scroll slime-company scheme-complete rainbow-mode rainbow-delimiters py-yapf popup-kill-ring ox-twbs org-pdfview org-bullets ob-ipython moe-theme material-theme mark-multiple magit lsp-mode linum-relative ledger-import langtool htmlize geiser focus flycheck-clang-analyzer expand-region ess ein dashboard counsel company-shell company-jedi company-irony-c-headers company-irony company-c-headers clang-format avy auctex)))
 '(safe-local-variable-values (quote ((org-confirm-babel-evaluate)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

; LocalWords:  el init emacs config
