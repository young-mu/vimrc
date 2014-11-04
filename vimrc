" ---------- vim configuration ----------
color molokai							" color scheme (/usr/share/vim/vim72/color & ~/.vim/colors)
set t_Co=256							" terminal supports 256 colors

set encoding=utf-8						" utf-8 coding
syntax on								" highlight syntax
set number								" display line number
set cursorline							" highlight current line
set showcmd								" show incomplete command
set showmatch							" match when typing () or []
set ruler								" enable window ruler
"set lines=30 columns=100				" default window height and width
set cmdheight=2							" cmd height equals 2
set laststatus=2						" always show the statusline
set statusline=[%F]%y%r%m%*%=\|\ %l/%L,%c\ \|\ %p%%\ \|

set expandtab							" expand tab to spaces
set tabstop=4							" TAB equals 4 spaces
set autoindent							" auto indentation
set shiftwidth=4						" auto indentation width
set cin									" 'V&=' autoalignment
set list								" show special chars (tab^I, trail$)
set listchars=tab:▸\ ,trail:▫			" set tab and trail

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

" ---------- cscope ----------
" 'Ctrl + Shift + -' + X
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
:cs add /home/young/Houdini/branches/Houdini_4.1/src/cscope.out /home/young/Houdini/branches/Houdini_4.1/src
set cscopetag							" using cscope as tags

" ---------- ctags ----------
set tags=/home/young/Houdini/branches/Houdini_4.1/src/tags

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
let Tlist_Enable_Fold_Column=0			" disable taglist's left column

" ---------- winManager ----------
" <F7> toggle winManager (FileExplorer & TagList)
" <F7><F8> show FileExplorer only
nmap <silent> <F7> :WMToggle <CR>
let g:persistentBehaviour=0				" exit directly when there's winManager
let g:winManagerWidth=40				" winManager width
let g:winManagerWindowLayout='FileExplorer|TagList'
