
set lines=37 columns=100
set guioptions-=T
set guioptions-=r
set guioptions-=R

set guifont=Menlo\ Regular:h15

" Colors
colorscheme solarized
map <leader>l :let g:solarized_style="light"<CR>:colorscheme solarized<CR>
map <leader>d :let g:solarized_style="dark"<CR>:colorscheme solarized<CR>
"colorscheme robinhood
"colorscheme CloudsMidnight
"colorscheme autumnleaf

syntax on " Don't highlight syntax in terminals
