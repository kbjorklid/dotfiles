" === PLUGIN SETUP
set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

" General settings
Plugin 'tpope/vim-sensible'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'bling/vim-airline'
"Find / browse files
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
"File manipulation
Plugin 'danro/rename.vim'
"GIT
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"Misc editing
Plugin 'osyo-manga/vim-over'
Plugin 'terryma/vim-expand-region'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
"Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'Shutnik/jshint2.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mephux/vim-jsfmt'
Plugin 'mxw/vim-jsx'
"Markup languages
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rstacruz/sparkup'
Plugin 'othree/html5.vim'
Plugin 'docunext/closetag.vim'
"Completion, templates...
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'SirVer/ultisnips'
"Misc
Plugin 'junegunn/vim-peekaboo'
Plugin 'junegunn/vim-easy-align'
"Color schemes
Plugin 'ciaranm/inkpot'
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on

let mapleader="\<Space>"


" === PLUGIN SETTINGS
" --- vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" --- ControlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]((te?mp|node_modules|target|dist|bower_modules)|(\.(swp|ico|git|svn)))$'
let g:ctrlp_dont_split = 'nerdtree'
nnoremap <leader>o :CtrlP<CR>

" --- Expand Region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_regin_shrink)

" --- Closetag
autocmd Filetype jsx source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" --- Airline
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode',' ','branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call AirlineInit()

" --- JSHint
let jshint2_save = 1

" --- Javascript Libraries Syntax
let g:used_javascript_libs = 'underscore,requirejs'

" --- YouCompleteMe
set completeopt-=preview
let g:ycm_use_ultisnips_completer=1

" -- UltiSnips
"let g:UltiSnipsExpandTrigger = "<CR>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
"inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
imap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "<Plug>delimitMateCR"

" --- Easymotion
"map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_keys='fgdsatrevcxwyopbnmiulkhj'

" --- DelimitMate
let delimitMate_expand_cr = 1
au FileType javascript let b:delimitMate_quotes="\" '"
au FileType javascript let b:delimitMate_matchpairs = "(:),[:],{:}"
" Skip <, > even in html as it'll mess things up especially with sparkup
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"

" --- Easy Align
vmap <CR> <Plug>(EasyAlign)

" == GENERAL SETTINGS
set wildignore+=.hg,.git,.svn                   "Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg  "Binary images
set wildignore+=*.sw?                           "Vim swap
set wildignore+=*.class                         "Java compiled classes

set noesckeys
set mouse=a
set mousehide
set nocompatible
set modeline
set modelines=5
set scrolljump=5
set scrolloff=3
set showmode
set hidden
set wildmode=list:longest
set ttyfast               " fast scrolling...
set relativenumber
set nu
set nobackup
set nowritebackup
set noswapfile
set noundofile
set foldenable             " enable code folding
set virtualedit=onemore    " Allow cursor beyondlast character
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
map Q <nop>
set updatetime=1000 " mainly vim-gitgutter updates
set ignorecase
set smartcase
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set hlsearch
set nowrap
set textwidth=119
set formatoptions=qrn1
set colorcolumn=121
set foldmethod=syntax
set foldlevelstart=20
autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()


if has('gui_running')
  syntax enable
  colorscheme solarized
  let g:solarized_contrast = "high"
  set background=dark
  highlight clear SignColumn
  set cursorline

  set guioptions=aem
  set lines=40                " 40 lines of text instead of 24
  set columns=126
  "set guifont=Courier\ 10\ Pitch\ 11 
  "set guifont=Monospace\ 11
  set guifont=Inconsolata\ 12
else
  set t_Co=256
  set nocursorline
  syntax on
  set background=dark
  "colorscheme molokai
  "colorscheme inkpot
  let base16colorspace=256
  colorscheme base16-default
endif



" == UTILITY FUNCTIONS

function! StripTrailingWhitespace()
  if !exists('g:spf13_keep_trailing_whitespace')
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
  endif
endfunction

function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction

function! VisualModeDisable()
    nnoremap V :echo "Visual Mode disabled (Enable: :VisualModeEnable)"<cr>
    nnoremap v :echo "Visual Mode disabled (Enable: :VisualModeEnable)"<cr>
endfunction

function! VisualModeEnable()
    nunmap V
    nunmap v
endfunction

command! VisualModeEnable call VisualModeEnable()
command! VisualModeDisable call VisualModeDisable()
" Make stuff harder
VisualModeDisable


nnoremap <Leader>r :call VisualFindAndReplace()<cr>
xnoremap <Leader>r :call VisualFindAndReplaceWithSelection()<cr>

""""""""""""""""""""""""""""""""
" Check out these later
"Bundle 'nathanaelkane/vim-indent-guides'
" topope/vim-surround
" ack
" tcomment
" vim-markdown
" sass?
"Bundle 'scrooloose/nerdtree'
"Bundle 'tpope/vim-unimpaired'
"Bundle 'othree/javascript-libraries-syntax.vim'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/syntastic'
"Bundle 'Townk/vim-autoclose'
"Bundle 'pangloss/vim-javascript'
"Bundle 'hail2u/vim-css3-syntax'
"Bundle 'duff/vim-scratch'
"
" == GENERAL REMAPS
"Visual shifting (does not exit Visual mode on tab)
vnoremap < <gv
vnoremap > >gv

"Movement - better Navigation
nnoremap j gj
nnoremap k gk

" 0 now goes to first char in line instead of blank"
nnoremap 0 0^


nnoremap <leader>q :bd<cr>
nnoremap <leader>Q :w<cr>:bd<cr>

nnoremap <leader>t :NERDTreeToggle<cr>

inoremap <C-t> <esc>g_a
inoremap ;; <esc>g_a;
inoremap {{ <esc>g_a {<cr>}<esc>O

inoremap jk <esc>
inoremap jj <esc>g_a
inoremap JJ <esc>o

inoremap <C-CR> <C-o>o

nnoremap <leader>d :TernDef<cr>
nnoremap <leader>D :TernRename<cr>

command! VimrcSource source ~/.vimrc
command! VimrcEdit e ~/.vimrc

autocmd FileType gitcommit setlocal spell spelllang=en_us


" Testing...
" nmap dar /[{}]<cr>da{:noh<cr>dd
" nmap dir /[{}]<cr>di{:noh<cr>


if filereadable(expand("~/.dotfiles/local/vimrc"))
    source ~/.dotfiles/local/vimrc
endif
