"call pathogen#infect()
so ~/.vim/plugins.vim

set nocompatible    " use vim defaults
set guioptions -=T  " remove the toolbar (icons)
"set guioptions -=m  " remove the menu
set ls=2            " allways show status line
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set ruler           " show the cursor position all the time
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
set diffopt+=iwhite " to ignore blank in vimdiff
set guioptions -=m " hide menubar

"""vmap <C-c> "+yi   "copy
"""vmap <C-x> "+c    "cut

set cf  " Enable error files & error jumping.

"nnoremap y "+y"
"vnoremap y "+y"
"set clipboard+=unnamed  " Yanks go on clipboard instead.
set clipboard=unnamed  " Yanks go on clipboard instead.
""set editing-mode vi

set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set nu  " Line numbers on
"set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set ai

set autowrite      " auto saves changes when quitting and swiching buffer
set sm             " show matching braces, somewhat annoying...
set nowrap         " don't wrap lines

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set expandtab      " tabs are converted to spaces, use only when required

"replace tabs with 2 spaces
set et
set sw=2
set sts=2
set smarttab

" Backups & Files
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

syntax on           " syntax highlighing
filetype on " Automatically detect file types.
filetype indent on
filetype plugin on

if has("gui_running")
""See ~/.gvimrc
  "set guifont=Monospace\ Bold\ 10
  set guifont=Monospace\ Bold\ 8
  "set guifont=Monospace\ 11\ Pitch\ 10
  set lines=50        " height = 50 lines
  set columns=100     " width = 100 columns
  set background=light    " adapt colors for background
  set selectmode=key,mouse,cmd
  set keymodel=
  set number
  colorscheme solarized
  let g:solarized_termcolors = 256
  let g:solarized_visibility = "high"
  let g:solarized_contrast = "high"
else
"  "colorscheme morning
"  " solarized options 
"  "let g:solarized_termcolors = 256
"  "let g:solarized_visibility = "high"
"  "let g:solarized_contrast = "high"
"  "colorscheme solarized
endif

" Toggle for quickfix
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nmap <silent> \, :QFix<CR>

"cscope help
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

"nmap <F11> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files ;
"  \:!cscope -b -i cscope.files -f cscope.out<CR>
"  \:cs kill -1<CR>:cs add cscope.out<CR>

syntax enable
let g:LustyJugglerSuppressRubyWarning = 1

map <F2> :NERDTreeToggle<CR> " map F2 to open next buffer
map <F3> :ConqueTermSplit bash<CR>  
nmap <F4> :TagbarToggle<CR>
map <F5> :ShowMarksToggle<CR> 
nnoremap <silent> <F12> :Gvdiffsplit HEAD^<CR>

set wmh=0
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>



"" Command-T
"nnoremap <leader>a :Ack
"noremap <leader>o <Esc>:CommandT<CR>
"noremap <leader>O <Esc>:CommandTFlush<CR>
"noremap <leader>m <Esc>:CommandTBuffer<CR>

""""""""""""""""" Go """"""""""""""""""""""""""'
""" neocomplete
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"     return neocomplete#close_popup() . "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()

 " Go related mappings
 au FileType go nmap <Leader>i <Plug>(go-info)
 au FileType go nmap <Leader>gd <Plug>(go-doc)
 au FileType go nmap <Leader>r <Plug>(go-run)
 au FileType go nmap <Leader>b <Plug>(go-build)
 au FileType go nmap <Leader>t <Plug>(go-test)
 au FileType go nmap gd <Plug>(go-def-tab)

""""""""""""""""""" END of Go """""""""""""""""""""

"""deoplete need nvim
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:gitgutter_git_executable = '/usr/bin/git'


""""""""""""""""
""" Fugitive """
""""""""""""""""
"nmap <leader>h :Gstatus<Enter><C-w>20+
"nmap <leader>w :Git diff<Enter>
"nmap <leader>c :Git add --all<Enter>:Git commit -m
"nmap <leader>l :Gpull --rebase<Enter>
"nmap <leader>p :Gpush<Enter>

"""""""""""""""""""""""""
""" Fuzzy File Finder """
"""""""""""""""""""""""""
let g:fzf_action = {
      \ 'ctrl-s': 'hsplit',
      \ 'ctrl-v': 'vsplit'
      \ }
"let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

"""""""""""""""""""""""""""""
""" Ale - Linting for vim """
"""""""""""""""""""""""""""""

" Move to next error
nmap <silent> <C-e> <Plug>(ale_next_wrap)

" Disable linting when opening a new file
let g:ale_lint_on_enter = 0

" Linting on save
let g:ale_lint_on_save = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'


"" tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" AsyncRun
noremap <F6> :AsyncRun commit-compile.sh <cr>
noremap <F7> :AsyncRun amend-compile.sh <cr>


" your favorite style options
let g:clang_format#style_options = {
              \ "AccessModifierOffset" : -4,
              \ "AllowShortIfStatementsOnASingleLine" : "true",
              \ "AlwaysBreakTemplateDeclarations" : "true",
              \ "Standard" : "C++11"}

augroup ClangFormatSettings
    autocmd!
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    " if you install vim-operator-user
    autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
augroup END

""" gnu global
let $GTAGSDBPATH = "/home/sg211443/atseintl"
let $GTAGSROOT = "/home/sg211443/atseintl"

" To use the default key/mouse mapping:
let GtagsCscope_Auto_Map = 1
" To ignore letter case when searching:
"	let GtagsCscope_Ignore_Case = 1
" To use absolute path name:
let GtagsCscope_Absolute_Path = 1
" To deterring interruption:
let GtagsCscope_Keep_Alive = 1
" If you hope auto loading:
let GtagsCscope_Auto_Load = 1
" To use 'vim -t ', ':tag' and '<C-]>'
set cscopetag

""" buftabline
"Plug 'ap/vim-buftabline'
let g:buftabline_numbers=2
let g:buftabline_indicators=1
let g:buftabline_show = 2       " Always show
" let g:buftabline_separators=1
" quick switch between buffers
nmap <leader>q :bd<cr>
nmap <leader><Esc> :bd!<cr>
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" code folding
autocmd FileType c,cpp setlocal foldmethod=marker
nnoremap <space> za
set runtimepath^=~/.vim/bundle/vlime/vim

""" lightline
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ }
      \ }
function! LightlineFilename()
  return expand('%')
endfunction

"" SlimV
let g:lisp_rainbow=1

"" python-mode
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_rope = 0 " causing vim freeze
let g:pymode_python = 'python3'

"" run cpp from vim
nnoremap <C-c> :!g++ -o %:r.out % -std=c++17<Enter>
nnoremap <C-x> :!%:r.out
