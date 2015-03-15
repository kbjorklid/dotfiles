" === PLUGIN SETUP
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-sensible'     
Plugin 'editorconfig/editorconfig-vim'
Plugin 'osyo-manga/vim-over'
Plugin 'kien/ctrlp.vim' 
Plugin 'mileszs/ack.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Shutnik/jshint2.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Plugin 'mephux/vim-jsfmt'
Plugin 'rstacruz/sparkup'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'SirVer/ultisnips'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'

call vundle#end()
filetype plugin indent on

let mapleader="\<Space>"


" === PLUGIN SETTINGS
" --- ControlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]((temp|node_modules|target|dist|bower_modules)|(\.(swp|ico|git|svn)))$'
nnoremap <leader>o :CtrlP<CR>

" --- Expand Region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_regin_shrink)

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
"inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
imap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "<Plug>delimitMateCR"

" --- Easymotion
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_keys='hklyuiopnmqwertzxcvbasdgjf'

" --- DelimitMate
let delimitMate_expand_cr = 1
au FileType javascript let b:delimitMate_quotes="\" '"
au FileType javascript let b:delimitMate_matchpairs = "(:),[:],{:}"

" == GENERAL SETTINGS
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg
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
set wrap
set textwidth=119
set formatoptions=qrn1
set colorcolumn=121
set foldmethod=syntax
set foldlevelstart=20



autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()


if has('gui_running')
  syntax enable
  colorscheme solarized
  set background=dark
  highlight clear SignColumn

  set guioptions+=lrb
  set guioptions-=lrb           " Remove the toolbar
  set guioptions-=T
  set lines=40                " 40 lines of text instead of 24
  set columns=126
  set guifont=Courier\ 10\ Pitch\ 11
else
  set t_Co=256
  syntax on
  set background=dark
  colorscheme molokai
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'} 
"Bundle 'othree/javascript-libraries-syntax.vim'
"Bundle 'scrooloose/nerdcommenter' 
"Bundle 'scrooloose/syntastic' 
"Bundle 'Townk/vim-autoclose'
"Bundle 'pangloss/vim-javascript'
"Bundle 'hail2u/vim-css3-syntax'
"Bundle 'vim-scripts/TaskList.vim'
"Bundle 'vim-scripts/taglist.vim'
"Bundle 'duff/vim-scratch'


" Gitgutter colors
"
"set background=dark
"highlight clear SignColumn
"highlight! SignColumn guibg=black
"highlight! GitGutterAdd guibg=#005500
"highlight! GitGutterAdd guifg=#33cc33
"highlight! GitGutterChange guibg=#005555
"highlight! GitGutterChange guifg=cyan
"highlight! GitGutterDelete guibg=black
"highlight! GitGutterDelete guifg=red
"highlight! GitGutterChangeDelete guibg=#005555
"highlight! GitGutterChangeDelete guifg=red
"
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

"Split Window Navigation mapping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>ev :e ~/.vimrc<cr>

inoremap ,, <C-o>

nnoremap <leader>q :bd<cr>
nnoremap <leader>Q :w<cr>:bd<cr>
