" STALKER Neovim colorscheme
" Inspired by STALKER-Theme: muted greens, dark backgrounds, beige text, red accents

if exists('g:colors_name')
  unlet g:colors_name
endif

let g:colors_name = 'stalker'

if has('termguicolors')
  set termguicolors
endif

" Palette
let s:bg        = '#1e2920'   " dark base
let s:bg_alt    = '#3a4d3e'
let s:fg        = '#c9c5b4'   " light beige text
let s:muted     = '#7a8a7d'
let s:green     = '#6f7e6f'   " STALKER green
let s:green2    = '#8b9b8c'
let s:red       = '#cc6666'   " STALKER red
let s:accent    = '#5a6d5b'
let s:unfocused = '#4d4d4d'

" Terminal fallback colors (16-color palette)
let g:terminal_ansi_colors = [ s:bg, '#b22222', s:green, s:muted, '#1e90ff', '#9b30ff', '#00ced1', s:fg, '#2f4f4f', '#ff4500', '#7fff00', '#ffd700', '#00bfff', '#ff69b4', '#40e0d0', '#ffffff' ]

" Clear existing highlights
if exists('syntax_on')
  syntax reset
endif
hi clear

set background=dark

" Basic UI
highlight Normal       guifg=s:fg guibg=s:bg ctermfg=223 ctermbg=233
highlight CursorLine   guibg=s:bg_alt ctermbg=236
highlight Visual       guibg=#2D382E guifg=NONE
highlight LineNr       guifg=s:unfocused guibg=NONE
highlight CursorLineNr guifg=s:muted guibg=NONE
highlight Comment      guifg=s:unfocused gui=italic
highlight Constant     guifg=s:muted
highlight Identifier   guifg=s:green
highlight Statement    guifg=s:green2
highlight PreProc      guifg=s:accent
highlight Type         guifg=s:green
highlight Special      guifg=s:green2
highlight Underlined   guifg=s:green gui=underline
highlight Error        guifg=#ffffff guibg=s:red gui=bold
highlight WarningMsg   guifg=s:red gui=bold
highlight Todo         guifg=s:fg guibg=s:accent gui=bold

" Diff
highlight DiffAdd     guibg=#283329
highlight DiffChange  guibg=#253127
highlight DiffDelete  guibg=#3a3a3a

" Search and Status
highlight Search       guibg=s:muted guifg=s:fg gui=bold
highlight IncSearch    guibg=s:red guifg=#ffffff gui=bold
highlight StatusLine   guibg=s:bg_alt guifg=s:fg gui=bold
highlight StatusLineNC guibg=s:bg guifg=s:unfocused

" LSP / Diagnostics
highlight LspError     guifg=s:red
highlight LspWarning   guifg=s:green2
highlight LspInformation guifg=s:muted
highlight LspHint      guifg=s:accent

" Treesitter defaults (if present)
highlight TSFunction     guifg=s:green
highlight TSMethod       guifg=s:green2
highlight TSVariable     guifg=s:fg
highlight TSProperty     guifg=s:green
highlight TSKeyword      guifg=s:green2
highlight TSString       guifg=s:muted

" GUI-specific (guis)
if has('gui_running')
  highlight Normal       guifg=s:fg guibg=s:bg
  highlight CursorLine   guibg=s:bg_alt
endif

" Terminal fallback: set cterm colors when possible
if !has('gui_running')
  highlight Normal       ctermfg=223 ctermbg=233
endif

" Done
let g:colors_name = 'stalker'