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

"*** MAPING
map <F7> :tabp <CR>
map <F8> :tabn <CR>
map <F9> :tabnew <CR>

"vert sview means vertical view (read-only)
map <F2> :vert sview ~/.vimrc <CR>
