let mapleader= "," " sets map leader to comma
set timeoutlen=500 " sets timeout to 500ms
set nocompatible
set hidden

call plug#begin()
" vim-plug plugins
Plug 'preservim/NERDTree'
" Plug 'sheerun/vim-polyglot'
Plug 'rhysd/vim-grammarous'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'mhinz/vim-startify'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ryanoasis/vim-devicons'
Plug 'Raimondi/delimitMate'
" Plug 'othree/yajs.vim'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'   }
call plug#end()


" markdwon-preview 
let g:mkdp_auto_start = 1
let g:mkdp_refresh_slow = 1


" yats
let g:typescript_indent_disable = 1


" NERDTree 
let NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
\ }

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreegitStatusShowIgnored = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitSTatusConcealBrackets = 1
let g:NERDTreeGitStatusShowClean = 1

" conquer of completion
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
\ ]

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" VIM stuff

set ts=4 sw=4
set softtabstop=4
set expandtab
set smarttab
set splitbelow
filetype indent on
set showmatch
set incsearch
set hlsearch
set number


set spelllang=en
set spell
set encoding=utf-8

filetype plugin on

syntax enable
set termguicolors

" Colours, I still don't fully understand this lol.

let g:jsx_ext_required = 1
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:airline_theme = "tokyonight"
colorscheme tokyonight 

let NERDTreeShowHidden=1
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

" NERDTree stuff
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Fuzzy finding
nnoremap <C-p> :Files<CR>

" TBH I have not clue what this is
nnoremap <C-l> zg <CR>
nnoremap <C-e> :q <CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Moves line up
nnoremap <S-Up> :m-2<CR>
inoremap <S-Up> <Esc>:m-2<CR>
" Moves line down
nnoremap <S-Down> :m+<CR>
inoremap <S-Down> <Esc>:m+<CR>
" Saves the file
nnoremap <F10> :w <CR> 

" Format file
nnoremap <F7> :CocCommand prettier.formatFile <CR>

"Vim has a weird past so press this to make it normal
set pastetoggle=<F3>

" autocomplete for parenthesis
au! BufWritePost $MRVIMRC source %
" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=prettier\ --type\ html
au FileType ejs setlocal formatprg=prettier\ --parser\ html
au FileType jst setlocal formatprg=prettier\ --parser\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css


command! -nargs=0 Prettier :CocCommand prettier.formatFile
