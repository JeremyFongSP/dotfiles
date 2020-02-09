" Nvim init file

call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'tbastos/vim-lua'
Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'
" Plug 'nvie/vim-flake7'
" Plug 'tpope/vim-surround'
" Plug 'jiangmiao/auto-pairs'
Plug 'neomake/neomake'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
call plug#end()

map <Space> <Leader>

syntax on
" regular
set expandtab
set shiftwidth=4
set tabstop=4
" set nohlsearch
set number relativenumber
set scrolloff=10
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
set tw=72 " Automatic word wrapping

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

" Save file
nmap <C-S> :w<cr>
vmap <C-S> <esc>:w<cr>
imap <C-S> <esc>:w<cr>

" Quit file
nmap <Leader>q :q<cr>

" Global copy / paste
vmap <C-c> "+y
vmap <C-v> "+P

" Tab
vmap <Tab> >
vmap <S-Tab> <

" Fold
nnoremap <Tab> za

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
