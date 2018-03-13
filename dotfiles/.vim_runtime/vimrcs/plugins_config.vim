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
" => Load vimplug paths
""""""""""""""""""""""""""""""
call plug#begin('~/.vim_runtime/plugged')
" Lightline status bar
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/ap/vim-buftabline'
Plug 'maximbaz/lightline-ale'
" For files navigation
Plug 'https://github.com/scrooloose/nerdtree.git', {'on':  'NERDTreeToggle'} 
" Activate paste mode when pasting with command + V
Plug 'https://github.com/ConradIrwin/vim-bracketed-paste'
" Snippet engine and list of pre-existing snippets
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets'
" Linter
Plug 'w0rp/ale' 
" Coercion and Subvert command, Surround commands, Repeat plugins, Comment
Plug 'https://github.com/tpope/vim-abolish.git'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-commentary'
" Better indent for python
Plug 'https://github.com/Vimjas/vim-python-pep8-indent.git'
" Autocomplete
Plug 'https://github.com/valloric/youcompleteme', {'do': function('BuildYCM')}
" Simple Python folder and make fold faster
Plug 'https://github.com/tmhedberg/SimpylFold'
Plug 'https://github.com/Konfekt/FastFold.git'
" CtrlP fuzzy finder
" Plug 'https://github.com/ctrlpvim/ctrlp.vim'
" Used by some of the plugins/vimrcs
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plug 'https://github.com/michaeljsmith/vim-indent-object'
" Filetype plugins
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/fatih/vim-go'
Plug 'wting/rust.vim', {'for': 'rust'}
" Git plugins
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter.git'
" Zenmode
Plug 'https://github.com/junegunn/goyo.vim', {'for': 'markdown'}
" Yankring
Plug 'https://github.com/maxbrunsfeld/vim-yankstack'
" Autocomplete parenthesis
Plug 'https://github.com/jiangmiao/auto-pairs.git'
" install fzf + fzf.vim
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" colorscemes
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'Keithbsmiley/parsec.vim'
Plug 'https://github.com/morhetz/gruvbox'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files which contain a certain term (:Find term)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" fzf commands
map <leader>o :Buffers<cr>

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
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = {'right': [['lineinfo'],
['percent'], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

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

""""""""""""""""""""""""""""""
" => vim-markdown
""""""""""""""""""""""""""""""
" Conceal links, italic, bold, etc.
set conceallevel=2
let g:vim_markdown_conceal = 1


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
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

""""""""""""""""""""""""""""""
" => fzf
""""""""""""""""""""""""""""""
map <leader>j :Files<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not remap any keys
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0
nmap <leader>u :GitGutterToggle<cr>

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
" let MRU_Max_Entries = 400
" let g:ctrlp_working_path_mode = 'ra'

" let g:ctrlp_map = '<c-f>'
" map <leader>j :CtrlP<cr>
" map <leader>f :CtrlPMRU<cr>
" map <c-b> :CtrlPBuffer<cr>

" let g:ctrlp_max_height = 15
" let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


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
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers={'python': ['autopep8', 'yapf']}
let g:ale_linters={'python': ['flake8', 'pylint']}
nmap <leader>e :ALEToggle<cr>
nmap <silent> <leader>, <Plug>(ale_previous_wrap)
nmap <silent> <leader>. <Plug>(ale_next_wrap)
