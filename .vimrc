set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

set number
"map <F2> :NERDTree<ENTER>:set number<ENTER>
map <F2> gT
map <F3> :up<ENTER>
map <F4> gt
map <F5> :SyntasticCheck<ENTER>
map <F6> :lnext<ENTER>
map <F7> :source ~/.vim/session/work.session
map <F8> :mksession! ~/.vim/session/work.session
set shiftwidth=2
set tabstop=2
set enc=utf-8
set fencs=utf-8,gbk,ucs-bom,gb18030,euc-jp,gb2312,cp936
set et
color elflord
"color ron
set fileformats=unix
set viminfo='200,%,!,<50,s10,h,rA,rB,/50,:50
"au VimLeave * mksession! ~/.vim/session/%:t.session
"au VimLeave * wviminfo! ~/.vim/session/%:t.viminfo
"let vimim_cloud='qq,sogou,google'
set noignorecase
"let g:vimim_cloud='baidu.static'
"let g:vimim_mode='static'
"let g:vimim_mycloud=0
"let g:vimim_map='c-bslash'
"let g:vimim_cloud_plugin="dll:/home/wangfan/.vim/plugin/mycloud/libvimim.so"
"let g:vimim_shuangpin='sougou'
"set foldmethod=syntax
"set foldnestmax=1
"let javaScript_fold=1
"let html_fold=1

set path+=./js,./myth,./view,./
set suffixesadd+=.js
set dict=./tags
set complete+=k

"inoremap ( ()
"inoremap [ []
"inoremap { {}
"inoremap < <>

" auto insert , to end of line
nmap <c-j> <ESC>mzA,<ESC>`z
nmap <c-k> :lnext<ENTER>
nmap <c-l> :lprevious<ENTER>

" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on

" for snippets
let g:UltiSnipsExpandTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_javascript_checker = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
