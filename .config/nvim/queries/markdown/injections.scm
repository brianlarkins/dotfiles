; Override nvim-treesitter's `master` branch copy of this query, which uses the
; `#set-lang-from-info-string!` directive. That directive's handler treats a
; match capture as a single TSNode, but Neovim >= 0.11 passes a TSNode[], so it
; errors out and kills all markdown injection (and thus all render-markdown
; rendering) in any buffer containing a fenced code block.
;
; This is a verbatim copy of Neovim's own runtime query, which matches what
; nvim-treesitter `main` ships. Delete this file if nvim-treesitter is ever
; migrated from the `master` branch to `main`.

(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
