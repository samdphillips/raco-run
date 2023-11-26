#lang info

(define collection "raco-run")
(define deps '("base" "raco-run-cmd"))
(define build-deps '("scribble-lib" "racket-doc"))
(define implies '("raco-run-cmd"))
(define scribblings '(("scribblings/raco-run.scrbl" ())))
(define pkg-desc "Run submodules directly")
(define version "1.0")
(define pkg-authors '(samdphillips@gmail.com))
(define license 'Apache-2.0)
