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
autocmd FileType gitcommit setlocal spellA
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspelluuu

nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
"nnoremap o o<Esc>q
"nnoremap O O<Esc>
"================================================================ MAIN =============================================================================================
let g:ale_linters = {
\   'javascript': ['eslint', 'standard'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\		'*': ['trim_whitespace'],
\   'css': ['prettier'],
\}
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_completion_autoimport = 1

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
"let g:ale_sign_error = '●'
"let g:ale_sign_warning = '.'
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
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}

" Syntastic
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_check_on_open = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 0
"let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:syntastic_html_tidy_ignore_errors=["<bbva-", "discarding unexpected </bbva-"]
let g:syntastic_error_symbol = "\u2731"
let g:syntastic_warning_symbol = "\u26A0"
highlight SyntasticErrorSign guifg=#e74c3c guibg=red
highlight SyntasticWarningSign guifg=#e74c3c guibg=red
highlight SyntasticErrorLine guibg=#2f0000
 " Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Archivos ignorados
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"Actualizar barra cada 250 mili segundos
set updatetime=250
" AutoPairskk 
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','<':'>'}
" CtrlP
let g:ctrlp_working_path_mode = 'r' 
" Ignorar archivos en .gitignore
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co - exclude-standard', 'find %s -type f']
let g:ctrlp_user_command = {
\    'types': {
\      1: [
\        '.git',
\        'cd %s &&
\         git ls-files . -co --exclude-standard
\         | awk ''{ print length, $0 }''
\         | sort -n -s
\         | cut -d" " -f2-'
\      ],
\    },
\    'fallback': 'find %s -type f'
\  }
let g:tagalong_filetypes = ['html', 'jsx', 'js', 'javascriptreact', 'typescriptreact']
let g:ctrlp_working_path_mode = 2
" Ignorar archivos en .gitignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char_list = ['.']
"let g:indentLine_color_gui = '#A4E57E'
"Ctrlsf config
let g:ctrlsf_search_mode = 'async'"
let g:ctrlsf_auto_close = {
    \ "normal" : 1,
    \ "compact": 1
    \}
let g:ctrlsf_auto_focus = {
    \ "at": "start",
     \ "duration_less_than": 1000
     \ }
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '50'
