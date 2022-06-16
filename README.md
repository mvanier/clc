# clc

## Overview

`clc` is a combinatory logic calculator.

Combinator expressions are entered as S-expressions.
You can define new combinators in terms of old ones.
There are commands to reduce combinators in various ways.

## Syntax

* Comments
    ; like this
    ;;| literate comment; gets printed out when evaluated

* Variables: 
    x y z ...  ; must start with a lower-case letter

* Combinators: 
    S K I ...  ; must start with an upper-case letter

* Primitive combinators:
    currently S K I B C W M

* Expressions:
    (S K K x)  ; must be surrounded by parentheses;
               ; application associates to the left,
               ; so this is equivalent to: (((S K) K) x)
    Entering an expression makes it the current expression,
    but does not reduce it.

* Definitions:
    def Q (K I)  ; defines new combinator `Q`

* Commands:
    :q     -- quit  (ctrl-D also works)
    :c     -- print current expression
    :s     -- one reduction step (outermost redex)
    :sc X  -- one reduction step (outermost redex, combinator X only)
    :u     -- undo last step
    :n     -- reduce to normal form
    :ms N  -- set maximum reduction step to N before it's considered
              an infinite loop (default = 25)
    
## Usage

$ clc

  - starts a REPL
  
$ clc <filename>

  - runs clc on a file




