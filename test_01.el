(search-forward "point") ;; https://youtu.be/bilY2OYCyfY?t=1308

(defun myfind ()
  (interactive)
 ; (isearch-forward-regexp "[a-z]+")
  (search-forward "//")
  (insert "<a herf=\"\""))

(defun ins ()
  (insert "<a herf=")) ;; не работает

(defvar *cur-style-num* 0)

*cur-style-num*
(evenp 10)

(defun stylize-lis ()
  (interactive)  
  (save-excursion
    (search-forward "li")
    (if (evenp *cur-style-num*) ;; не работает
	(insert " class=\"even-class\"")
    	(insert " class=\"old-class\""))
    (setq *cur-style-num* (1+ *cur-style-num*))))

(global-set-key (kbd "<f9>") 'myfind)
(global-set-key (kbd "<f9>") 'finddiv)

(point)

(defun finddiv ()
  (interactive)
  (search-forward "</div>")
  (insert "\n\n"))

(defun myd()
  (interactive)
  (setq num 0)
  (while (search-forward "</div>"))
  (print (format "myIteration %d." num))
  (setq num (1+ num)))

  


(setq num 0)
(while (< num 4)
  (print (format "Iteration %d." num))
  (setq num (1+ num)))

(while (progn
	 (forward-line 1)
	 (not (looking-at "^$"))))

(setq print-exp (list 'print (current-buffer)))
(eval print-exp)
