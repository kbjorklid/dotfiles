" #############################
" # PLUGINS
" ##############################

call plug#begin('~/.local/share/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'cazador481/fakeclip.neovim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sheerun/vim-polyglot'

call plug#end()

let mapleader="\<Space>"



" ##############################
" # PLUGIN SETTINGS
" ##############################

" CTRLP
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]((te?mp|node_modules|target|dist|bower_modules)|(\.(swp|ico|git|svn)))$'
let g:ctrlp_dont_split = 'nerdtree'
nnoremap <leader>o :CtrlP<CR>

" AIRLINE
let g:airline_powerline_fonts = 1

" DEOPLETE
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 50


function! s:tabfunc()
  if pumvisible()
    return "\<c-n>"
  elseif neosnippet#jumpable()
    return "\<Plug>(neosnippet_jump)"
  else
    return "\<tab>"
  endif
endfunction

function! s:expand_autocomplete_snippet()
    if pumvisible() && neosnippet#expandable_or_jumpable() 
        return "\<Plug>(neosnippet_expand_or_jump)"
    else
        return "\<CR>"
    endif
endfunction

imap <expr><TAB> <SID>tabfunc()
imap <expr><CR> <SID>expand_autocomplete_snippet()

" ##############################
" # COLORS
" ##############################

set t_Co=256
set background=dark
if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
endif
let base16colorspace=256
colorscheme base16-default-dark

" ##############################
" # GENERAL SETTINGS
" ##############################

set clipboard=unnamedplus
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

" Make insert mode cursor a pipe
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ##############################
" # KEY BINDINGS
" ##############################

"Visual shifting (does not exit Visual mode on tab)
vnoremap < <gv
vnoremap > >gv

"Movement - better Navigation
nnoremap j gj
nnoremap k gk

" 0 now goes to first char in line instead of blank
nnoremap 0 0^

inoremap jk <esc>

" ##############################
" # AUTO COMMANDS
" ##############################

autocmd FileType gitcommit setlocal spell spelllang=en_us
