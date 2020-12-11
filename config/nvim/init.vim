" Nvim init file

call plug#begin('~/.config/nvim/plugged')
" Autocomplete
Plug 'Shougo/deoplete.nvim' ", { 'do': ':UpdateRemotePlugins' }

" insert mode + gc = comment line
Plug 'tpope/vim-commentary'

" fuzzy find
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'tbastos/vim-lua'

" pretty colors for python
Plug 'vim-python/python-syntax'

" tab = fold
Plug 'tmhedberg/SimpylFold'

" surround with brackets/quote
Plug 'tpope/vim-surround'

" automatically insert second paren
Plug 'jiangmiao/auto-pairs'
Plug 'neomake/neomake'

" julia support and syntax coloring
Plug 'JuliaEditorSupport/julia-vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'ncm2/ncm2'

" Latex & Markdown
Plug 'lervag/vimtex'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" file manager
Plug 'preservim/nerdtree'

" C++ highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" " autocompletion/function display and goto functionality for python
" Plug 'davidhalter/jedi-vim'

Plug 'deoplete-plugins/deoplete-jedi'

" Plug 'deoplete-plugins/deoplete-clang'
" " autocomplete for C++
" Plug 'ycm-core/YouCompleteMe'
"
Plug 'Shougo/deoplete-clangx'

" Sublime-style minimap on top right corner
" Plug 'severin-lemaignan/vim-minimap'

Plug 'mattn/emmet-vim'

" Swift Syntax

Plug 'lilyball/vim-swift'

" Jinja Syntax ({% block head %})

Plug 'lepture/vim-jinja'

call plug#end()

map <Space> <Leader>

syntax on
" regular
set mouse=a
set expandtab
set shiftwidth=4
set tabstop=4
" set nohlsearch
set number relativenumber
set scrolloff=999
set sidescrolloff=5
set autoindent
set ignorecase
set noshowmode
set splitbelow splitright
set foldmethod=indent
set foldlevel=99
set laststatus=2
set statusline=%f
set omnifunc=syntaxcomplete#Complete
" Python max text width
autocmd FileType python setlocal tw=72 " Automatic word wrapping
autocmd FileType lex setlocal tw=72
set cursorcolumn

" PEP 8 Standard
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

" neomake
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 1000)

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

" set command keys as qwerty in normal mode
" set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?


"HTML

let g:user_emmet_leader_key=','

" Julia

let g:default_julia_version = '1.4'
let g:LanguageClient_serverCommands = {
\   'julia': ['/usr/bin/julia']
\ }

" Language server

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       debug = false; 
\       
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "");
\       server.runlinter = true;
\       run(server);
\   ']
\ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" vimtex
let g:tex_flavor="latex"
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" NERDtree
map <Leader>t :NERDTreeToggle<cr>

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" auto-pairs fly mode
" let g:AutoPairsFlyMode = 0
" let g:AutoPairsShortcutBackInsert = '<M-b>'

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Python Syntax
let g:python_highlight_all = 1

" SimpylFold
let g:SimpylFold_docstring_preview = 1

" LaTeX to Unicode
" eg: \alpha into the symbol
" can be used for any file type
noremap <expr> <F7> LaTeXtoUnicode#Toggle()
let g:latex_to_unicode_keymap = 1

" Save file
nmap <C-S> :w<cr>
vmap <C-S> <esc>:w<cr>
imap <C-S> <esc>:w<cr>

" Quit file
nmap <Leader>q :q<cr>

" Global copy / paste
vmap <C-c> "+y
vmap <C-v> "+P

" Surround
" Word surround (need to add [surround brackets])
nmap <Leader>s ysiw
vmap <Leader>s <S-s>
" Change surround (need to add [current surround][replacement])
nmap <Leader>c cs
" Delete Surround (need to add [current surround])
nmap <Leader>d ds

" Buffer swap
nmap <Leader>b :bn<cr>

" Execute current line in python
nmap <Leader>l :.w !python<cr>
vmap <Leader>l :.w !python<cr>

" Esc-moveRight-insert
nmap <Leader>a la

" Tab
vmap <Tab> >
vmap <S-Tab> <

" Comment
vmap <C-_> gc
nmap <C-_> <C-v>gc

" Copy and Comment
vmap <Leader>y "+ygvgc

" Fold
nnoremap <Tab> za

" C++ compile and run from VIM
nmap <Leader>g :!g++ % -o a.out <cr>
nmap <Leader>e :!./a.out <cr>

" CTRL-P
nmap <Leader>p <C-p>
let g:ctrlp_show_hidden = 1

" Beginning/end of line
imap <C-a> <home>
imap <C-e> <end>

" split vim navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" New line no insert
nmap <Leader>o O<Esc>

" Select Current word
nmap <Leader>w <C-v>iw

" Change Word and insert
nmap <Leader>r ciw

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Colorscheme
colorscheme lena
set fillchars=vert::

" Restore last cursor position and marks on open
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
         \ |   exe "normal! g`\""
         \ | endif

" Starts statusline
so ~/.config/nvim/statusline.vim
