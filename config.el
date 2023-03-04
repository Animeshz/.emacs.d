(setq org-src-preserve-indentation t
      org-export-preserve-breaks t)

(use-package evil
  :init
    (setq evil-want-keybinding nil)
    ; (setq evil-undo-system 'undo-fu)
  :config
    (evil-mode 1))

(setq ;evil-move-cursor-back nil
      evil-want-fine-undo t
      ;evil-move-beyond-eol t
      evil-respect-visual-line-mode t         ;; I don't know why this does not work and keep the visual selection after one indentation
      evil-org-retain-visual-state-on-shift t
      evil-vsplit-window-right t
      evil-split-window-below t)

  (use-package general
    :after evil
    :config
    (general-evil-setup t)

    ;; Remap C-h to helpful 
    (general-define-key
       :prefix "C-h"
       "f" #'helpful-callable
       "v" #'helpful-variable
       "k" #'helpful-key
       "F" #'helpful-function
       "C" #'helpful-command)

    (general-define-key
        :states '(normal motion visual operator)
        "C-+" '(text-scale-increase :which-key "")
        "C--" '(text-scale-decrease :which-key "")
        "go" '(avy-goto-word-0 :which-key "avy goto word")
        "gl" '(avy-goto-char :which-key "avy goto letter"))
    
    (general-define-key
      :states '(normal visual)
      "H" 'evil-beginning-of-line
      "J" 'evil-goto-line
      "K" 'evil-goto-first-line
      "L" 'evil-end-of-line
      "," 'evil-scroll-line-down
      "." 'evil-scroll-line-up)
    
    (general-define-key
      :states '(insert)
      "C-S-v" 'evil-paste-after))

(use-package parinfer-rust-mode
    :hook emacs-lisp-mode
    :init
    (setq parinfer-rust-auto-download t))

(use-package vertico
  :init
  (setq vertico-count 20
	vertico-resize nil
	vertico-cycle t)
  (vertico-mode))

(use-package orderless
  :custom
  ;; (orderless-matching-styles '(orderless-literal orderless-regexp orderless-flex))
  (completion-styles '(orderless))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package helpful)
(use-package avy
     :config
     (setq avy-background t)
     (avy-setup-default))
(elpaca-wait)
