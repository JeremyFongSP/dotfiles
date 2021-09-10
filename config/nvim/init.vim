" Nvim init file

call plug#begin('~/.config/nvim/plugged')
" " Autocomplete
" Plug 'Shougo/deoplete.nvim' ", { 'do': ':UpdateRemotePlugins' }

" AutoComplete (different)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language Linting
Plug 'dense-analysis/ale'

" insert mode + gc = comment line
Plug 'tpope/vim-commentary'

" fuzzy find
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'tbastos/vim-lua'

" language pack - on demand loading (all languages)
Plug 'sheerun/vim-polyglot'

" " pretty colors for python
" Plug 'vim-python/python-syntax'

" tab = fold
Plug 'tmhedberg/SimpylFold'

" surround with brackets/quote
Plug 'tpope/vim-surround'

" jump parenthese and style
Plug 'andymass/vim-matchup'
Plug 'luochen1990/rainbow'

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

" Plug 'deoplete-plugins/deoplete-jedi'

" Plug 'deoplete-plugins/deoplete-clang'
" " autocomplete for C++
" Plug 'ycm-core/YouCompleteMe'
"
" Plug 'Shougo/deoplete-clangx'

" Sublime-style minimap on top right corner
" Plug 'severin-lemaignan/vim-minimap'

Plug 'mattn/emmet-vim'

" Swift Syntax

Plug 'lilyball/vim-swift'

" Jinja Syntax ({% block head %})

Plug 'lepture/vim-jinja'

" Indent Guides

Plug 'nathanaelkane/vim-indent-guides'

" ctags for vim

" Plug 'ludovicchabant/vim-gutentags'

" Cheatsheet (cht.sh) for vim

Plug 'dbeniamine/cheat.sh-vim'

" Javascript

Plug 'pangloss/vim-javascript'

" Flutter

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim', { 'branch' : 'main' }
Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'

" C#
Plug 'OmniSharp/omnisharp-vim'

" Snippets
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

" R
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

call plug#end()

map <Space> <Leader>

syntax on
" regular
set mouse=a
set expandtab
set shiftwidth=4
set tabstop=4
set number relativenumber
set scrolloff=999
set sidescrolloff=5
set ignorecase
set noshowmode
set splitbelow splitright
set foldmethod=indent
set foldlevel=99
set laststatus=2
set statusline=%f
set omnifunc=syntaxcomplete#Complete
" autocmd FileType python setlocal tw=80 " Automatic word wrapping
" autocmd FileType lex setlocal tw=80
set cursorcolumn
set cursorline

" Dart indentation 2 spaces
autocmd Filetype dart setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Paren styling
let g:rainbow_active = 1

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 0

" PEP 8 Standard
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    " \ textwidth=79 (Disable automatic text wrapping)
    \ expandtab
    \ autoindent
    \ fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

" neomake
" When writing a buffer (no delay), and on normal mode changes (after 750ms)
call neomake#configure#automake('nw', 1000)


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

" ctags
" default mapping for find definition <c-]>


"resize windows
nnoremap = <c-w>>
nnoremap - <c-w><

" NERDtree
let g:NERDTreeWinPos = "right"
nnoremap <Leader>tt :NERDTreeFind<CR>
nnoremap <Leader>tv :NERDTreeToggle<cr>

" " deoplete
" let g:deoplete#enable_at_startup = 1
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ale disable lsp when used with coc
let g:ale_disable_lsp = 1
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '!'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

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
nmap <Leader>ss ysiw
vmap <Leader>ss <S-s>
" Change surround (need to add [current surround][replacement])
nmap <Leader>sc cs
" Delete Surround (need to add [current surround])
nmap <Leader>sd ds

" Buffer swap
nmap <Leader>b :bn<cr>

" Execute current line in python
nmap <Leader>l :.w !python<cr>
vmap <Leader>l :.w !python<cr>

" Esc-moveRight-insert
" nmap <Leader>a la

" Enter bracket
nmap <Leader>( f(a
nmap <Leader>[ f[a
nmap <Leader>{ f{a

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

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Colorscheme
colorscheme lena
" set fillchars=vert:\|

" Restore last cursor position and marks on open
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
         \ |   exe "normal! g`\""
         \ | endif

" Starts statusline
so ~/.config/nvim/statusline.vim


" COC CONFIG -------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap<leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" " Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR> 
