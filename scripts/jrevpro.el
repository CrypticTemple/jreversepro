(defcustom jrevpro-script "jrevpro"
  "Full path to the jrevpro script."
  :tag "JReversePro script"
  :group 'jrevpro
  :type 'string)

(defun jrevpro-decompile ()
  "Decompiles the current buffer."
  (interactive)
  (call-process-region 
   (point-min)
   (point-max)
   jrevpro-script
   t
   t
   nil
   "-i"
   (buffer-file-name)
   "-d")
  (beginning-of-buffer)
  (set-visited-file-name nil)
  (setq buffer-read-only t)
  (set-buffer-modified-p nil)
  (java-mode))

(add-hook
 'find-file-hook
 (lambda ()
   (cond ((string-match "\\.class$" (buffer-file-name))
          (jrevpro-decompile)))))
