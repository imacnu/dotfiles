" Config
source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/main/keybindings.vim
source $HOME/.config/nvim/main/main.vim
source $HOME/.config/nvim/scheme/colors.vim
" ================ MAIN ============
set autochdir
set autoindent
set cindent
set clipboard=unnamedplus
set expandtab
set hidden
set ignorecase
set incsearch
set mouse=a
set nobackup
set nohlsearch
set noswapfile
set nowb
set number
set number relativenumber
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=0
"set spelllang=en,es
set tabstop=2
set title
set wildmenu
if (has("termguicolors"))
set termguicolors
endif
"Hybrid relative lines
augroup numbertoggle
autocmd!
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
highlight Comment ctermbg=DarkGray
let buffet_use_devicons = 1
let loaded_netrwPlugin = 1
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

" AutoPairskk
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','<':'>'}
"================================================================ FLOATERM =====================yy=================================================
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
"================================================================ TERMINAL =================================================
" Terminal
set splitright
set splitbelow
tnoremap <Esc> <C-\><C-n>
map <S-t> :vert :term<CR>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <leader>n :call OpenTerminal()<CR>

let g:toggleterm_terminal_mapping = '<C-t>'

"================================================================ AIRLINE ================================================
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
let g:airline_theme='onedark'
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
let g:lightline = {
      \ 'colorscheme': 'nord',
      \   'active': {
      \     'left':[ [ 'mode', 'paste'],
      \              [ 'gitbranch',  'fugitive', 'readonly', 'filename', 'modified' ],
      \     ]
      \   },
      \   'component': {
      \     'lineinfo': ' %3l:%-2v',
      \   },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let g:lightline.separator = {
  \   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
  \   'left': '', 'right': '|'
  \}
let g:lightline.tabline = {
  \   'left': [ ['tabs'], ],
  \   'right': [ ['buffers'] ]
  \ }
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#ordinal_separator = ' | '
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" ============================================================== COC autocomplete config =============================================
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"  Navigate autocomplete options
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"  autocomplete snippets as VSCode
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Formatting selected code.
vmap <C-f> <Plug>(coc-format-selected)
nmap <C-f> <Plug>(coc-format-selected)

"======================================================================= STARTTIFY ==================================================================================
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" 'Most Recent Files' number
let g:startify_files_number           = 20

" Update session automatically as you exit vim
let g:startify_session_persistence    = 1
let g:startify_session_autoload = 1
let g:startify_change_to_vcs_root = 1
let g:startify_enable_special = 0

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': function('s:gitModified'),  'header': [' ============== Git Modified =====================']},
          \ { 'type': function('s:gitUntracked'), 'header': [' =============  Git Untracked ====================']},
          \ ]

let g:startify_bookmarks = [
            \ { 'a': '/Users/malvarez/Desktop/Components/bbva-web-components-app' },
            \ { 'f': '/Users/malvarez/Desktop/Components/bbva-web-components-fork' },
            \ { 'g': '/Users/malvarez/Desktop/Components/Glomo/glomo-pe' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 's': '~/.config/coc/ultisnips/javascript.snippets' },
            \ { 'p': '~/.config/nvim/plugins/plugins.vim' },
            \ { 'y': '~/.config/nvim/main/keybindings.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'r': '/Users/malvarez/qmk_firmware/keyboards/lily58/keymaps/custom-config/keymap.c' },
            \ ]
" Fancy custom header
let g:startify_custom_header = [
  \ "  ",
  \ '   ╻ ╻   ╻   ┏┳┓',
  \ '   ┃┏┛   ┃   ┃┃┃',
  \ '   ┗┛    ╹   ╹ ╹',
  \ '   ',
  \ ]

