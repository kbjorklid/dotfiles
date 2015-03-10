"""""""""""""""""""""""""""""""""""
" Initial Configuration
"
"""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let mapleader=","

"""""""""""""""""""""""""""""""""""
" Vundle Bundles (plugins).
"""""""""""""""""""""""""""""""""""

" == GENERIC
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-sensible'     
Plugin 'editorconfig/editorconfig-vim'

" == FILE / BUFFER MANAGEMENT
Plugin 'kien/ctrlp.vim' 
let g:ctrlp_show_hidden = 1

" == COLORS
Plugin 'thingsinjars/Cobalt.vim'

" == JAVASCRIPT
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Shutnik/jshint2.vim'
let jshint2_save = 1

let g:UltiSnipsExpandTrigger = "<cr>"

" == SNIPPETS
Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
let g:ycm_use_ultisnips_completer=1

" better key bindings for UltiSnipsExpandTrigger

let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"



"Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" == Easymotion
Plugin 'Lokaltog/vim-easymotion'


""""""""""""""""""""""""""""""""
" Check out these later
"Bundle 'nathanaelkane/vim-indent-guides'
" topope/vim-surround
" ack
" tcomment
" vim-markdown
" sass?
"

"""""""""""""""""""""""""""""""
"deprecated
"Bundle 'jakecraige/vim-colors'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'marijnh/tern_for_vim'
"Bundle 'jelera/vim-javascript-syntax'

" Expand selection
"Bundle 'terryma/vim-expand-region'

"Bundle 'scrooloose/nerdtree' 

"map <c-n> :NERDTreeToggle<cr>

"let g:snips_trigger_key = '<c-j>'
"Bundle 'msanders/snipmate.vim' 


" check these out:
"Bundle 'tpope/vim-surround'    
"Bundle 'tpope/vim-unimpaired'
" GIT commands
" Bundle 'tpope/vim-fugitive'     
" zendcoding for HTML
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'} 
"Bundle 'othree/javascript-libraries-syntax.vim'
"Bundle 'scrooloose/nerdcommenter' 
"Bundle 'scrooloose/syntastic' 
"Bundle 'Townk/vim-autoclose'
"Bundle 'pangloss/vim-javascript'
"Bundle 'hail2u/vim-css3-syntax'

" Even more stuff:
"Bundle 'vim-scripts/TaskList.vim'
"Bundle 'vim-scripts/taglist.vim'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'duff/vim-scratch'

 "vim-scripts repos
 "Bundle 'L9'
 "Bundle 'FuzzyFinder'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.. 

" autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

" Compile coffee files automatically on sav - add | redraw! for terminal
  "au BufWritePost *.coffee silent CoffeeMake! -b | cwindow

""""""""""""""""""""""""""""""""""""""""""""""
" General stuff to make everything better
  set noesckeys
  set mouse=a
  set mousehide
  set nocompatible
  set modelines=0
  set scrolljump=5
  set scrolloff=3
  set showmode
  set hidden
  set wildmode=list:longest
  set cursorline
  set ttyfast               " fast scrolling...
  set relativenumber
  set nobackup
  set noswapfile
  set noundofile
  set foldenable             " enable code folding
  set virtualedit=onemore    " Allow cursor beyondlast character
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids

  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
  set expandtab
  map Q <nop>

  autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

  set ignorecase
  set smartcase
  set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
  set hlsearch

  set wrap
  set textwidth=119
  set formatoptions=qrn1
  set colorcolumn=121

  set foldmethod=syntax
  set foldlevelstart=20

if has('gui_running')
  colorscheme molokai
  " removes scrollbar and toolbar"
  set guioptions+=lrb
  set guioptions-=lrb           " Remove the toolbar
  set guioptions-=T
  set lines=40                " 40 lines of text instead of 24
  set columns=126
  set guifont=Andale\ Mono\ 10
else
  set t_Co=256
  syntax on
  set background=dark
  "colorscheme solarized
  "colorscheme cobalt
  colorscheme molokai
endif

"Visual shifting (does not exit Visual mode on tab)
  vnoremap < <gv
  vnoremap > >gv


"Movement - better Navigation
  nnoremap j gj
  nnoremap k gk

" 0 now goes to first char in line instead of blank"
  nnoremap 0 0^

"Split Window Navigation mapping
"  nnoremap <leader>w <C-w>v<C-w>l
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! StripTrailingWhitespace()
  if !exists('g:spf13_keep_trailing_whitespace')
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endif
endfunction

" KB custom stuff start.
" save to ctlr-s:
noremap <c-s>      :w<CR>

vnoremap <c-s>     <C-C>:w<CR>
inoremap <c-s>     <C-O>:w<CR>

inoremap <c-CR> <CR><ESC>O

nnoremap <leader>t  :tabe<CR>:CtrlP<CR>
nnoremap <leader>o  :CtrlP<CR>

" FILETYPES
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
