" Config for neovim
if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
else
    set ttymouse=xterm2
endif

" remap escape key
inoremap jk <ESC>

" Always compute syntax from whole file
" autocmd BufEnter * :syntax sync fromstart
set synmaxcol=128
" syn sync maxlines=100

" Start with folding open at max level of folding
autocmd BufAdd * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" Start with folding disabled
" set nofoldenable

" Change cursor style for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Set Ctrl-C to the + (X11) register
vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <C-v> "+p
inoremap <C-v> "+p

" Highlight for 80 characters
set colorcolumn=80

" wrap :cnext/:cprevious and :lnext/:lprevious
function! WrapCommand(direction, prefix)
    if a:direction == "up"
        try
            execute a:prefix . "previous"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "last"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute a:prefix . "next"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "first"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction

" <Home> and <End> go up and down the quickfix list and wrap around
nnoremap <silent> [q :call WrapCommand('up', 'c')<CR>
nnoremap <silent> ]q :call WrapCommand('down', 'c')<CR>

" <C-9> and <C-0> go up and down the location list and wrap around
nnoremap <silent> [l :call WrapCommand('up', 'l')<CR>
nnoremap <silent> ]l  :call WrapCommand('down', 'l')<CR>

" Set :Q to do :q
noremap :Q :q<cr>
