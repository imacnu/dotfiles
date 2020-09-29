call plug#begin('~/.config/nvim/bundle')
Plug 'zanglg/nova.vim'
Plug 'Brettm12345/moonlight.vim'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multi cursores  https://github.com/mg979/vim-visual-multi
Plug 'jiangmiao/auto-pairs'
"Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'claco/jasmine.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Config

" ================ Turn Off Swap Files ============
set autoindent
set cindent
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
set shiftwidth=2
set smartcase
set smartindent
set smarttab
set softtabstop=0
set spelllang=en,es
set tabstop=2
set title
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
highlight Comment ctermbg=DarkGray
highlight Constant ctermbg=Blue
highlight Normal ctermbg=Black
highlight Special ctermbg=DarkMagenta
"================================================================ MAIN =============================================================================================
" Mostrar mejor mensajes de error
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

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
" CtrlP
let g:ctrlp_working_path_mode = 2
" Ignorar archivos en .gitignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ====================================================================KEYBINDINGs===================================================================================
let mapleader=" "
imap jj <Esc>
nnoremap <C-p> :Files<CR>
nnoremap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
nnoremap <C-d> <C-n>
map <C-d> <C-n>
imap <C-d> <C-n>
nnoremap <leader>e :e $MYVIMRC<CR> 
"Moverse entre pestañas (buffers)
"nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR> 
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>t :tab split<CR>

"Moverse entre ventanas/paneles 
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <leader>ss :SSave<CR>
nnoremap <leader>sc :SClose<CR>
noremap <silent> <leader>. :vertical resize +25<CR>
noremap <silent> <leader>, :vertical resize -25<CR>

"Linter -  go to next error
nmap <silent> <C-e> <Plug>(ale_next_wrap)
map <leader>ff :find 
nmap <C-e> :CocCommand explorer<CR>
"" ================================================================= AUTO COMPLETE ==============================================================
" Emmet config
let g:user_emmet_leader_key=','
"let g:user_emmet_expandabbr_key = ','
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>") 
 "let g:user_emmet_install_global = 0
 "let g:user_emmet_mode='a'
 "autocmd FileType html,css EmmetInstall

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

syntax on
syntax enable
set noshowmode 
set termguicolors
"colorscheme nova 
colorscheme moonlight
set background=dark
let g:moonlight_terminal_italics=1
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
      \ 'colorscheme': 'material',
      \   'active': {
      \     'left':[ [ 'mode', 'paste'],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \     ]
      \   },
      \   'component': {
      \     'lineinfo': ' %3l:%-2v',
      \   },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head'
      \   },
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
"let g:lightline.colorscheme = 'onedark'

" ============================================================== COC autocomplete config =============================================
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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
nmap <leader>f  <Plug>(coc-format-selected)
"COC EXPLORER
nmap <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"====================================================== NERDTree config =======================================
"autocmd VimEnter * unlet g:NERDTreeUpdateOnCursorHold
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeChDirMode=2
"let g:NERDTreeShowBookmarks=1
"let g:NERDTreeGitStatusUseNerdFonts=1
"let g:nerdtree_tabs_focus_on_files=1
"let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
"let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
"let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
"map <C-b> :NERDTreeToggle %<CR>
"nnoremap <silent> <Leader>f :NERDTreeFind<CR>
"nmap <silent> <C-g> :call NERDTreeToggleInCurDir()<cr>
"function! NERDTreeToggleInCurDir()
  "if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    "exe ":NERDTreeClose"
  "else
    "exe ":NERDTreeFind"
  "endif
"endfunction
"======================================================================= STARTTIFY ==================================================================================
" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" 'Most Recent Files' number
let g:startify_files_number           = 18

" Update session automatically as you exit vim
let g:startify_session_persistence    = 1

" Simplify the startify list to just recent files and sessions
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['=========== Recent files =========== '] },
  \ { 'type': 'sessions',  'header': ['=========== Saved sessions =========== '] },
  \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['=========== NERDTree Bookmarks ===============']},
  \ { 'type': function('s:gitModified'),  'header': [' ============== Git Modified =====================']},
  \ { 'type': function('s:gitUntracked'), 'header': [' =============  Git Untracked ====================']},
  \ ]

" Fancy custom header
let g:startify_custom_header = [
  \ "  ",
  \ '   ╻ ╻   ╻   ┏┳┓',
  \ '   ┃┏┛   ┃   ┃┃┃',
  \ '   ┗┛    ╹   ╹ ╹',
  \ '   ',
  \ ]
