;;EDITOR SETTINGS PARAMETERS
(setq ring-bell-function 'ignore) ;; disable audio bell

;;PACKAGE SETTINGS + PLUG
  (add-to-list 'load-path "/some/path/neotree")
 
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'ivy))
  ;;(setq neo-theme 'nerd)

  (setq neo-window-fixed-size nil)
  (setq neo-window-width 20)

;;dashboard
(require 'dashboard)

(setq dashboard-startup-banner "C:/Users/lupol/AppData/Roaming/.emacs.d/IMG/emacslogo.png")

(dashboard-setup-startup-hook)

(setq dasboard-projects-backend 'projectile)
(setq dashboard-items '("C:/Users/lupol/Desktop"))
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)))

(setq dashboard-center-content t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-heading-icons t)

;;telephone-line
(require 'telephone-line)
(setq telephone-line-lhs
      '((evil   . (telephone-line-evil-tag-segment))
        (accent . (telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment
                   telephone-line-process-segment))
        (nil    . (telephone-line-minor-mode-segment
                   telephone-line-buffer-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-misc-info-segment))
        (accent . (telephone-line-major-mode-segment))
        (evil   . (telephone-line-airline-position-segment))))
(telephone-line-mode 1)

;;gdscript-mode
(require 'gdscript-mode)
(setq gdscript-godot-executable "E:/GodotEngine/Godot_v4.0.2-stable_win64.exe")
(defun lsp--gdscript-ignore-errors (original-function &rest args)
  "Ignore the error message resulting from Godot not replying to the `JSONRPC' request."
  (if (string-equal major-mode "gdscript-mode")
      (let ((json-data (nth 0 args)))
        (if (and (string= (gethash "jsonrpc" json-data "") "2.0")
                 (not (gethash "id" json-data nil))
                 (not (gethash "method" json-data nil)))
            nil ; (message "Method not found")
          (apply original-function args)))
    (apply original-function args)))
;; Runs the function `lsp--gdscript-ignore-errors` around `lsp--get-message-type` to suppress unknown notification errors.
(advice-add #'lsp--get-message-type :around #'lsp--gdscript-ignore-errors)

;;GLOBALS
(setq linum-format "%3s")
(add-hook 'prog-mode-hook 'linum-mode)

;;KEYBINDINGS
;;resizing windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "C-x +") 'balance-windows)


;;ALIASES
(defalias 'ff 'find-file)
(defalias 'swh 'split-window-horizontally)
(defalias 'swv 'split-window-vertically)
(defalias 'kwab 'kill-buffer-and-window)
(defalias 'kb 'kill-buffer)
  

;;MELPA STUFF
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-challenger-deep))
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "4d844092dbec5c6fa347ca02c988ed99378b9e05de86a4d437de6370c78633df" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c" "70b596389eac21ab7f6f7eb1cf60f8e60ad7c34ead1f0244a577b1810e87e58c" "ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da" "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410" "2f8eadc12bf60b581674a41ddc319a40ed373dd4a7c577933acaff15d2bf7cc6" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" "c865644bfc16c7a43e847828139b74d1117a6077a845d16e71da38c8413a5aaa" "51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138" "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "89d9dc6f4e9a024737fb8840259c5dd0a140fd440f5ed17b596be43a05d62e67" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "4fda8201465755b403a33e385cf0f75eeec31ca8893199266a6aeccb4adedfa4" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "a138ec18a6b926ea9d66e61aac28f5ce99739cf38566876dc31e29ec8757f6e2" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "f458b92de1f6cf0bdda6bce23433877e94816c3364b821eb4ea9852112f5d7dc" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "d395c1793e0d64797d711c870571a0033174ca321ed48444efbe640bf692bf4f" "eb7cd622a0916358a6ef6305e661c6abfad4decb4a7c12e73d6df871b8a195f8" "f82e68d489e6c21c9552c4e8e35a03d126d9eba632a8e7b4f9329d1374b4a19c" "11873c4fbf465b956889adfa9182495db3bf214d9a70c0f858f07f6cc91cbd47" "b2779867957a4b9de84bcd33c5ded92e943c710c4c5c5b7fc874786eaf63ca5c" default))
 '(package-selected-packages
   '(doom-themes spacemacs-theme lsp-mode all-the-icons-ivy dashboard projectile page-break-lines all-the-icons-ivy-rich filetree neotree dirtree telephone-line gdscript-mode modus-themes))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(put 'upcase-region 'disabled nil)
