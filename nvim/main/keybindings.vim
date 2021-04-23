"================================================================= MAIN ============================================================================
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
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>2 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
"No persist in buffer
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D
"(buffers)
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>q :bdelete<CR>
"(panels)
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

"================================================================ FZF =============================================================================================
" Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'
nnoremap <leader>p :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>o :Buffers<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 
" Archivos ignorados
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"Actualizar barra cada 250 mili segundos
set updatetime=250

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

