" ----- vim configuration -----
color evening							" color scheme (/usr/share/vim/vim72/color/*)

set encoding=utf-8						" utf-8 coding
syntax on								" highlight syntax
set number								" display line number
set showmatch							" match when typing () or []
set ruler								" enable window ruler
set laststatus=2						" always show the statusline
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

set tabstop=4							" TAB equals 4 spaces
set autoindent							" auto indentation
set shiftwidth=4						" auto indentation width
set cin									" 'V&=' autoalignment
"set list								" show special chars (ending$, TAB^I)

set backspace=indent,eol,start			" enable backspace
set whichwrap=b,s,<,>,[,]				" move among consective lines (visual & insert mode)
"set nowrap								" disable auto wrap

set incsearch							" search when typing
set hlsearch							" highlight when searching
set gdefault							" global substitution
"set ignorecase							" ignorecase when searching

" ---------- A ----------
" <F12> switch between .c and .h
nnoremap <silent> <F12> :A <CR>

" ---------- miniBufExplorer ----------
let g:miniBufExplMapWindowNavArrows=1	" switch among file buffer using arrows <>
let g:miniBufExplMapCTabSwitchBufs=1	" swtich among file buffer using <Tab> and <S+Tab>

" ---------- QuickFix ----------
" <F5> switch to next result
" <F6> switch to previous result
nmap <silent> <F5> :cn <CR>						
nmap <silent> <F6> :cp <CR>

" ---------- Taglist -----------
" <F8> toggle Taglist
map <silent> <F8> :TlistToggle <CR>
let Tlist_Show_One_File=1				" only show current file's tags
let Tlist_WinWidth=40					" Taglist width
let Tlist_Exit_OnlyWindow=1				" exit directly when there's Taglist
let Tlist_Use_Right_Window=1			" Taglist is shown on the right

" ---------- winManager ----------
" <F7> toggle winManager (FileExplorer & TagList)
" <F7><F8> show FileExplorer only
nmap <silent> <F7> :WMToggle <CR>
let g:winManagerWidth=40				" winManager width
let g:winManagerWindowLayout='FileExplorer|TagList'
