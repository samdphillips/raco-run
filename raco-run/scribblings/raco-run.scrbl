#lang scribble/manual

@(require (for-label raco-run
                     racket)
          scribble/bnf)

@;; cribbed from https://github.com/racket/racket/blob/master/pkgs/racket-doc/pkg

@title{raco-run}
@author[(author+email "Sam Phillips" "samdphillips@gmail.com")]

@defmodule[raco-run]

@url{https://github.com/samdphillips/raco-run}

Provides a @exec{raco run} sub-command for executing submodules.

@list{
  @list{
    @section[#:tag "raco-run-cmd"]{@exec{raco run}}
    @seclink[#:underline? #f "raco-run-cmd"]{@exec{raco run}}}}
@nonterm{module} @nonterm{submodule} @nonterm{arguments} ...
--- Runs the @nonterm{submodule} of @nonterm{module} setting
@racket[current-command-line-arguments] to @nonterm{arguments}.  If
@nonterm{module} appears to be a file path (the name ends with @racket{.rkt}
and is a file that exists) then that file is used as the parent module.
Otherwise the @nonterm{module} is treated as a collection path.
