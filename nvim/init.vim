" Config 
source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/main/main.vim

let g:terminal_color_0 = "#282828"
let g:terminal_color_1 = "#cc241d"
let g:terminal_color_2 = "#98971a"
let g:terminal_color_3 = "#d79921"
let g:terminal_color_4 = "#458588"
let g:terminal_color_5 = "#b16286"
let g:terminal_color_6 = "#689d6a"
let g:terminal_color_7 = "#a89984"
let g:terminal_color_8 = "#928374"
let g:terminal_color_9 = "#fb4934"
let g:terminal_color_10 = "#b8bb26"
let g:terminal_color_11 = "#fabd2f"
let g:terminal_color_12 = "#83a598"
let g:terminal_color_13 = "#d3869b"
let g:terminal_color_14 = "#8ec07c"
let g:terminal_color_15 = "#ebdbb2"
 
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
set clipboard=unnamedplus

set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
highlight Comment ctermbg=DarkGray
highlight Constant ctermbg=Blue
highlight Normal ctermbg=Black
highlight Special ctermbg=DarkMagenta

autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell
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
let g:tagalong_filetypes = ['html', 'jsx', 'js', 'javascriptreact', 'typescriptreact']
" ====================================================================KEYBINDINGs===================================================================================
let mapleader=" "
imap jj <Esc>
imap kk <Esc>
imap jk <Esc>
nnoremap <C-p> :Files<CR>
nnoremap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
nnoremap <C-d> <C-n>
map <C-d> <C-n>
imap <C-d> <C-n>
nnoremap <leader>e :e $MYVIMRC<CR> 
"nnoremap <C-s>s source $MYVIMRC<CR> 

"Moverse entre pestañas (buffers)
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
noremap <silent> <leader>' :resize +25<CR>
noremap <silent> <leader>/ :resize -25<CR>

"Linter -  go to next error
nmap <leader>ee  <Plug>(ale_next_wrap)
map <leader>ff :find 
map <C-e> :CocCommand explorer<CR>
"Git status
nmap <leader>gs :G<CR>
"" ================================================================= AUTO COMPLETE ==============================================================
" Emmet config
let g:user_emmet_leader_key=','
"let g:user_emmet_expandabbr_key = ','
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>") 
 "let g:user_emmet_install_global = 0
 "let g:user_emmet_mode='a'
 "autocmd FileType html,css EmmetInstall
"================================================================= FLOAT TERM ============================================================================
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
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

nnoremap <leader>tt :FloatermNew --cmd="%"<CR>
nnoremap <leader>zz :FloatermNew fzf<CR>
nnoremap <leader>ee :FloatermNew vifm<CR>

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

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

set termguicolors
syntax enable
syntax on
set noshowmode 
colorscheme moonlight
"colorscheme nova 
"colorscheme synthwave84
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
"nmap <space>f :CocCommand explorer --preset floating<CR>
"autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
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
            \ { 'c': '/Users/malvarez/Desktop/Components/bbva-web-components-app' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'o': '~/.config/coc/ultisnips/javascript.snippets' },
            \ { 's': '~/.config/coc/ultisnips/snippets.snippets' },
            \ { 'v': '~/.config/coc/ultisnips/vim.snippets' },
            \ { 'z': '~/.zshrc' },
            \ ]

" Fancy custom header
let g:startify_custom_header = [
  \ "  ",
  \ '   ╻ ╻   ╻   ┏┳┓',
  \ '   ┃┏┛   ┃   ┃┃┃',
  \ '   ┗┛    ╹   ╹ ╹',
  \ '   ',
  \ ]
