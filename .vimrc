" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/autoload_cscope.vim'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'ycm-core/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'nvie/vim-flake8'
Plug 'rust-lang/rust.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'wakatime/vim-wakatime'
Plug 'vim-scripts/sudo.vim'
Plug 'embear/vim-localvimrc'

" Initialize plugin system
call plug#end()

filetype plugin indent on

set background=dark
set hlsearch
set incsearch
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nonumber
set nowrap
set t_Co=256
set t_ut=

" Color Theme
let g:solarized_termcolors = 16 "or 256
let g:solarized_termtrans = 1
colorscheme solarized

map <F2> :FufBuffer<CR>
map <F3> :FufFile<CR>
map <F4> :TagbarToggle<CR>
map <F5> :NERDTreeToggle<CR>
map <silent> <C-N> :silent noh<CR>
map <C-l> :bn<CR>
map <C-h> :bp<CR>

" c.vim
let g:c_syntax_for_h = 1

" YouCompleteMe
"let g:ycm_show_diagnostics_ui = 0
"let g:loaded_youcompleteme = 1
let g:ycm_filter_diagnostics = {
  \ "c": {
  \   "regex": [
  \     "-mno-fp-ret-in-387",
  \     "-mpreferred-stack-boundary=3",
  \     "-mskip-rax-setup",
  \     "-mindirect-branch=thunk-extern",
  \     "-mindirect-branch-register",
  \     "-fno-allow-store-data-races",
  \     "-fplugin-arg-structleak_plugin-byref-all",
  \     "-fno-var-tracking-assignments",
  \     "-fconserve-stack",
  \     "-mrecord-mcount",
  \     "-flive-patching=inline-clone"
  \   ]
  \ }
  \}

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit="vertical"

" Tagbar
let g:tagbar_left = 1

func! Css()
    let css = expand("<cword>")
    new
    exe "cs find s ".css
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap <leader>fs :call Css()<cr>

"find functions calling this function
func! Csc()
    let csc = expand("<cword>")
    new
    exe "cs find c ".csc
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap <leader>fc :call Csc()<cr>

"find functions called by this function
func! Csd()
    let csd = expand("<cword>")
    new
    exe "cs find d ".csd
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap <leader>fd :call Csd()<cr>

"find this definition
func! Csg()
    let csg = expand("<cword>")
    new
    exe "cs find g ".csg
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap <leader>fg :call Csg()<cr>

highlight ColorColumn ctermbg=5
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"for vim-localvimrc
let g:localvimrc_ask = 0
