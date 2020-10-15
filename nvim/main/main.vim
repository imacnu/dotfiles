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

