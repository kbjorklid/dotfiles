"""""""""""""""""""""""""""""""""""
" Initial Configuration
"""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""""""""""""""""""""""""""
" Vundle Bundles (plugins).
"""""""""""""""""""""""""""""""""""

" let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'
" Sensible defaults:
Bundle 'tpope/vim-sensible'     

" Colors
Bundle 'jakecraige/vim-colors'
Bundle 'thingsinjars/Cobalt.vim'
Bundle 'altercation/vim-colors-solarized'

" Code Completion
"Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'

" JavaScript-related stuff
Bundle 'jelera/vim-javascript-syntax'
Bundle 'nathanaelkane/vim-indent-guides'

" Open files quickly
Bundle 'kien/ctrlp.vim' 

" Expand selection
Bundle 'terryma/vim-expand-region'

Bundle 'scrooloose/nerdtree' 

map <c-n> :NERDTreeToggle<cr>

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
""""""""""""""""""""""""""""""""""""""""""""""
  let mapleader = ","
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
"  set visualbell
  set cursorline
  set ttyfast               " fast scrolling...
"  set list
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
"  command! Q q " Bind :Q to :q
"  command! Qall qall

" Disable Ex mode
  map Q <nop>

"Status line with fugitive git integration
"  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" Auto format comment blocks
" set comments=sl:/*,mb:*,elx:*/

" Remove trailing whitespaces and ^M chars
  autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()


" Change Working Directory to that of the current file
"    cmap cwd lcd %:p:h
"    cmap cd. lcd %:p:h

"Fix broken searching by enabling regular regex I think?
  nnoremap / /\v
  vnoremap / /\v
  set ignorecase
  set smartcase
  set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
  set hlsearch

"Text wrapping
  set wrap
  set textwidth=119
  set formatoptions=qrn1
  set colorcolumn=121

"Set folding to use indent by default to fold
  set foldmethod=syntax
  set foldlevelstart=20
"  nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"  vnoremap <Space> zf

set guifont=Inconsolata\ 13
if has('gui_running')
  colorscheme molokai
  " removes scrollbar and toolbar"
  set guioptions+=lrb
  set guioptions-=lrb           " Remove the toolbar
  set guioptions-=T
  set lines=40                " 40 lines of text instead of 24
  set columns=126
else
  set background=dark
  "colorscheme solarized
  "colorscheme cobalt
  "colorscheme molokai
endif

"Visual shifting (does not exit Visual mode on tab)
  vnoremap < <gv
  vnoremap > >gv

"For when you forget to sudo.. Really Write the file.
"  cmap w!! w !sudo tee % >/dev/null

"Adjust viewports to the same size
"  map <Leader>= <C-w>=

"Movement - better Navigation
  nnoremap j gj
  nnoremap k gk

" 0 now goes to first char in line instead of blank"
  nnoremap 0 0^

"Rehighlight pasted text
"  nnoremap <leader>v V`]

"Edit vimrc
"  nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc<cr>

"Save a keystroke
"  nnoremap ; :


"Save all files and run make in curr directory
"  nmap <Leader>M <ESC>:wa<CR>:make!<CR>

"Split Window Navigation mapping
"  nnoremap <leader>w <C-w>v<C-w>l
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
"  map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
"  map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
"  map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

"Undo highlignted searches
"  nnoremap <leader><space> :noh<cr>

"map <leader><tab> :Scratch<CR>

""""" Settings for NERDTree
"let NERDTreeIgnore=['\~$', '^\.git', '\.swp$', '\.DS_Store$']
"let NERDTreeShowHidden=1
"map <C-e> :NERDTreeToggle<CR>

""""" Settings for taglist.vim
"let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=0
"let Tlist_Enable_Fold_Column=0
"let Tlist_Compact_Format=0
"let Tlist_WinWidth=28
"let Tlist_Exit_OnlyWindow=1
"let Tlist_File_Fold_Auto_Close = 1
"nmap <leader>tl :Tlist<cr>

" doesn't work well
"map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
"map <Leader>r :%s/

" Git Setup
"map <Leader>gac :Gcommit -m -a ""<LEFT>
"map <Leader>gc :Gcommit -m ""<LEFT>
"map <Leader>gs :Gstatus<CR>
"map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>
" Select all, copy, go back to where you were, and duplicate
"map <Leader>a ggVGy<C-o><C-o>
"map <Leader>d y'>p
"map <Leader>c :sh<CR>

" resize split windows, need to map
" :vertical resize +-5<CR>"


"""""" Settings for Sparkup
"  let g:sparkupExecuteMapping = '<leader>h'
  "let g:sparkupNextMapping = '<TAB>'

""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe options
"""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview


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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! RenameFile()
"    let old_name = expand('%')
"    let new_name = input('New file name: ', expand('%'), 'file')
"    if new_name != '' && new_name != old_name
"        exec ':saveas ' . new_name
"        exec ':silent !rm ' . old_name
"        redraw!
"    endif
"endfunction
"map <Leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KB custom stuff start.
" save to ctlr-s:
noremap <c-s>      :w<CR>
vnoremap <c-s>     <C-C>:w<CR>
inoremap <c-s>     <C-O>:w<CR>

inoremap <c-CR> <CR><ESC>O

nnoremap <leader>t  :tabe<CR>:CtrlP<CR>
nnoremap <leader>o  :CtrlP<CR>

"Bind jj to ESC for quicker switching modes
"inoremap jj <ESC>
"inoremap <ESC> <nop>

"Bind ,, to execute one command, return to insert mode
inoremap ,, <c-o>

"CTRL-L to complete whole row
inoremap <c-l>      <c-x><c-l>

noremap +           $
noremap $           <nop>   
