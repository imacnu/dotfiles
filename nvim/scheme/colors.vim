"let g:material_terminal_italics = 1
"let g:material_theme_style = 'palenight'

if (has("termguicolors"))
 set termguicolors
endif
syntax on
syntax enable

function SetItalics() abort
  hi Comment gui=italic
  hi Keyword gui=italic
  hi Keyword gui=italic
  hi Identifier gui=italic
  hi StorageClass gui=italic
  hi jsLineComment gui=italic
  hi xmlAttrib gui=italic
  hi htmlArg gui=italic
  hi pythonSelf gui=italic
  hi htmlArg gui=italic
endfunction
function SetCocExplorerColors() abort
  hi CocExplorerFileFullpath guifg=#f1c40f guibg=NONE
  hi CocExplorerFilename guifg=#f1c40f guibg=NONE
  hi CocExplorerFileDirectory guifg=#5fb3b2 guibg=NONE
  hi CocExplorerFileDirectoryExpanded guifg=#16a085 guibg=NONE
  hi CocExplorerFileDirectoryCollapsed guifg=#bdc3c7 guibg=NONE
endfunction
function SetStartifyColors() abort
  hi StartifyNumber  guifg=#f9ca24
  hi StartifyPath    guifg=#88C0D0
  hi StartifyNumber  guifg=#f9ca24
  hi StartifySlash   guifg=#16a085
  hi StartifyBracket guifg=#16a085
  hi StartifySpecial guifg=9
endfunction
autocmd ColorScheme * call SetItalics()
autocmd ColorScheme * call SetCocExplorerColors()
autocmd ColorScheme * call SetStartifyColors()
colorscheme night-owl "moonlight | nova | synthwave84
let g:nord_bold = 1
"let g:oceanic_italic_comments = 1
"let g:oceanic_bold = 1
"let g:lightline = { 'colorscheme': 'oceanicnext' }
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:oceanic_for_polyglot = 1
set background=dark


"source $HOME/.config/nvim/colors/colors.vim
"autocmd InsertLeave * hi Normal guibg=#4D4D4DA
"autocmd InsertLeave * hi Normal guibg=#212337
let g:terminal_color_0 = "#282828"
let g:terminal_color_1 = "#cc241d"
let g:terminal_color_2 = "#16a085"
let g:terminal_color_3 = "#e74c3c"
let g:terminal_color_4 = "#f1c40f"
let g:terminal_color_5 = "#b16286"
let g:terminal_color_6 = "#16a085"
let g:terminal_color_7 = "#34495e"
let g:terminal_color_8 = "#928374"
let g:terminal_color_9 = "#16a085"
let g:terminal_color_10 = "#b8bb26"
let g:terminal_color_11 = "#f1c40f"
let g:terminal_color_12 = "#83a598"
let g:terminal_color_13 = "#d3869b"
let g:terminal_color_14 = "#8ec07c"
let g:terminal_color_15 = "#ebdbb2"


