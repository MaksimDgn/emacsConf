;; XahTV 2020-07-15 emacs and elisp - https://youtu.be/uryBq7Kib0s
(defun xah-html-remove-list ()
  "Remove HTML ul li list tags.
version 2020-07-15"
  (interactive)
  (let (p1 p2)
;;    (setq p1)
    ;; (set p1
    ;; 	 (progn
    ;; 	 (search-backward "\n\n")
    ;; 	 (forward-char 2)
    ;; 	 (point)))
    ;; (set p1
    ;; 	 (progn
    ;; 	 (search-forward "\n\n")
    ;; 	 (forward-backward "\n\n")
    ;; 	 (point)))

    (save-excursion
      (if (region-active-p)
          (progn
            (setq p1 (region-beginning))
            (setq p2 (region-end)))
        (progn
          (skip-chars-forward " \n\t")
          (when (re-search-backward "\n[ \t]*\n" nil "move")
            (re-search-forward "\n[ \t]*\n"))
          (setq p1 (point))
          (re-search-forward "\n[ \t]*\n" nil "move")
          (re-search-backward "\n[ \t]*\n" )
          (setq p2 (point)))))
	
    (save-restriction
      (narrow-to-region p1 p2)

      (goto-char 1)
      (while (search-forward "<ul>" nil t) (replace-match "" ))

      (goto-char 1)
      (while (search-forward "</ul>" nil t) (replace-match "" ))
      
      (goto-char 1)
      (while (search-forward "<ol>" nil t) (replace-match "" ))

      (goto-char 1)
      (while (search-forward "</ol>" nil t) (replace-match "" ))

      (goto-char 1)
      (while (search-forward "<li>" nil t) (replace-match "" ))

      (goto-char 1)
      (while (search-forward "</li>" nil t) (replace-match "" )))))
     
