;;; 25-rust.el --- Rust setting

;;; Commentary:

;;; Code:

(autoload 'flycheck-rust-setup "flycheck-rust" nil t)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;;; 25-rust.el ends here
