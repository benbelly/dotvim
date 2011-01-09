" These must go first as other settings can throw them off
set nocompatible
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on


" allow backspacing over everything in insert mode
set backspace=indent,eol,start
map Q gq

   " Key mappings
   let mapleader=","

   " Set Backup stuff
   set nobackup
   set nowritebackup

   " Interface
   set ruler
   set showcmd
   set showmatch
   "set nu " Line numbering
   set cursorline

   " Searching
   set incsearch
   set hlsearch
   set ic " ignore case in searches
       " Un-hilite search results
   map <Leader><Space> :nohl<CR>
       " Un-hilite MultipleSearch results
   map <A-n> :SearchReset<CR>
   let g:MultipleSearchMaxColors=9 " Max colors for MultipleSearch

   " Formatting
   set tabstop=4
   set shiftwidth=4
   set expandtab
   set textwidth=96 " wrap at column 96 at Lenel
   set autoindent
   set fileformat=unix
   nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
   "set formatprg=par\ -re
   " set relativenumber " not in this version
   syntax on

   " Clipboard
   set clipboard=autoselect
        " Copy - note missing movement
   map <A-c> "+y
        " Cut - note missing movement
   map <A-x> "+d
        " Paste before cursor
   map <A-v> "+P

   " Windows
   nmap <C-Up> <C-W>k<C-W>_
   nmap <C-Down> <C-W>j<C-W>_

   " Colors
   colorscheme robinhood
   "colorscheme CloudsMidnight
   "colorscheme autumnleaf

   " Emacs
   nmap <silent><C-O> i<CR><ESC>

   " Swapping
   nmap <silent>s xp
   " Bubble lines
   nmap <C-k> [e
   nmap <C-j> ]e
   vmap <C-k> [egv
   vmap <C-j> ]egv

   "Move in a wrapped line
    nmap <M-j> gj
    nmap <M-k> gk

   "Edit / Source .vimrc
   nmap <Leader>s :source ~/.vimrc<CR>
   nmap <Leader>v :tabe ~/.vimrc<CR>

   " Spelling
   set spelllang=en_us
   nmap <silent><Leader>p :set spell!<CR>

   " File explorer
   nmap <F2> :Explore<CR>
   nmap <S-F2> :Sexplore<CR>

   " Tab mappings
   nmap <silent><C-F4> :if tabpagenr() != tabpagenr('$')<cr>tabclose<cr>if tabpagenr() > 1<cr>tabprev<cr>endif<cr>else<cr>tabclose<cr>endif<cr>
   nmap <silent><C-S-Tab> gT
   nmap <silent><C-Tab> gt
   nmap <silent><Leader>o :tabnew<CR>:Explore<CR>
   nmap <silent><Leader>n :tabnew<CR>

   map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
   map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
   map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
   map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

   " Set the SQL syntax default
   let g:sql_type_default='sqlanywhere'

   " File specific autocommands
   augroup BenSyntax
       au!
       " Text files
       autocmd Filetype txt vim:spell
       autocmd Filetype txt spelllang=en_us
       autocmd Filetype txt tw=0
   augroup END

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
      au!

      " For all text files set 'textwidth' to 78 characters.
      "autocmd FileType text setlocal textwidth=78

      " When editing a file, always jump to the last known cursor position.
      " Don't do it when the position is invalid or when inside an event handler
      " (happens when dropping a file on gvim).
      autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  augroup END " vimrcEx

  ""
  "" Functions
  ""
  " Show syntax highlighting groups for word under cursor
  nmap <C-S-P> :call <SID>SynStack()<CR>
  function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc 

