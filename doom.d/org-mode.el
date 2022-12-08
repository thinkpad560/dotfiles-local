;;; config.el -*- lexical-binding: t; -*-

;; key binding
(global-set-key (kbd "C-c b") 'org-switchb)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

;; butllets
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; capture templates
(setq org-directory "~/org/gtd")
;; doom already set the different org file for various type tasks!
;; (setq org-default-notes-file "~/org/refile.org")

;; I use C-c c to start capture mode
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
;; (setq org-capture-templates
;;       (quote (("t" "todo" entry (file "~/org/refile.org")
;;                "* TODO %i\n%?\n%U\n%a\n" :clock-in t :clock-resume t)
;;               ("r" "respond" entry (file "~/org/refile.org")
;;                "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
;;               ("n" "note" entry (file "~/org/refile.org")
;;                "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
;;               ("j" "Journal" entry (file+datetree "~/org/diary.org")
;;                "* %?\n%U\n" :clock-in t :clock-resume t)
;;               ("w" "org-protocol" entry (file "~/org/refile.org")
;;                "* TODO Review %c\n%U\n" :immediate-finish t)
;;               ("m" "Meeting" entry (file "~/org/refile.org")
;;                "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
;;               ("p" "Phone call" entry (file "~/org/refile.org")
;;                "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
;;               ("e" "email" entry (file "~/org/refile.org")
;;                "* EMAIL %? :EMAIL:\n%U" :clock-in t :clock-resume t)
;;               ("h" "Habit" entry (file "~/org/refile.org")
;;                "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
(setq org-log-done 'note)

;; Remove empty LOGBOOK drawers on clock out
;; defun bh/remove-empty-drawer-on-clock-out ()
;;   (interactive)
;;   (save-excursion
;;     (beginning-of-line 0)
;;     (org-remove-empty-drawer-at "LOGBOOK" (point))))

;; (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)

;; agenda files
(setq org-agenda-files (quote ("~/org/gtd")))
;; '(org-agenda-files
;;   '("~/org/4.Notes/RdNotes/emacs.org"
;;     "~/org/4.Notes/RdNotes/org-mode-howto.org"
;;     "/Users/liuxin/org/gtd/2020work.org"
;;     "/Users/liuxin/org/gtd/agnda.org"
;;     "/Users/liuxin/org/gtd/projects.org")
;; )

(after! org
  (use-package! org-super-agenda
    :after org-agenda
    :init
    (setq org-super-agenda-groups '((:name "Today"
                                            :time-grid t
                                            :scheduled today)
                                    (:name "Due today"
                                            :deadline today)
                                    (:name "Important"
                                            :priority "A")
                                    (:name "Overdue"
                                            :deadline past)
                                    (:name "Due soon"
                                            :deadline future)))
    :config
    (org-super-agenda-mode)
    )
)

(after! org
  (use-package! org-journal
  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (bind-key "C-c j" 'org-journal-new-entry)
  :config
  (setq org-journal-file-type `yearly)
  (defun org-journal-file-header-func (time)
    "Custom function to create journal header."
    (concat
     (pcase org-journal-file-type
       (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything\n")
       (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded\n")
       (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded\n")
       (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded\n"))))

  (setq org-journal-file-header 'org-journal-file-header-func)
  ))

;; This setup is tested on Emacs 24.3 & Emacs 24.4 on Linux/OSX
;; org v7 bundled with Emacs 24.3
(setq org-export-odt-preferred-output-format "doc")
;; org v8 bundled with Emacs 24.4
(setq org-odt-preferred-output-format "doc")
;; BTW, you can assign "pdf" in above variables if you prefer PDF format

;; Only OSX need below setup
(defun my-setup-odt-org-convert-process ()
  (interactive)
  (let ((cmd "/Applications/LibreOffice.app/Contents/MacOS/soffice"))
    (when (and (eq system-type 'darwin) (file-exists-p cmd))
      ;; org v7
      (setq org-export-odt-convert-processes '(("LibreOffice" "/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to %f%x --outdir %d %i")))
      ;; org v8
      (setq org-odt-convert-processes '(("LibreOffice" "/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to %f%x --outdir %d %i"))))
    ))
(my-setup-odt-org-convert-process)

(after! org
  (use-package! ox-pandoc
    :defer t
    :config
    (setq org-pandoc-options-for-latex-pdf '((pdf-engine . "xelatex")))
    )
  )

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   ))
