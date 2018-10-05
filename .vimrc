" vim: fdm=marker:foldlevel=0 foldenable sw=4 ts=4 sts=4
" Vim configuration

" {{{ Clear Autocommands

au!

" }}}

" {{{ Plugins

" {{{ Summon Vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" }}}

" Plugins go here
Plugin 'morhetz/gruvbox'
Plugin 'dylanaraps/wal.vim'
Plugin 'JuliaEditorSupport/julia-vim'

" {{{ Dismiss Vundle

call vundle#end()
filetype plugin indent on

" }}}

" }}}

" {{{ Basic Settings

" Clever :find completion. Searches subfolders, tab-completion for file tasks
set path+=**

" Always use bash syntax for sh filetype
let g:is_bash=1

" Color scheme
"set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
"set background=light
set background=dark

" Search is case insensitive unless we include capital letters
set ignorecase smartcase

" Window display
set showcmd ruler laststatus=2
set number

" Open new windows by splitting to the right
set splitright

" Buffers
set history=500
set hidden

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
" :ls shows buffer of files that are already open
" :b letsyou autocomplete any open buffer
set wildmenu
set complete-=i

" Formatting
set nowrap expandtab smarttab shiftround
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldlevelstart=2

" Call custom function for status line
set statusline=%!MyStatusLine()

" Session saving
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,localoptions

" }}}

" {{{ Autocommands

" Make modification indicator [+] white on red background
au ColorScheme * hi User1 gui=bold term=bold cterm=bold guifg=white guibg=red ctermfg=white ctermbg=red

" Tweak the color of the fold display column
au ColorScheme * hi FoldColumn cterm=bold ctermbg=233 ctermfg=146

" }}}

" {{{ Syntax Highlighting

syntax enable

" }}}

" {{{ Backup, Swap, Undo

set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/swap//
set undodir=$HOME/.vim/undo//

" }}}

" {{{ Key Mappings

" Set leader key
let mapleader = ","

" Newlines
nnoremap <C-j> o<ESC>k
nnoremap <C-k> O<ESC>j

" Call custom function for sane pasting
command! Paste call SmartPaste()

" Create 'tags' file
"command! MakeTags !ctags -R .

" Fix whitespace
nnoremap <F4> :retab<CR>:%s/\s\+$//e<CR><C-o>

" Fix syntax highlighting
nnoremap <F3> :syn sync fromstart<CR>

" Edit .vimrc
nnoremap ,e :edit $MYVIMRC<CR>
nnoremap ,v :source $MYVIMRC<CR>

" Toggle search highlighting
nnoremap <silent> ; :set invhlsearch<CR>

" Call custom function to move between tabs OR buffers
nnoremap <silent> L :call MyNext()<CR>
nnoremap <silent> H :call MyPrev()<CR>

" Insert timestamp
"nnoremap <C-d> "=strftime("%-l:%M%p")<CR>P
"inoremap <C-d> <C-r>=strftime("%-l:%M%p")<CR>

" URLview
noremap <leader>u :w<Home>silent <End> !urlview<CR>

" }}}

" {{{ Custom Functions

" {{{ MyStatusLine()

function! MyStatusLine()
    let statusline = ""
    " Filename (F -> full, f-> relative)
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

" {{{ MyNext() and MyPrev()

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
        " No tab suport, or no tabs open
        execute ":bprev"
    endif
endfunction

" }}}

" {{{ SmartPaste()
function! SmartPaste()
    setl paste
    normal "+p
    setl nopaste
endfunction
" }}}

" }}}
