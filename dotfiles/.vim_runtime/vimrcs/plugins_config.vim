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
" Linter
Plug 'w0rp/ale' 
" Coercion and Subvert command, Surround commands, Repeat plugins, Comment
Plug 'https://github.com/tpope/vim-abolish.git'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-commentary'
" Autocomplete
Plug 'https://github.com/valloric/youcompleteme', {'do': function('BuildYCM')}
" Simple Python folder and make fold faster
Plug 'https://github.com/tmhedberg/SimpylFold'
Plug 'https://github.com/Konfekt/FastFold.git'
" Used by some of the plugins/vimrcs
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plug 'https://github.com/michaeljsmith/vim-indent-object'
" Filetype plugins
" Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/Vimjas/vim-python-pep8-indent.git'
Plug 'https://github.com/vim-python/python-syntax'
" Git plugins
Plug 'https://github.com/tpope/vim-fugitive'
" Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/shumphrey/fugitive-gitlab.vim'
" Zenmode
Plug 'https://github.com/junegunn/goyo.vim', {'for': 'markdown'}
" Yankring
Plug 'https://github.com/maxbrunsfeld/vim-yankstack'
" Autocomplete parenthesis
" Plug 'https://github.com/jiangmiao/auto-pairs.git'
" install fzf + fzf.vim
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" change vim working directory to project directory
Plug 'https://github.com/airblade/vim-rooter'
" colorschemes
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
map <leader>j :Files<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
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

""""""""""""""""""""""""""""""
" => NERDTree plugin
""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>

" Close NERDTree if it is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""
" => Filetypes and polyglot
""""""""""""""""""""""""""""""
" let g:polyglot_disabled = ['python', 'python-ident']
" Markdown
set conceallevel=2
let g:vim_markdown_conceal = 1
" Python
let g:python_pep8_indent_multiline_string = -2
let g:python_highlight_all = 1
" Go
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""
" => Python folding
"""""""""""""""""""""""""""""
" preview docstrings
let g:SimpylFold_docstring_preview = 1
" force fastfold
let g:fastfold_force = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to not load YCM
" let g:loaded_youcompleteme = 0

" use /usr/local/bin/python3 for the homebrew python
let g:ycm_path_to_python_interpreter="/usr/local/bin/python3"
let g:ycm_server_python_interpreter="/usr/local/bin/python3"
let g:ycm_python_binary_path = "/usr/local/bin/python3"
let g:ycm_autoclose_preview_window_after_completion = 1

" Disable syntax check from YCM
let g:ycm_show_diagnostics_ui = 0

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter and Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not remap any keys
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0
nmap <leader>u :GitGutterToggle<cr>
" Gitlab-fugitive
let g:fugitive_gitlab_domains = ['https://gitlab.beno.ai']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers={'python': ['autopep8', 'yapf']}
let g:ale_linters={'python': ['flake8', 'pylint']}
" only run linters on file enter and save
" let g:ale_lint_on_text_changed = 'never'
nmap <leader>e :ALEToggle<cr>
nmap <leader>t <Plug>(ale_fix)
nmap <silent> <leader>, <Plug>(ale_previous_wrap)
nmap <silent> <leader>. <Plug>(ale_next_wrap)
