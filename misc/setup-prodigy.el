;; require packages '(prodigy)

(prodigy-define-tag
  :name 'octopress
  :env '(("LANG" "en_US.UTF-8")
         ("LC_ALL" "en_US.UTF-8")))

(prodigy-define-service
  :name "Octopress preview"
  :command "bundle"
  :args '("exec" "rake" "preview")
  :cwd "~/current/octopress"
  :tags '(octopress)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(provide 'setup-prodigy)
