"
" Custom Vim Resource Configuration
"
" Author:
"	 Shashank Chhikara <shanky061@gmail.com>
"
"

set history=25		" keep 25 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"set number		" show line numbers

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")

" Set spaces for tab count and autoindent
set tabstop=4
set shiftwidth=4

" Enable persistent folding using markers
"set modeline
set fdm=marker

" for vim-airline
set noshowmode
set laststatus=2
set timeoutlen=50
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Set dark colorscheme
"colorscheme badwolf
"let g:airline_theme='murmur'

" Set light colorscheme
colorscheme summerfruit256
let g:airline_theme='tomorrow'

" enable new c++ highlighting
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1
