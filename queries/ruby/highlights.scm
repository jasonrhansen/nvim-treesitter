; Keywords

[
 "alias"
 "and"
 "begin"
 "break"
 "class"
 "def"
 "do"
 "end"
 "ensure"
 "in"
 "module"
 "next"
 "or"
 "rescue"
 "retry"
 "return"
 "then"
 "yield"
 ] @keyword

[
 "case"
 "else"
 "elsif"
 "if"
 "unless"
 "when"
 ] @conditional

[
 "for"
 "until"
 "while"
 ] @repeat


((identifier) @keyword
 (#match? @keyword "^(private|protected|public)$"))

; Function calls

((identifier) @function
 (#eq? @function "require"))

"defined?" @method

(call
  [
   receiver: (constant) @constant
   method: [
            (identifier)
            (constant)
            ] @method
   ])

(method_call
  [
   receiver: (constant) @constant
   method: [
            (identifier)
            (constant)
            ] @method
   ])

; Function definitions

(alias (identifier) @method)
(setter (identifier) @function)

(method name: [
               (identifier) @method
               (constant) @constant
               ])

(singleton_method name: [
                         (identifier) @method
                         (constant) @constant
                         ])

(class name: (constant) @constant)

; Identifiers
[
 (class_variable)
 (instance_variable)
 ] @property

((identifier) @constant.builtin
 (#match? @constant.builtin "^__(FILE|LINE|ENCODING)__$"))

((constant) @constant.macro
 (#match? @constant.macro "^[A-Z\\d_]+$"))

(constant) @constant

[
 (self)
 (super)
 ] @variable.builtin

(method_parameters (identifier) @parameter)
(lambda_parameters (identifier) @parameter)
(block_parameters (identifier) @parameter)
(splat_parameter (identifier) @parameter)
(hash_splat_parameter (identifier) @parameter)
(optional_parameter (identifier) @parameter)
(destructured_parameter (identifier) @parameter)
(block_parameter (identifier) @parameter)
(keyword_parameter (identifier) @parameter)

; TODO: Re-enable this once it is supported
; ((identifier) @function
;  (#is-not? local))

; Literals

[
 (string)
 (bare_string)
 (subshell)
 (heredoc_body)
 ] @string

[
 (bare_symbol)
 (heredoc_beginning)
 (heredoc_end)
 (symbol)
 ] @keyword

(pair key: (symbol) ":" @keyword)
(regex) @string.regex
(escape_sequence) @string.escape
(integer) @number
(float) @float

[
 (nil)
 (true)
 (false)
 ] @boolean

(interpolation
  "#{" @punctuation.bracket
  "}" @punctuation.bracket) @embedded

(comment) @comment

; Operators

[
 "="
 "=>"
 "->"
 "+"
 "-"
 "*"
 "/"
 ] @operator

[
 ","
 ";"
 "."
 ] @punctuation.delimiter

[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
 "%w("
 "%i(" 
 ] @punctuation.bracket

(ERROR) @error
