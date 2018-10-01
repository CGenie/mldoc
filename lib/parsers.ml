open Angstrom

let is_space = function ' ' | '\t' -> true | _ -> false

let non_space c = not (is_space c)

let is_eol = function '\r' | '\n' -> true | _ -> false

let is_hex = function
  | '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' -> true
  | _ -> false

let is_digit = function '0' .. '9' -> true | _ -> false

let digits = take_while1 is_digit

let spaces = skip_while is_space

let lex p = p <* spaces

let optional p = option None (lift (fun x -> Some x) p)

let optional_list p = option [] p

let lift5 f a b c d e = lift4 f a b c d <*> e
