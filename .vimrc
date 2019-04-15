if &compatible
  set nocompatible
endif

"----------------------------------------------------------------------------
" dein setting
"----------------------------------------------------------------------------
" Load dein.
let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand('$HOME/.dein') . '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute ' set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

let s:path = expand('$HOME/.dein')
if !dein#load_state(s:path)
  finish
endif

" Start dein.
call dein#begin(s:dein_dir)

" plugin manage {{{
call dein#add('tomasr/molokai')
call dein#add('w0ng/vim-hybrid')
call dein#add('tpope/vim-fugitive')
call dein#add('itchyny/lightline.vim')

if has('lua')
  call dein#add('Shougo/neocomplete')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
endif
" plugin manage }}}

call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif

"----------------------------------------------------------------------------
" neocomplete setting
"----------------------------------------------------------------------------
if !dein#check_install('neocomplete')
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " Set auto completion start length.
  let g:neocomplete#auto_completion_start_length = 2
  " <CR>: close popup and save indent.
  inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
  " <TAB>: completion.
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  " Close popup by <Space>.
  inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif

"----------------------------------------------------------------------------
" vim base setting
"----------------------------------------------------------------------------
" color scheme
colorscheme molokai
syntax on
" status line
set laststatus=2
set ruler
set showcmd
set showmode
" search
set hlsearch
set ignorecase
set incsearch
set smartcase
" switch highlight
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" edit
set backspace=indent,eol,start
set hidden
set matchtime=3
set showmatch
set virtualedit=all
" cursor
set cursorline
set number
" tab, indent
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set tabstop=2
" file
set autoread
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set nobackup
set noswapfile
