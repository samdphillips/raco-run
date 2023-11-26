#lang info

(define collection "raco-run")
(define deps '("base"))
(define pkg-desc "Run submodules directly")
(define version "1.0")
(define pkg-authors '(samdphillips@gmail.com))
(define license 'Apache-2.0)
(define raco-commands
  '(["run" (submod raco-run runner) "Run submodules directly" 10]))

