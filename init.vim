set nocompatible

filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim

" let g:python_host_prog = 'C:\Python27\python.exe'
" let g:python3_host_prog = 'C:\Python36\python3.exe'

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

" Deoplete and deps
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
Plugin 'sebastianmarkow/deoplete-rust'

" vim-jedi has more features than deoplete/deoplete-jedi (e.g. go to definition,
" go to assignment), but it is slower. So make sure to disable the autocomplete
" feature, so that deoplete is used instead.
Plugin 'davidhalter/jedi-vim'

Plugin 'Chiel92/vim-autoformat'

" Note taking in reST. Provides the useful feature of being able to see reST
" highlighting in python docstrings.
Plugin 'gu-fan/riv.vim'

" For wrapping text in quotes, parens, etc.
Plugin 'tpope/vim-surround'

Plugin 'bronson/vim-trailing-whitespace'

" Plugin 'autozimu/LanguageClient-neovim'


" Rust stuff
Plugin 'autozimu/LanguageClient-neovim'
Plugin 'roxma/nvim-completion-manager'

call vundle#end()

let g:deoplete#enable_at_startup = 1

map <C-p> :Denite file/rec<CR>

let fruzzy#usenative = 1

" Disable lots of stuff from jedi-vim
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = ''
let g:jedi#goto_definitions_command = ''
let g:jedi#usages_command = ""
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1

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
        set grepprg=git\ grep\ -Pn
else
        set grepprg=grep\ -P
endif

" Find all, open quickfix
nmap <leader>fa :grep! "<C-R>/"<CR>:copen<CR><CR>

" Next quickfix
nmap <leader>nn :cn<CR>


nmap <F8> :TagbarToggle<CR>

" Set the bookmarks plugin to automatically save bookmarks to a .vim-bookmarks file in the CWD
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1


let g:ctrlp_working_path_mode = ''
" Use git to provide not-ignored files for Ctrl-p
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

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

autocmd FileType qf wincmd J

" Languguage server
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls']
    \ }

" deoplete-rust config
let g:deoplete#ources#rust#racer_binary='C:\Users\myoung\.cargo\bin\racer.exe'
let g:deoplete#sources#rust#rust_source_path='C:\Users\myoung\git\rust\src'
