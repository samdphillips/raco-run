#lang info

(define collection "raco-run")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/raco-run.scrbl" ())))
(define pkg-desc "Run submodules directly")
(define version "0.2")
(define pkg-authors '(samdphillips@gmail.com))
(define license 'Apache-2.0)
(define raco-commands
  '(["run" (submod raco-run runner) "Run submodules directly" 10]))

