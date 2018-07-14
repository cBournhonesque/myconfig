""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    set term=screen-256color 
endif


"""""""""""""""""""""""""""""
" => Markdown section
"""""""""""""""""""""""""""""
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
