" vim: fdm=marker:foldlevel=0 foldenable sw=4 ts=4 sts=4
" Ignacio Vargas' .vimrc File
" "zo" to open folds, "zc" to close, "zn" to disable.

" Inspired by mcantor's .vimrc
" https://github.com/mcantor/dotfiles/

" {{{ Clear autocommands

au!

" }}}

" {{{ Plugins

" Using Vundle for plugins
" https://github.com/VundleVim/Vundle.vim

" {{{ VUNDLE SETUP

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" }}}

" <PLUGINS>

" {{{ vim-colorschemes
"     ================

Plugin 'flazz/vim-colorschemes'

"}}}

" {{{ julia-vim
"     =========

Plugin 'JuliaEditorSupport/julia-vim'

" }}}

" {{{ vim-tmux
"     ========

Plugin 'tmux-plugins/vim-tmux'

" }}}

" {{{ Pope of Tim
"     ===========

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-eunuch'

" }}}

" {{{ NERDTree
"     ========

Plugin 'scrooloose/nerdtree'

" }}}

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
" Search down into subfolders
" Provides tab-completion for all file-related tasks
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
set number

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
" Display all matching files when we tab complete
" Now we can hit tab ":find by partial match and use * to make it fuzzy
" :ls shows buffer of files that already open
" :b lets you autocomplete any open buffer"
set wildmenu
set complete-=i

" Formatting
set nowrap
set tabstop=2 shiftwidth=2 softtabstop=2
set foldlevelstart=2

" Status line
set statusline=%!MyStatusLine()

" Session saving
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,localoptions

" Word splitting
set iskeyword+=-

" }}}

" {{{ Autocommands

" Make the modification indicator [+] white on red background
au ColorScheme * hi User1 gui=bold term=bold cterm=bold guifg=white guibg=red ctermfg=white ctermbg=red

" Tweak the color of the fold display column
au ColorScheme * hi FoldColumn cterm=bold ctermbg=233 ctermfg=146

" }}}

" {{{ Syntax Highlighting

syntax enable

" }}}

" Backups & .vimrc Editing {{{

set directory=$HOME/.backups/swaps,$HOME/.backups,$HOME/tmp,.
set backupdir=$HOME/.backups/backups,$HOME/.backups,$HOME/tmp,.
if exists("&undodir")
	set undodir=$HOME/.backups/undofiles,$HOME/.backups,$HOME/tmp,.
endif

" }}}

" Key Mappings {{{

" Set leader key
let mapleader = ","

" Run shell command
" ... and print output
nnoremap <C-h> :.w !bash<CR>
" ... and append output
nnoremap <C-l> yyp!!bash<CR>

" Easy quickfix navigation
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" Newlines
nnoremap <C-j> o<ESC>k
nnoremap <C-k> O<ESC>j

" Usual ^^ behavior re-adds to the buffer list; this leaves it hidden
nnoremap <C-^> :b#<CR>

" Select the stuff I just pasted
nnoremap gV `[V`]

" Easy saving
inoremap <C-u> <ESC>:w<CR>

" Sane pasting
command! Paste call SmartPaste()

" Create the 'tags' file
command! MakeTags !ctags -R .
" Now we can use ^] to jump to tag under cursor, g^] for ambiguous tags, ^t to
" jump back up the tag stack

" De-fuckify whitespace
nnoremap <F4> :retab<CR>:%s/\s\+$//e<CR><C-o>

" De-fuckify syntax highlighting
nnoremap <F3> :syn sync fromstart<CR>

" Editing vimrc
nnoremap ,v :source $MYVIMRC<CR>
nnoremap ,e :edit $MYVIMRC<CR>

" Quickly change search highlighting
nnoremap <silent> ; :set invhlsearch<CR>

" Change indent continuously
vmap < <gv
vmap > >gv

" Tabs
if exists( '*tabpagenr' ) && tabpagenr('$') != 1
    nnoremap ,V :tabdo source $MYVIMRC<CR>
else
    nnoremap ,V :bufdo source $MYVIMRC<CR>
endif

" Movement between tabs OR buffers
"
nnoremap <silent> L :call MyNext()<CR>
nnoremap <silent> H :call MyPrev()<CR>

" Word processing
nnoremap ,N :call WordProcessingToggle()<CR>

" For Notepad-like handling of wrapped lines
nnoremap ,n :call NotepadLineToggle()<CR>

" Quick modeline insert
nnoremap \m ggOvim: et nolist sw=4 ts=4 sts=4<ESC>

" Directory of current file (not pwd)
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Redo last Ex command with bang
nnoremap ,! q:k0ea!<ESC>

" Swap tab/space mode
nnoremap ,<TAB> :set et! list!<CR>

" Insert timestamp
nnoremap <C-d> "=strftime("%-l:%M%p")<CR>P
inoremap <C-d> <C-r>=strftime("%-l:%M%p")<CR>

" }}}

" Custom Functions {{{

" MyStatusLine() {{{

function! MyStatusLine()
    let statusline = ""
    " Filename (F -> full, f -> relative)
    let statusline .= "%f"
    " Buffer flags
    let statusline .= "%( %h%1*%m%*%r%w%) "
    " File format and type
    let statusline .= "(%{&ff}%(\/%Y%))"
    " Left/right separator
    let statusline .= "%="
    " Line & column
    let statusline .= "(%l,%c%V) "
    " Character under cursor (decimal)
    let statusline .= "%03.3b "
    " Character under cursor (hexadecimal)
    let statusline .= "0x%02.2B "
    " File progress
    let statusline .= "| %P/%L"
    return statusline
endfunction

" }}}

" MyNext() and MyPrev(): Movement between tabs OR buffers {{{
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction
" }}}

" WordProcessingToggle() {{{
function! WordProcessingToggle()
    if !exists('b:wordprocessing') || b:wordprocessing
        let b:wordprocessing = 'true'
        setlocal wrap linebreak nolist
        setlocal textwidth=0
        echo "Word processing mode enabled."
    else
        let b:wordprocessing = 'false'
        setlocal nowrap nolinebreak list
        setlocal textwidth=80
        echo "Word processing mode disabled."
    endif
endfunction
" }}}

" NotepadLineToggle(): For Notepad-like handling of wrapped lines {{{
function! NotepadLineToggle()
    if !exists('b:notepadlines') || b:notepadlines
        nnoremap <buffer> j gj
        nnoremap <buffer> k gk
        let b:notepadlines = 'true'
        setlocal wrap
        echo "Notepad wrapped lines enabled."
    else
        unmap <buffer> j
        unmap <buffer> k
        let b:notepadlines = 'false'
        setlocal nowrap
        echo "Notepad wrapped lines disabled."
    endif
endfunction
" }}}

" {{{ Sane Pasting

function! SmartPaste()
    setl paste
    normal "+p
    setl nopaste
endfunction

" }}}

" }}}

