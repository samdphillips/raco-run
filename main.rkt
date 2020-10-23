#lang racket/base

(require racket/string)

(define (build-mod-path mod-string submod-string)
  (define mod
    (cond
      [(and (string-suffix? mod-string ".rkt")
            (file-exists? mod-string))
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

