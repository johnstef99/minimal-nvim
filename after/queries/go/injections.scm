; extends

(((comment) @comment
  (_ (raw_string_literal) @injection.content ) 
 )
 (#match? @comment "//\\@sql")
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.language "sql")
 (#set! injection.include-childer))

((
  (comment) @comment
  (raw_string_literal) @injection.content
 )
 (#match? @comment "//\\@sql")
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.language "sql")
 (#set! injection.include-childer))
