let mapleader= "," " sets map leader to comma
set timeoutlen=500 " sets timeout to 500ms
set nocompatible
set hidden

call plug#begin()
" vim-plug plugins
" NERDTree for file management
Plug 'preservim/NERDTree'
"IDK
Plug 'sheerun/vim-polyglot'
" Spelling for vim
Plug 'rhysd/vim-grammarous'
" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Shows each lines git status
Plug 'airblade/vim-gitgutter'
" vim with tmux
Plug 'christoomey/vim-tmux-navigator'
" Shows which files have been edited
Plug 'Xuyuanp/nerdtree-git-plugin'
" Colorscheme
Plug 'morhetz/gruvbox'
" fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Emmet for vim
Plug 'mattn/emmet-vim'
" Plug 'ghifarit53/tokyonight-vim'
" airline to connect to powerline
Plug 'vim-airline/vim-airline'
" fuzzy finding
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" Starting message and options 
Plug 'mhinz/vim-startify'
"IDK
Plug 'vim-ctrlspace/vim-ctrlspace'
" NERDTree icons
Plug 'ryanoasis/vim-devicons'
" I also don't know
Plug 'Raimondi/delimitMate'
" Syntax highlighting for vim
Plug 'leafgarland/typescript-vim'
" Commenting for vim
Plug 'tpope/vim-commentary'
" Auto add the other side to bracket
Plug 'jiangmiao/auto-pairs'
" Syntax highlighting for JSX and TSX
Plug 'maxmellon/vim-jsx-pretty'
" haven't worked out yet
Plug 'mbbill/undotree'
" Easy tool for strings
Plug 'tpope/vim-surround'
call plug#end()



" vim-typescript
let g:typescript_indent_disable = 1

" vim-javascript
let g:javascript_plugin_jsdoc = 1

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
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let NERDTreeShowHidden=1

"UndoTree
nnoremap <F5> :UndotreeToggle<CR>

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
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)" Use <c-space> to trigger completion.
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
set autoindent
set smartindent
set noswapfile
set nobackup
set smartcase
set noerrorbells
set undodir=~/.vim/undodir
set undofile
set showcmd
set number relativenumber
set regexpengine=1
set ruler
set list
set showmatch
filetype plugin on
syntax on

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Colours, I still don't fully understand this lol.

set termguicolors
" let g:jsx_ext_required = 1
" let g:tokyonight_style = 'storm'
" let g:tokyonight_enable_italic = 1
" let g:airline_theme = "tokyonight"
" colorscheme tokyonight 

" gruvbox
let g:gruvbox_italic=1
let g:gruvbox_bold = 1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_signs=1
let g:gruvbox_invert_indent_guides=1
colorscheme gruvbox
set background=dark

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
inoremap <F10> <Esc>:w<CR>

" Format file
nnoremap <F7> :CocCommand prettier.formatFile <CR>

let g:tmux_navigator_no_mappings = 1

" navigate split screens easily
" configuration for tmux_navigator
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

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

let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

command! -nargs=0 Prettier :CocCommand prettier.formatFile
