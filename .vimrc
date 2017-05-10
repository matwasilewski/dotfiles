
"Pathogen plugin manager"
execute pathogen#infect()

"----------Settings-----------"	

syntax on			 "Syntax highlight on

set backspace=indent,eol,start	 "Make backspace work like in mac
let mapleader = ','              "Change leader from \ to ','
set number			 "Sets linenumbers
set linespace=15		 "Sets line spacing but only in gui

"----------Search-----------"	

set hlsearch			 "Highlight search term 
set incsearch			 "Incremental highlight term

"----------Mappings-----------"

"Open .vimrc by writing ',ev'"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"Deselect search highlight by pressing ',<space>'"
nmap <Leader><space> :nohlsearch<cr>


"----------Auto-commmands-----"

"Automatically source the .vimrc file on save."

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
