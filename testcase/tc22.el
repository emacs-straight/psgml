;;; tc22.el ---   -*- lexical-binding:t -*-

;; Copyright (C)  2017 Free Software Foundation, Inc.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


(require 'psgml-parse)
(require 'cl-lib)

(let ((sgml-ecat-files '("tc22.ecat"))
      (dd default-directory))
  (save-current-buffer 
    (dolist (buf (buffer-list))
      (set-buffer buf)
      (when (and sgml-buffer-parse-state
                 (sgml-pstate-dtd sgml-buffer-parse-state)
                 (sgml-dtd-merged (sgml-pstate-dtd sgml-buffer-parse-state)))
        (kill-buffer buf))))
  (ignore-errors (delete-file "/tmp/tc22.cdtd"))
  (switch-to-buffer (generate-new-buffer "tc22 temp"))
  (setq default-directory dd)
  (insert-file-contents "tc22.sgml")
  (sgml-mode)
  (sgml-load-doctype)
)
