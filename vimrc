" ---------- vim configuration ----------
color molokai                           " color scheme (/usr/share/vim/vim72/color & ~/.vim/colors)
set t_Co=256                            " terminal supports 256 colors

set encoding=utf-8                      " utf-8 coding
syntax on                               " highlight syntax
set number                              " display line number
set cursorline                          " highlight current line
set showcmd                             " show incomplete command
set showmatch                           " match when typing () or []
set matchtime=2                         " show matched bracket for 0.2s when typing
set ruler                               " enable window ruler
"set lines=30 columns=100               " default window height and width
set scrolloff=5                         " set 5 lines visible at least when moving up or down
set cmdheight=2                         " cmd height equals 2
set laststatus=2                        " always show the statusline
set statusline=[%F]%y%r%m%*%=\|\ %l/%L,%c\ \|\ %p%%\ \|

set expandtab                           " expand tab to spaces
autocmd FileType make set noexpandtab   " adopt tab when editting make file
set tabstop=4                           " TAB equals 4 spaces
autocmd FileType html set tabstop=2
set softtabstop=4                       " backspace equals -4 spaces
autocmd FileType html set softtabstop=2
set autoindent                          " auto indentation
set shiftwidth=4                        " auto indentation width
autocmd FileType html set shiftwidth=2
set cin                                 " 'V&=' autoalignment
set list                                " show special chars (tab^I, trail$)
"set nolist                             " don't show special chars
set listchars=tab:▸\ ,trail:▫           " set tab and trail

"set mouse=a                             " set mouse available (SHIFT to paste)
set backspace=indent,eol,start          " enable backspace
set whichwrap=b,s,<,>,[,]               " move among consective lines (visual & insert mode)
"set nowrap                             " disable auto wrap

set incsearch                           " search when typing
set hlsearch                            " highlight when searching
set gdefault                            " global substitution
"set ignorecase                         " ignorecase when searching

" automatically save and resotre vim cursor and foldings
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* loadview

" window move
nnoremap <C-S-h> <C-w>h
nnoremap <C-S-j> <C-w>j
nnoremap <C-S-k> <C-w>k
nnoremap <C-S-l> <C-w>l
" window split
nnoremap wv <C-w>v
nnoremap wc <C-w>c
nnoremap wh <C-w>s
" select all
nnoremap <silent> <C-a> ggvG$
" save & quit ('stty -ixon' first)
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i
nnoremap <C-q> :qa!<CR>
inoremap <C-q> <ESC>:qa!<CR>
" trailspace search and delete
nnoremap ts /.*\s\+$<CR>
nnoremap td :%s/\s\+$//<CR>
" quick up/down/left/right move
nnoremap <S-j> 5j
nnoremap <S-k> 5k
nnoremap <S-h> 5h
nnoremap <S-l> 5l
nnoremap <C-j> 15j
nnoremap <C-k> 15k
nnoremap <C-h> 15h
nnoremap <C-l> 15l
" add and remove comment //
vnoremap 0 <C-v>^50hI//<ESC>
vnoremap 9 <C-v>lx<ESC>
" add and remove comment #
vnoremap 8 <C-v>^50hI#<ESC>
vnoremap 7 <C-v>x

" set comma as prefix
let mapleader=','
nnoremap <silent> <leader>ee :e ~/.vimrc<CR>
nnoremap <silent> <leader>ss :source ~/.vimrc<CR>

" toggle number showing
nnoremap <silent> <F5> :set nu!<CR>

" customized commands
" show keyword number
command -nargs=1 Num %s/<args>//n
" read binary format
command RB %!xxd
" write binary format
command WB %!xxd -r
" convert from dox to unix format
command DU %!dos2unix

" ---------- A ----------
" <F12> switch between .c and .h
nnoremap <silent> <F12> :A<CR>

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
":cs add /home/young/project/src/cscope.out /home/young/project/src
set cscopetag                           " using cscope as tags

" ---------- ctags ----------
set tags=/home/young/AOSP/Lollipop/tags

" ---------- miniBufExplorer ----------
" next filebuf
nmap <silent> <tab> :bn<CR>
" previous filebuf
nmap <silent> <S-tab> :bp<CR>
" close current filebuf
nmap <silent> <S-d> :bd<CR>
let mapleader=','
nnoremap <silent> <leader>1 :b1<CR>
nnoremap <silent> <leader>2 :b2<CR>
nnoremap <silent> <leader>3 :b3<CR>
nnoremap <silent> <leader>4 :b4<CR>
nnoremap <silent> <leader>5 :b5<CR>
nnoremap <silent> <leader>6 :b6<CR>
nnoremap <silent> <leader>7 :b7<CR>
nnoremap <silent> <leader>8 :b8<CR>

" ---------- NerdTree ----------
" <F7> toggle NerdTree
nmap <silent> <F7> :NERDTreeToggle<CR>

" ---------- Taglist -----------
" <F8> toggle Taglist
map <silent> <F8> :TlistToggle<CR>
let Tlist_Show_One_File=1               " only show current file's tags
let Tlist_WinWidth=45                   " Taglist width
let Tlist_Exit_OnlyWindow=1             " exit directly when there's Taglist
let Tlist_Use_Right_Window=1            " Taglist is shown on the right
let Tlist_Enable_Fold_Column=0          " disable taglist's left column

if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

" source local vimrc
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
