set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

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

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

	" set for ruby @ and @@ viriabal
	autocmd FileType ruby setl isk=@-@,@,48-57,128-167,224-235,_

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " remove all the space after each line
	"autocmd BufWrite * :%s/\s*$//

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

set number
"map <F2> :NERDTree<ENTER>:set number<ENTER>
map <F2> gT
map <F3> :up<ENTER>
map <F4> gt
"map <F5> "+p
map <F6> :TagbarToggle<CR>
map <F7> :source ~/.vim/session/work.session
map <F8> :mksession! ~/.vim/session/work.session
set shiftwidth=2
set tabstop=2
"set enc=utf-8,latin1
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

" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()
filetype plugin indent on

" for snippets
let g:UltiSnipsExpandTrigger="<tab><tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
