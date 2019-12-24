;;; org-mode.el --- Org-mode config                  -*- lexical-binding: t; -*-

;; Copyright (C) 2019

;; Author:  <niklash@bwian>
;; Keywords: lisp, convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; org-mode base configurations

;;; Code:
(setq org-enforce-todo-checkbox-dependencies t)

(setq org-enforce-todo-dependencies t)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (
              ("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "yellow" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold)
              )
             )
      )

(setq org-use-fast-todo-selection t)


  (setq org-link-file-path-type 'adaptive)
  (require 'org-tempo)
  ;; Allow automatically handing of created/expired meta data.
  (require 'org-expiry)
  ;; Configure it a bit to my liking
 (setq
   ;; Name of property when an item is created
   org-expiry-created-property-name "CREATED"
   ;; Don't show everything in the agenda view
   org-expiry-inactive-timestamps  t)
  (defun mrb/insert-created-timestamp()
    "Insert a CREATED property using org-expiry.el for TODO entries"
    (org-expiry-insert-created)
    (org-back-to-heading)
    (org-end-of-line)
    (insert " "))

  ;; Automatically add tags when state changes occur
  (setq org-todo-state-tags-triggers
        (quote (
                ("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD"))
                )
               )
        )

  (setq org-directory "~/org")
  (setq org-default-notes-file "~/org/inbox.org")

  ;; Source: https://www.suenkler.info/docs/emacs-orgmode/
  (setq org-capture-templates
        (quote(
               ("t" "Todo [inbox]" entry
                (file+headline "~/org/inbox.org" "Tasks")
               "* TODO %i%?")
               ("T" "Tickler" entry
                (file+headline "~/org/tickler.org" "Tickler")
                "* TODO %i%? \n %U")
              ("n" "note" entry (file+headline "~/org/inbox.org" "Notes")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/org/diary.org.gpg")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("m" "Meeting" entry (file+headline "~/org/inbox.org" "Meetings")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file+headline "~/org/inbox.org" "Habits")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
              ("P" "Protocol" entry (file+headline "~/org/inbox.org" "Quotes")
                                     "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
              ("L" "Protocol Link" entry (file+headline "~/org/inbox.org" "Links")
                                     "* %? [[%:link][%:description]] \nCaptured On: %U")
                                    )
        )
)

;; Refiling
(setq org-refile-targets '(
                           ("~/org/GTD.org" :maxlevel . 4)
                           ("~/org/someday.org" :maxlevel . 3)
                           ("~/org/tickler.org" :maxlevel . 3)
                           ("~/org/work/spotify/interviews.org" :maxlevel . 3)
                           )
      )

(setq org-refile-use-outline-path t)

;; Agenda view
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; (defun nh/verify-refile-target ()
;;   "Exclude todo keywords with a done state from refile targets"
;;   (not (member (nth 2 (org-heading-components)) org-done-keywords)))
;; (setq org-refile-target-verify-function 'nh/verify-refile-target)

;; ;; Agenda setup
;; Inspired by https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
(setq org-agenda-files (list
                        "~/org/inbox.org"
                        "~/org/GTD.org"
                        "~/org/someday.org"
                        "~/org/tickler.org"))

(setq org-agenda-custom-commands
      '(("o" "At the office" tags-todo "@office"
         ((org-agenda-overriding-header "Office")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
        ("w" "Work" tags-todo "work"
         ((org-agenda-overriding-header "Work")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
         ("h" "At home" tags-todo "@home"
         ((org-agenda-overriding-header "Home")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
        ("p" "Personal" tags-todo "personal"
         ((org-agenda-overriding-header "Personal")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))

        ))

(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))
 ;; (provide 'org-mode)


;;; org-mode.el ends here
