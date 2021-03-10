set nocompatible
call plug#begin()
" vim-plug plugins
Plug 'preservim/NERDTree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jelera/vim-javascript-syntax'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zxqfl/tabnine-vim'
call plug#end()
set ts=4 sw=4
set splitbelow
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fix_on_save = 1
let g:prettier#config#tab_width = 'auto'
nmap <F6> <Plug>(ale_fix)

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
nnoremap <C-e> :term <CR>
nnoremap <C-s> :w <CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
autocmd VimEnter * NERDTree
