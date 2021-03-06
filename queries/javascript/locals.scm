; Scopes
;-------

(statement_block) @scope
(function) @scope
(arrow_function) @scope
(function_declaration) @scope
(method_definition) @scope
(for_statement) @scope
(for_in_statement) @scope
(catch_clause) @scope

; Definitions
;------------

(formal_parameters
  (identifier) @definition.var)

(formal_parameters
  (object_pattern
    (identifier) @definition.var))

; function(arg = []) {
(formal_parameters
  (assignment_pattern
    (shorthand_property_identifier) @definition.var))

(formal_parameters
  (object_pattern
    (shorthand_property_identifier) @definition.var))

(formal_parameters
  (array_pattern
    (identifier) @definition.var))

(formal_parameters
  (rest_parameter
    (identifier) @definition.var))

(variable_declarator
  name: (identifier) @definition.var)

(import_specifier
  (identifier) @definition.import)

; References
;------------

(identifier) @reference
(shorthand_property_identifier) @reference
