#lang racket/base

(require racket/string)

(define (file-has-lang? file-name)
  (define (check-shebang inp)
    (cond
      [(equal? #"#!" (read-bytes 2 inp))
       (read-bytes-line inp)
       (check-lang inp)]
      [else
       (check-lang inp)]))
  (define (check-lang inp)
    (equal? #"#lang" (read-bytes 5 inp)))
  (call-with-input-file file-name check-shebang))

(define (build-mod-path mod-string submod-string)
  (define mod
    (cond
      [(and (file-exists? mod-string) (file-has-lang? mod-string))
       mod-string]
      [else
        (string->symbol mod-string)]))
  (unless (module-path? mod)
    (error 'raco-run "module ~a must be a valid module-path?" mod))
  (list 'submod mod (string->symbol submod-string)))

(define (run mod submod args)
  (define mod-path (build-mod-path mod submod))
  (parameterize ([current-command-line-arguments (list->vector args)])
    (dynamic-require mod-path #f)))

(module* runner #f
  (require racket/cmdline
           raco/command-name)

  (command-line
    #:program (short-program+command-name)
    #:args (mod submod . args)
    (run mod submod args)))

