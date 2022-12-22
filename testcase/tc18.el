;;; tc18.el ---   -*- lexical-binding:t -*-

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

(with-temp-buffer
  (insert-file-contents "tc18.html")
  (goto-char (point-min))
  (search-forward "em class")
  (sgml-change-element-name "B")
  (beginning-of-line 1)
  (cl-assert (looking-at ".* class="))
  )
