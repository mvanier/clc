(** Types. *)

(** Identifiers. *)
type id = string

(** Commands. *)
type cmd =
  (* Print the current expression. *)
  | Curr
  (* evaluate to a normal form *)
  | Norm
  (* evaluate outermost redex only *)
  | Step
  (* take N steps *)
  | StepN of int
  (* evaluate outermost redex starting with a particular combinator *)
  | StepC of atom
  (* evaluate Nth outermost redex starting with a particular combinator *)
  | StepCN of atom * int
  (* Set the maximum number of steps in a reduction. *)
  | MaxSteps of int
  (* Undo last reduction. *)
  | Undo
  (* Quit the calculator. *)
  | Quit

(** Primitive combinators. *)
and prim = S | K | I | B | C | W | M

and atom =
  | Prim of prim
  | Comb of id
  | Var of id

type expr =
  | Atom of atom
  | List of expr list

type expr2 =
  | Atom2 of atom
  | Pair  of expr2 * expr2

type form =
  | Def  of id * expr
  | Expr of expr
  | Cmd  of cmd
  | Txt  of string

type env = (id, expr2) Hashtbl.t

val string_of_prim : prim -> string

val string_of_atom : atom -> string

val string_of_atom_explicit : atom -> string

val string_of_expr : expr -> string

val string_of_expr_explicit : expr -> string

val string_of_expr2 : expr2 -> string

val string_of_form : form -> string
