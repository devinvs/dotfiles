[
  "import"
  "extern"
  "type"
  "let"
  "in"
  "if"
  "then"
  "else"
  "match"
  "typefn"
  "impl"
] @keyword

[
  "u8"
  "u16"
  "u32"
  "u64"
  "i8"
  "i16"
  "i32"
  "i64"
  "char"
] @type.builtin

[
  "->"
  "="
  "<"
  ">"
  "|"
  "::"
  "+"
  "-"
  "*"
  "/"
  "**"
  "%"
  "<="
  ">="
  "=="
  "!="
  "&"
  "|"
  "^"
  "~"
] @operator

(num) @constant
(str) @string

(type_cons (cons_ident) @constructor)
(pattern (cons_ident) @constructor)

(type_declaration name: (ident) @type)
(type_definition name: (ident) @type)
(type_function name: (ident) @type)

(impl name: (ident) @type)
(impl (type (ident) @type))


(function_definition (expr_ident) @function)
(comment) @comment

(call_expr func: (expr (expr_ident) @function))
