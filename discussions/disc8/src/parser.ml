open Lexer

(*

    Grammar:

    S -> E + S | E
    E -> n | (S)

*)

(* Types *)

type expr =
| Int of int
| Plus of expr * expr

(* Parsing helpers *)

let tok_list = ref []

(* Returns next token in the list. *)
let lookahead () : token =
  match !tok_list with
  | [] -> raise (Failure "no tokens")
  | h :: t -> h

(* Matches the top token in the list. *)
let match_tok (a : token) : unit =
  match !tok_list with
  | h :: t when a = h -> tok_list := t
  | _ -> raise (Failure "bad match")

(* Parses a token list. *)
let rec parser (toks : token list) : expr =
  tok_list := toks;
  let exp = parse_S () in
  if !tok_list <> [Tok_EOF] then
    raise (Failure "did not reach EOF")
  else
    exp

(* Parses the S rule. *)
and parse_S () : expr = failwith "unimplemented"
            
(* Parses the E rule. *)
and parse_E () : expr = failwith "unimplemented"
