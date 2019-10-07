set nocompatible

filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim

let g:python3_host_prog = 'C:\Python37\python.exe'
" let g:python_host_prog = 'C:\Python27\python.exe'

call vundle#rc("$HOME/.config/nvim/bundle")

call vundle#begin()
" The Package manager
Plugin 'VundleVim/Vundle.vim'
" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
" Extra commit message infos with Gblame
Plugin 'tommcdo/vim-fugitive-blame-ext'
" File browser tree view
Plugin 'scrooloose/nerdtree'
" Pretty and informative bottom bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Git status decorations on the right-most column (new lines, changed lines,
" removed lines, etc.)
Plugin 'airblade/vim-gitgutter'
" Useful for toggling comments on lines. In normal mode, something like
" gc5<down> will comment the current line and 5 lines below. Tons of other
" functionality, too.
Plugin 'tomtom/tcomment_vim'

" Solarized color scheme for gVim
Plugin 'altercation/vim-colors-solarized'
" Solarized color scheme for nvim-qt
Plugin 'JulioJu/neovim-qt-colors-solarized-truecolor-only'

" Provides <Ctrl-f> shortcut to invoke clang-format on the current buffer
Plugin 'rhysd/vim-clang-format'
" Perl-compatible regex. vim grammar blows
Plugin 'othree/eregex.vim'
" Give a quick preview of text that is copied upon yanking
Plugin 'machakann/vim-highlightedyank'
" Automatic alignment of text. Usually clang-format takes care of this for
" C/C++ code, but in fortran, latex, etc. this can be useful
Plugin 'godlygeek/tabular'
" Functionality for placing bookmarks and notes in code. Useful for flaging
" typos, etc. to come back to later
"
" Commands:
"  mm  = toggle bookmark
"  mi  = add/edit/remove annotation
"  mn  = jump to next
"  mp  = jump to prev
Plugin 'MattesGroeger/vim-bookmarks'
" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Rename open files in vim and on disk
Plugin 'danro/rename.vim'
" Class outlines and the like
Plugin 'majutsushi/tagbar'
" Per-directory configuration
Plugin 'chazy/dirsettings'

" Completion/linting/etc. wizardry
Plugin 'dense-analysis/ale'
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'
Plugin 'ncm2/ncm2-jedi'

Plugin 'Chiel92/vim-autoformat'

" Note taking in reST. Provides the useful feature of being able to see reST
" highlighting in python docstrings.
Plugin 'gu-fan/riv.vim'

" python code formatter
Plugin 'ambv/black'

" For wrapping text in quotes, parens, etc.
Plugin 'tpope/vim-surround'

Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()

let g:riv_python_rst_hl=1

map <C-p> :Denite file/rec<CR>

let fruzzy#usenative = 1

filetype plugin indent on
set encoding=utf-8

map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

let fortran_free_source=1

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set textwidth=80

set hlsearch

set foldmethod=syntax
set foldlevelstart=99

set cc=80
set number
set relativenumber
set cursorline

if !empty(glob('.git'))
        set grepprg=git\ grep\ -Pn\ --recurse-submodules
else
        set grepprg=grep\ -P
endif

" Find all, open quickfix
nmap <leader>fa :grep! "\b<C-R><C-W>\b"<CR>:copen<CR>

" Next quickfix
nmap <leader>nn :cn<CR>

nmap <F8> :TagbarToggle<CR>

" Set the bookmarks plugin to automatically save bookmarks to a .vim-bookmarks file in the CWD
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

let g:ctrlp_working_path_mode = ''
" Use git to provide not-ignored files for Ctrl-p
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -c --recurse-submodules --exclude-standard']

:hi CursorLine   ctermbg=0
:hi MatchParen cterm=underline,bold ctermbg=none

let g:gitgutter_override_sign_column_highlight = 0
:hi GitGutterAdd ctermbg=8 ctermfg=2
:hi GitGutterChange ctermbg=8 ctermfg=3
:hi GitGutterDelete ctermbg=8 ctermfg=1
:hi SignColumn ctermbg=8


" Airline settings
let g:airline#extensions#ale#enabled=1
let g:airline_detect_spell=0
if has('windows')
    let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
else
    let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
endif
let g:airline_section_x = '%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}'
let g:airline_section_z ='%p%%%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#:%v'

" UI stuff
set diffopt=filler,vertical
set mouse=a

if has('gui_running')
    colors solarized
    Guifont Consolas:h11
    set guioptions-=m
    set guioptions-=T
    set guioptions+=c
endif

syntax on

set visualbell

" Highlight whitespace issues; trailing whitespace and spaces preceding tab
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Make the quickfix pane open below all other windows
autocmd FileType qf wincmd J

" completion settings. defaults are bonkers
let ncm2#popup_delay = 1
set completeopt=menuone,noselect,noinsert
autocmd BufEnter *.py call ncm2#enable_for_buffer()

