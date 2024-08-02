# clc2 (THIS BRANCH)

This is a complete refactor of clc.

## Goals

* Combinators defined in the language

* Nicer syntax with Menhir parser

* Extra utilities _e.g._
  conversions from lambda calculus in the language

```
def I x = x ;
def K x y = x ;
def B f g x = f (g x) ;
def C f x y = f y x ;
def W f x = f x x ;
def S f g x = f x (g x) ;
def X x = x K S K ;
def Y x = x S K ;
#n : S K K x ;
--> x
#c ski : \fgx . f x (g x) ;
--> S
```

## Evaluation

### Definitions

1. Convert to AST
2. Expand to IR
3. Convert to deBruijn representation

### Top-level expressions

1. Reduce outermost redex
2. Continue until a normal form is reached
3. Stop after N steps if no normal form is reached
(N can be set).

## Commands

```
// Conversions
#c ski : \fgx . f x (g x) ;

// Normalization
#n : S K K x ;

// Set parameters ;
#max-steps : 1000 ;

// Set working expression
#w : S K K x ;

// One evaluation step of working expression
#s ;
--> K x (K x)
```
