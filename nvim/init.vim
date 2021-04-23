" Config
source $HOME/.config/nvim/plugins/plugins.vim
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
"highlight Constant ctermbg=Blue
"highlight Normal ctermbg=Black
"highlight Special ctermbg=DarkMagenta
let buffet_use_devicons = 1
let loaded_netrwPlugin = 1
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

"================================================================ FZF =============================================================================================
" Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Archivos ignorados
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"Actualizar barra cada 250 mili segundos
set updatetime=250
" AutoPairskk
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','<':'>'}

let mapleader=" "
imap hh <Esc>
imap jj <Esc>
imap kk <Esc>
imap kk <Esc>
imap jk <Esc>
nmap <CR> o<Esc>
nnoremap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
nnoremap <C-d> <C-n>
map <C-d> <C-n>
imap <C-d> <C-n>
nnoremap <leader>e :e $MYVIMRC<CR>
"No almancenar eliminados en buffer
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D
"Moverse entre pestañas (buffers)
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>q :bdelete<CR>
"nnoremap <leader>t :tab split<CR>

"Moverse entre ventanas/paneles
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
nnoremap <leader>ss :SSave<CR>
nnoremap <leader>sc :SClose<CR>
noremap <silent> <leader>. :vertical resize +25<CR>
noremap <silent> <leader>, :vertical resize -25<CR>
noremap <silent> <leader>; :resize +25<CR>
noremap <silent> <leader>/ :resize -25<CR>
"Linter -  go to next error
"map <leader>ff :find
nnoremap <leader>p :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>o :Buffers<CR>
nnoremap <leader>f :Ag
map <C-e> :CocCommand explorer<CR>
"Git status
nmap <leader>gs :G<CR>
" Available imports
nnoremap <Leader>ij :ImportJsFZF<CR>
"Subversive
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
nmap <leader>sa<plug>(SubversiveSubvertWordRange)
"CtrlSF Searcher
nmap     <leader>c <Plug>CtrlSFPrompt
"React refactor
xmap <leader>r  <Plug>(coc-codeaction-selected)
nmap <leader>r  <Plug>(coc-codeaction-selected)
"Search and replace
nnoremap <leader>S :lua require('spectre').open()<CR>
"search current word
nnoremap <leader>sw viw:lua require('spectre').open_visual()<CR>
vnoremap <leader>s :lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>


"let g:UltiSnipsExpandTrigger="<tab>"
"" ================================================================= AUTO COMPLETE ==============================================================
" Emmet config
let g:user_emmet_leader_key=','
"let g:user_emmet_expandabbr_key = ','
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
 "let g:user_emmet_install_global = 0
 "let g:user_emmet_mode='a'
 "autocmd FileType html,css EmmetInstall
"================================================================= FLOAT TERM ============================================================================
nnoremap   <silent>   <F7>    :FloatermNew --cmd="%:p:h"<<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew --cmd="%:p:h"<<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F10>   :FloatermToggle<CR>
nnoremap   <silent>  <leader>0   :FloatermToggle<CR>
nnoremap   <silent>  <leader><leader>   :FloatermToggle<CR>
tnoremap   <silent>   <F10>   <C-\><C-n>:FloatermToggle<CR>" Floaterm
tnoremap   <silent>  <leader><leader>   <C-\><C-n>:FloatermToggle<CR>" Floaterm
let g:floaterm_keymap_kill = '<F12>'

"nnoremap <leader>tt :FloatermNew --cmd="%:p:h"<CR>
nnoremap <leader>zz :FloatermNew fzf<CR>
nnoremap <leader>ee :FloatermNew vifm<CR>

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
"================================================================ THEME and  interface options =================================================
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
      \ 'colorscheme': 'oceanicnext',
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
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
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

