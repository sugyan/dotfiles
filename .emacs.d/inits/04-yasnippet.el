;;; Yasnippet
;; (package-install 'yasnippet)
(require 'yasnippet)
(custom-set-variables
 '(yas-snippet-dirs '("~/.emacs.d/etc/snippets")))
(yas-global-mode t)

(define-key yas-minor-mode-map (kbd "M-i") 'yas-expand)

;; helm interface
;; http://d.hatena.ne.jp/syohex/20121207/1354885367
(eval-after-load "helm"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
       (let* ((names (loop for choice in choices
                           collect (or (and display-fn (funcall display-fn choice))
                                       choice)))
              (selected (helm-other-buffer
                         `(((name . ,(format "%s" prompt))
                            (candidates . names)
                            (action . (("Insert snippet" . (lambda (arg) arg))))))
                         "*helm yas/prompt*")))
         (if selected
             (let ((n (position selected names :test 'equal)))
               (nth n choices))
           (signal 'quit "user quit!"))))
     (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))))

;; snippet-mode for *.yasnippet files
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))
