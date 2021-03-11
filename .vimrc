set nocompatible
set hidden
call plug#begin()
" vim-plug plugins
Plug 'preservim/NERDTree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zxqfl/tabnine-vim'
Plug 'mattn/emmet-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'mhinz/vim-startify'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ryanoasis/vim-devicons'
Plug 'Raimondi/delimitMate'
" Plug 'dense-analysis/ale'
call plug#end()
set number
set ts=4 sw=4
set splitbelow
nmap <F6> <Plug>(ale_fix)

syntax enable
set termguicolors

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
let g:airline_theme = "tokyonight"

function! s:swap_lines(n1, n2)
	let line1 = getline(a:n1)
	let line2 = getline(a:n2)
	call setline(a:n1, line2)
	call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
	    return
	endif

	call s:swap_lines(n, n - 1)
	exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif
	
	call s:swap_lines(n, n + 1)
	exec n + 1
endfunction

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-b> :term <CR>
nnoremap <C-s> :w <CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-l> zg <CR>
nnoremap <C-e> :q <CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
" map <C-t><up> :tabr<cr>
" map <C-t><down> :tabl<cr>
" map <C-t><left> :tabp<cr>
" map <C-t><right> :tabn<cr>
autocmd VimEnter * NERDTree

" autocomplete for parenthesis
set spelllang=en
set spell
set encoding=utf-8
