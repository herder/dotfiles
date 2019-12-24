;;; org-protocol.el --- org-protocol: capture links and snippets  -*- lexical-binding: t; -*-

;; Copyright (C) 2019

;; Author:  <niklash@bwian>
;; Keywords: lisp

(require 'org-protocol)
(server-start)
(with-eval-after-load 'org
  (add-to-list 'org-modules 'org-protocol)
  )
