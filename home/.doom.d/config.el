
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Niklas Herder"
      user-mail-address "niklas.herder@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-oceanic-next)
(setq
 doom-font (font-spec :family "JetbrainsMono Nerd Font")
)


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")
(setq org-agenda-files (list "inbox.org "))

(define-key global-map (kbd "C-c i") 'org-capture-inbox)
;; (setq org-super-agenda-mode 1)
;; (after! org
;;   (setq spacemacs-theme-org-agenda-height nil
;;       org-agenda-time-grid '((daily today require-timed) "----------------------" nil)
;;       org-agenda-skip-scheduled-if-done t
;;       org-agenda-skip-deadline-if-done t
;;       org-agenda-include-deadlines t
;;       org-agenda-include-diary t
;;       org-agenda-block-separator nil
;;       org-agenda-compact-blocks t
;;       org-agenda-start-with-log-mode t)
;;   )

;; Stolen from
;;
;;
;;
(use-package! org-gtd
  :after org
  :demand t
  :custom
  (org-gtd-directory "~/Dropbox/org")
  (org-edna-use-inheritance t)
  :config
  (org-edna-mode)
  :bind
  (("C-c d c" . org-gtd-capture)
   ("C-c d e" . org-gtd-engage)
   ("C-c d p" . org-gtd-process-inbox)
   ("C-c d n" . org-gtd-show-all-next)
   ("C-c d s" . org-gtd-show-stuck-projects)
   :map org-gtd-process-map
   ("C-c c" . org-gtd-choose)))

(after! org
(org-gtd-mode)
  )
;; (use-package! org-super-agenda
;;   :after org-agenda
;;   :init
;;   (setq org-agenda-skip-scheduled-if-done t
;;       org-agenda-skip-deadline-if-done t
;;       org-agenda-include-deadlines t
;;       org-agenda-block-separator nil
;;       org-agenda-compact-blocks t
;;       org-agenda-start-day nil ;; i.e. today
;;       org-agenda-span 1
;;       org-agenda-start-on-weekday nil)
;;   (setq org-agenda-custom-commands
;;         '(("c" "Super view"
;;            ((agenda "" ((org-agenda-overriding-header "")
;;                         (org-super-agenda-groups
;;                          '((:name "Today"
;;                                   :time-grid t
;;                                   :date today
;;                                   :order 1)))))
;;             (alltodo "" ((org-agenda-overriding-header "")
;;                          (org-super-agenda-groups
;;                           '((:log t)
;;                             (:name "To refile"
;;                                    :file-path "todo\\.org")
;;                             (:name "Next to do"
;;                                    :todo "NEXT"
;;                                    :order 1)
;;                             (:name "Important"
;;                                    :priority "A"
;;                                    :order 6)
;;                             (:name "Today's tasks"
;;                                    :file-path "journal/")
;;                             (:name "Due Today"
;;                                    :deadline today
;;                                    :order 2)
;;                             (:name "Scheduled Soon"
;;                                    :scheduled future
;;                                    :order 8)
;;                             (:name "Overdue"
;;                                    :deadline past
;;                                    :order 7)
;;                             (:name "Meetings"
;;                                    :and (:todo "MEET" :scheduled future)
;;                                    :order 10)
;;                             (:discard (:not (:todo "TODO")))))))))))
;;   :config
;;   (org-super-agenda-mode))


;; (after! org
;;   (setq org-agenda-custom-commands
;;       '(("z" "Super agenda view"
;;          ((agenda "" ((org-agenda-span 'day)
;;                       (org-super-agenda-groups
;;                        '((:name "Today"
;;                                 :time-grid t
;;                                 :date today
;;                                 :todo "STRT"
;;                                 :scheduled today
;;                                 :order 1)))))
;;           (alltodo "" ((org-agenda-overriding-header "")
;;                        (org-super-agenda-groups
;;                         '(
;;                           (:name "Important"
;;                            ;; :tag "Important"
;;                            :priority "A"
;;                            :order 6)
;;                           (:name "Due Today"
;;                            :deadline today
;;                            :order 2)
;;                           (:name "Due Soon"
;;                            :deadline future
;;                            :order 8)
;;                           (:name "Overdue"
;;                            :deadline past
;;                            :order 7)
;;                           (:name "Assignments"
;;                            :tag "Assignment"
;;                            :order 10)
;;                           (:name "Issues"
;;                            :tag "issue"
;;                            :order 12)
;;                           (:name "Projects"
;;                            :tag "project"
;;                            :todo "PROJ"
;;                            :order 14)
;;                           (:name "Emacs"
;;                            :tag "Emacs"
;;                            :order 13)
;;                           (:name "Research"
;;                            :tag "Research"
;;                            :order 15)
;;                           (:name "To read"
;;                            :todo nil
;;                            :tag "read"
;;                            :order 30)
;;                           (:name "Waiting"
;;                            :todo "WAIT"
;;                            :order 20)
;;                           (:name "On hold"
;;                            :todo "HOLD"
;;                            :order 20)
;;                           (:name "trivial"
;;                            :priority<= "C"
;;                            :tag ("Trivial" "Unimportant")
;;                            :todo ("IDEA" )
;;                            :order 90)
;;                           (:name "Next to do"
;;                            :todo "TODO"
;;                            :order 1)


;;                           (:discard (:tag ("Chore" "Routine" "Daily")))))))))))
;;   (setq org-super-agenda-mode 1)
;; )

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(use-package! obsidian
  :ensure t
  :demand t
  :config
  (obsidian-specify-path "~/Documents/Obsidian Vault")
  (global-obsidian-mode t)
  :custom
  ;; This directory will be used for `obsidian-capture' if set.
  (obsidian-inbox-directory "Inbox")
  :bind (:map obsidian-mode-map
;; Replace C-c C-o with Obsidian.el's implementation. It's ok to use another key binding.
("C-c C-o" . obsidian-follow-link-at-point)
;; If you prefer you can use `obsidian-insert-link'
("C-c C-l" . obsidian-insert-wikilink)))
