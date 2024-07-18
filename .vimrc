"*** CONFIG ***
set incsearch	"incremental search
set hlsearch	"highlight the search
set nu		"show line number
set relativenumber 

syntax enable
filetype plugin indent on

colorscheme evening 

"Manually install universal-ctags -> https://github.com/universal-ctags/ctags

"install vim.plug, place it before plug#begin()
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your VIM plugins here
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jremmen/vim-ripgrep'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sheerun/vim-polyglot'
" List your NVIM plugins here
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
":TSInstall <language_to_install>
call plug#end()

" MAPPINGS
"set Leader to be º
let mapleader ="`"
" navigate on the quickfix list
map <silent> <C-j> :cn<CR>
map <silent> <C-k> :cp<CR>
map <silent> <C-h> :cw<CR>
map <silent> <C-l> :ccl<CR>

" Polyglot
let g:python_highlight_all = 1

"map fzf to Ctrl-f
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :RG<CR>
"map ripgrep to \+f
nnoremap <silent> <Leader>f :Rg <CR>

"gutentags configuration
set statusline+=%{gutentags#statusline()}
set wildignore=translations/*,*.lock,build/*,.vscode/*,.mypy_cache/*,_site,*/__pycache__/,.venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk

