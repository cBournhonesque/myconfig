function! BuildYCM(info)
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
Plug 'sodapopcan/vim-twiggy'
Plug 'christoomey/vim-conflicted'
Plug 'junegunn/gv.vim'
Plug 'https://github.com/airblade/vim-gitgutter.git'
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
Plug 'junegunn/seoul256.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coloscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme parsec
" colorscheme solarized
" colorscheme gruvbox

let g:seoul256_background = 237
" colo seoul256

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
let g:gitgutter_map_keys = 1
let g:gitgutter_enabled = 1
nmap <leader>u :GitGutterToggle<cr>
" Gitlab-fugitive
let g:fugitive_gitlab_domains = ['https://gitlab.beno.ai']

if has("autocmd")
    " <leader>,, to go back up the tree
    autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' | nnoremap <buffer> <leader>,, :edit %:h<CR> | endif
    " delete previous fugitive buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete
endif

" Other commands
" :GV for gvim
" . to open :Git [CURSOR] SHA
" shift + C to enter the git object of a tree
" [c and ]c to move to previous/next hunk
" ctrl + n and ctrl + p to move to next file name (in gstatus)
set diffopt+=vertical
nnoremap <silent> dg :diffget<Space>
nnoremap <silent> du :diffupdate<cr>
nnoremap <space>,a :Git add %:p<CR><CR>
nnoremap <space>,s :silent :Gstatus<CR>
nnoremap <space>,c :silent :Gcommit -v -q<CR>
nnoremap <space>,d :Gdiff<CR>
nnoremap <space>,e :Gedit<CR>
nnoremap <space>,r :Gread<CR>
nnoremap <space>,w :Gwrite<CR><CR>
" other way of using GV
nnoremap <space>,l :silent! :GV<CR>
nnoremap <space>,b :Gblame<CR>
nnoremap <space>,m :Gmove<Space>
nnoremap <space>,o :Git checkout<Space>
nnoremap <space>,ps :Dispatch! git push<CR>
nnoremap <space>,pl :Dispatch! git pull<CR>
" add mappings for stash/unstash, and for unittest
" so that you can just stash the working dir + index and run the unittest, then
" unstash

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
