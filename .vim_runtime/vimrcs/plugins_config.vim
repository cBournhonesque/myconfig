"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !python3 install.py
  endif
endfunction

""""""""""""""""""""""""""""""
" => Load plugins
""""""""""""""""""""""""""""""
call plug#begin('~/.vim_runtime/plugged')
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/ap/vim-buftabline'
Plug 'https://github.com/scrooloose/nerdtree.git', {'on':  'NERDTreeToggle'} 
Plug 'https://github.com/ConradIrwin/vim-bracketed-paste'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/tpope/vim-abolish.git'
Plug 'https://github.com/Vimjas/vim-python-pep8-indent.git'
" Plug '~/.vim_runtime/sources_non_forked/youcompleteme'
Plug 'https://github.com/valloric/youcompleteme', {'do': function('BuildYCM')}
Plug 'https://github.com/Konfekt/FastFold.git'
Plug 'https://github.com/tmhedberg/SimpylFold'
Plug 'https://github.com/mileszs/ack.vim'
Plug 'https://github.com/rking/ag.vim'
Plug 'https://github.com/corntrace/bufexplorer'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/vim-scripts/mayansmoke'
Plug 'https://github.com/amix/open_file_under_cursor.vim'
Plug 'https://github.com/vim-scripts/tlib'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plug 'https://github.com/sophacles/vim-bundle-mako'
Plug 'https://github.com/kchmck/vim-coffee-script'
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/michaeljsmith/vim-indent-object'
Plug 'https://github.com/groenewege/vim-less'
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/therubymug/vim-pyte'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/terryma/vim-expand-region'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/junegunn/goyo.vim', {'for': 'markdown'}
Plug 'https://github.com/amix/vim-zenroom2'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/fatih/vim-go'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/digitaltoad/vim-pug'
Plug 'https://github.com/maxbrunsfeld/vim-yankstack'
Plug 'taohex/lightline-buffer'
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'fenetikm/falcon'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

""""""""""""""""""""""""""""""
" => Falcon
""""""""""""""""""""""""""""""
let g:falcon_lightline = 1
let g:lightline.colorscheme='falcon'


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => NERDTree plugin
""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>

" Close NERDTree if it is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""
" => pep8-indent plugin
""""""""""""""""""""""""""""""
let g:python_pep8_indent_multiline_string=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to not load YCM
" let g:loaded_youcompleteme = 0

" use /usr/local/bin/python3 for the homebrew python
let g:ycm_path_to_python_interpreter="/usr/bin/python3"
let g:ycm_server_python_interpreter="/usr/bin/python3"
let g:ycm_python_binary_path = "/usr/bin/python3"
let g:ycm_autoclose_preview_window_after_completion = 1

" Disable syntax check (normally only for C) so that syntastic works
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_show_diagnostics_ui = 1

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""
" => UltiSnips
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsListSnippets = '<c-l>'


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <leader>f :CtrlPMRU<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 15
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'


let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>e :SyntasticCheck<CR>
nnoremap <leader>s :SyntasticToggleMode<CR>
nnoremap <leader>ee :sign unplace *<CR>

" Python
let g:syntastic_python_checkers=['flake8', 'mypy']
let g:syntastic_python_mypy_args= "--follow-imports=skip --ignore-missing-imports"

" Javascript
let g:syntastic_javascript_checkers = ['jshint']

" " Go
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Custom CoffeeScript SyntasticCheck
func! SyntasticCheckCoffeescript()
	let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
	execute "tabedit " . l:filename
	execute "SyntasticCheck"
	execute "Errors"
endfunc
nnoremap <silent> <leader>c :call SyntasticCheckCoffeescript()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>u :GitGutterToggle<cr>
