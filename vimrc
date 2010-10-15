" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
if has("gui_running")
  set guifont=Consolas\ 11
  set lines=37 columns=100
  set guioptions-=T
  set guioptions-=m
endif " gui_running

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
map Q gq

" Ben's stuff:

   " Set Backup stuff
   set nobackup
   set nowritebackup

   " Interface
   set ruler
   set showcmd
   set showmatch
   set nu " Line numbering
   set cursorline

   " Searching
   set incsearch
   set hlsearch
   set ic " ignore case in searches
       " Un-hilite search results
   map <C-N> :nohl<CR>
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
   map <C-J> <C-W>j<C-W>_
   map <C-K> <C-W>k<C-W>_

   " Colors
   "colorscheme robinhood
   colorscheme cloudsmidnight
   "colorscheme autumnleaf

   " Key mappings
   let mapleader=","

   " Swapping
      " Swap characters
   map <silent>s xp
      " Swap lines
   map <silent>S ddp
   map <silent>U ddkP

   "Edit / Source .vimrc
   nmap ,s :source ~/.vimrc<CR>
   nmap ,v :tabe ~/.vimrc<CR>

   " File explorer
   nmap <F2> :Explore<CR>
   nmap <S-F2> :Sexplore<CR>

   " Tab mappings
   map <silent><C-S-Up> :if tabpagenr() != tabpagenr('$')<cr>tabclose<cr>if tabpagenr() > 1<cr>tabprev<cr>endif<cr>else<cr>tabclose<cr>endif<cr>
   map <silent><C-F4> :if tabpagenr() != tabpagenr('$')<cr>tabclose<cr>if tabpagenr() > 1<cr>tabprev<cr>endif<cr>else<cr>tabclose<cr>endif<cr>
   map <silent><C-S-Down> :tabnew<CR>
   map <silent><C-S-Left> gT
   map <silent><C-S-Tab> gT
   map <silent><C-S-Right> gt
   map <silent><C-Tab> gt
   map <silent><C-S-PageUp> :tabfirst<CR>
   map <silent><C-S-PageDown> :tablast<CR>
   map <silent><Leader>o :tabnew<CR>:Explore<CR>
   map <silent><Leader>n :tabnew<CR>

  " Load file specific settings
  filetype plugin on

  " Enable file type detection.  Use the default filetype settings, so that
  " mail gets 'tw' set to 72, 'cindent' is on in C files, etc.  Also load
  " indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

   " Set the SQL syntax default
   let g:sql_type_default='sqlanywhere'

   " File specific autocommands
   augroup BenSyntax
       au!
       " Text files
       autocmd Filetype txt vim:spell
       autocmd Filetype txt spelllang=en_us
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

