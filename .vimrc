"*** CHEATSHEET ***
"KeyMap
"	<F2>			Show this Cheat Sheet
"	<F7>			Previus Tab
"	<F8>			Next Tab
"	<F9>			New empty Tab

"Tabs
"	:tabnew <name>		Open a new file in a new tab
"
"	:tabe <filepath>	Edit in a new tab the file
"
"	:tabp			Go to previous tab
"
"	:tabn			Go to next tab

"Split Screen
"	:sp [<path>]		Splits the screen horizontally
"			also	Ctrl+w s
"	
"	:vs [<path>]		Splits the screen vertically
"			also	Ctrl+w v
"	
"	ctrl+w <keyarrow>	Move to a splited-screen
"

"Some utils
"	:w !python		Run the current python file
"
"	:w !sudo tee %		Save the file if read-only

"*** CONFIG ***
set incsearch	"incremental search
set hlsearch	"highlight the search
set nu		"show line number
set relativenumber 

"*** MAPING
map <F7> :tabp <CR>
map <F8> :tabn <CR>
map <F9> :tabnew <CR>

"vert sview means vertical view (read-only)
map <F2> :vert sview ~/.vimrc <CR>

" vim-plug things
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" vim-plug plugs
call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim'


call plug#end()
" end vim-plug things
"
"
"
" vim-plug plugs configuration
"
set background=dark
colorscheme material 
