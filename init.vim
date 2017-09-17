set nocompatible

filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#rc("$HOME/.config/nvim/bundle")

call vundle#begin()
" The Package manager
Plugin 'VundleVim/Vundle.vim'
" Git integration
Plugin 'tpope/vim-fugitive'
" Fuzzy file searcher
Plugin 'kien/ctrlp.vim'
" File browser tree view
Plugin 'scrooloose/nerdtree'
" Pretty and informative bottom bar
Plugin 'vim-airline/vim-airline'
" Git status decorations on the right-most column (new lines, changed lines,
" removed lines, etc.)
Plugin 'airblade/vim-gitgutter'
" Useful for toggling comments on lines. In normal mode, something like
" gc5<down> will comment the current line and 5 lines below. Tons of other
" functionality, too.
Plugin 'tomtom/tcomment_vim'

" Not sure what I was using this for...
" Plugin 'kana/vim-operator-user'

" Provides <Ctrl-f> shortcut to invoke clang-format on the current buffer
Plugin 'rhysd/vim-clang-format'
" Perl-compatible regex. vim grammar blows
Plugin 'othree/eregex.vim'
" Give a quick preview of text that is copied upon yanking
Plugin 'machakann/vim-highlightedyank'
" Mostly for Fortran code to automatically set keywords and intrinsics uppercase
Plugin 'Syntax-context-abbreviations'
" Automatic alignment of text. Usually clang-format takes care of this for
" C/C++ code, but in fortran, latex, etc. this can be useful
Plugin 'godlygeek/tabular'
" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Rename open files in vim and on disk
Plugin 'danro/rename.vim'

call vundle#end()

filetype plugin indent on

map <F2> :NERDTreeToggle<CR>

noremap  :ClangFormat<CR>

let fortran_free_source=1

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set textwidth=80

set foldmethod=syntax
set foldlevelstart=99

set cc=80
set number
set relativenumber

let g:ctrlp_working_path_mode = ''

colors desert
:hi CursorLine   ctermbg=0

let g:gitgutter_override_sign_column_highlight = 0
:hi GitGutterAdd ctermbg=8 ctermfg=2
:hi GitGutterChange ctermbg=8 ctermfg=3
:hi GitGutterDelete ctermbg=8 ctermfg=1
:hi SignColumn ctermbg=8

:set diffopt=filler,vertical
:set mouse=a
