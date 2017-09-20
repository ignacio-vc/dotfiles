" vim: fdm=marker foldenable sw=4 ts=4 sts=4
" Ignacio Vargas' .vimrc File
" "zo" to open folds, "zc" to close, "zn" to disable.

" Largely inspired (stolen) from mcantor's .vimrc
" https://github.com/mcantor/dotfiles/

" {{{ Clear all autocommands

" TODO: Nothing here yet.

au!

" }}}

" {{{ Plugins and Settings

" Vundle is used to handle plugins.
" https://github.com/VundleVim/Vundle.vim

" {{{ VUNDLE SETUP

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" }}}

" <PLUGINS>

" {{{ vim-tmux
"     ========

Plugin 'tmux-plugins/vim-tmux'

" }}}

" {{{ editorconfig-vim
"     ================

Plugin 'editorconfig/editorconfig-vim'

" }}}

" {{{ His Home-Row-ness the Pope of Tim
"     =================================

" vim-surround: s is a text-object for delimiters; ss linewise
" ys to add surround
Plugin 'tpope/vim-surround'

" vim-commentary: gc is an operator to toggle comments; gcc linewise
Plugin 'tpope/vim-commentary'

" vim-repeat: make vim-commentary and vim-surround work with .
Plugin 'tpope/vim-repeat'

" vim-liquid: syntax stuff
Plugin 'tpope/vim-liquid'

" vim-markdown: some stuff for fenced language highlighting
Plugin 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'yaml', 'haml', 'bash=sh']

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-eunuch'

" }}}

" {{{ NERDTree
"     ========

Plugin 'scrooloose/nerdtree'

" OPTIONS:

" Get rid of objects in C projects
let NERDTreeIgnore=['\~$', '.o$', 'bower_components', 'node_modules', '__pycache__']
let NERDTreeWinSize=20

" }}}

" {{{ netrw: Configuration
"     ====================

" Nothing here yet.

" }}}

" {{{ vim-colorschemes
"     ================

Plugin 'flazz/vim-colorschemes'

"}}}

" </PLUGINS>

" {{{ VUNDLE TEARDOWN

call vundle#end()
filetype plugin indent on

" }}}

" }}}

" {{{ Basic Settings

" Modelines
set modelines=2
set modeline

" For clever completion with the :find command
set path+=**

" Always use bash syntax for sh filetype
let g:is_bash=1

" Color scheme
color hhdgray

" Search
set ignorecase smartcase
set grepprg=grep\ -IrsnH

" Window display
set showcmd ruler laststatus=2

" Splits
set splitright

" Buffers
set history=500
set hidden
if exists("&undofile")
    set undofile
endif

" Spelling
set dictionary+=/usr/share/dict/words thesaurus+=$HOME/.thesaurus

" Text display
set listchars=trail:.,tab:>-,extends:>,precedes:<,nbsp:¬
set list

" Typing behavior
set backspace=indent,eol,start
set showmatch
set wildmode=full
set wildmenu
set complete-=i

" Formatting
set nowrap
set tabstop=2 shiftwidth=2 softtabstop=2
set foldlevelstart=2

" Status line
" set statusline=%!MyStatusLine()

" Session saving
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,localoptions

" Word splitting
set iskeyword+=-

" }}}

" {{{ Autocommands

" Nothing here yet

" }}}

" {{{ Syntax Highlighting

" This has to happen AFTER autocommands are defined, because au! is ran when
" defining them, and syntax highlighting is done with autocommands.

" Syntax highlighting
syntax enable

" }}}

" Backups & .vimrc Editing {{{

" POSIX filesystem
set directory=$HOME/.backups/swaps,$HOME/.backups,$HOME/tmp,.
set backupdir=$HOME/.backups/backups,$HOME/.backups,$HOME/tmp,.
if exists("&undodir")
	set undodir=$HOME/.backups/undofiles,$HOME/.backups,$HOME/tmp,.
endif

" }}}

" Key Mappings {{{

" Nothing here yet.

" }}}

" Custom Functions {{{

" Nothing here yet.

" }}}

" Local Settings {{{

" Nothing here yet.

" }}}
