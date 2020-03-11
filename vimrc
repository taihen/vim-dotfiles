" vim:set ft=vim et sw=2:

" pathogen {{{
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" }}}

" basic {{{
set path+=**   " jumping into recursive search for any path
set encoding=utf-8
set laststatus=1   " last window always have status line
set bs=2   " fix backspace on some environments in INSERT mode
set modeline   " allow vim options to be embedded in files;
set modelines=5   " they must be within the first or last 5 lines.
set guioptions=aegimrLt
set nocompatible   " turn off vi compatibility for more features
"set term=builtin_ansi " arrow key navigation
"set esckeys   " allow cursor keys in insert mode
set showcmd   " show flow characters
set foldmethod=marker
set expandtab   " don't use tab use spaces instead
set ignorecase
set autowrite
set backup
set backupdir=~/.vim/backup
set noswapfile "  i don't want to recovery
set directory=~/.vim/temp
if exists("&undodir")
  set undodir=~/.vim/undo
endif
set hidden   " allow switching buffers without writting
set autochdir
set cmdheight=1
set noerrorbells
set linespace=0
set report=0
set noicon
set shell=bash
set showmode   " show the current mode
set shortmess=atI   " don’t show the intro message when starting Vim
"set ttyscroll=0
set wrapmargin=1
set foldexpr=getline(v:lnum)[0]==\"\\t\"
set scrolloff=3   " start scrolling three lines before the horizontal window border
set backspace=indent,eol,start   " allow backspace in insert mode
set ttyfast   " optimize for fast terminal connections
set binary   " editing binary files
set noeol   " don’t add empty newlines at the end of files
set title   " show the filename in the window titlebar
set autoindent   " copy indent from current line when starting a new line
set smarttab   " use tab accordingly to shiftwidth
set nrformats-=octal   " numbers that start with a zero will be considered octal
set sessionoptions-=options
set viewoptions-=options
set iskeyword+=-
set splitright
set showmatch   " show the matching part of the pair of {},[],()
" }}}

" async timeout {{{
set ttimeout
set ttimeoutlen=100
" }}}

" basic shortcuts (,l ; ,i, <esc>s) {{{
let mapleader = ","
nmap <leader>l :set list!<CR>
set list   " show hidden characters by default
map <Esc>s :w<CR>   " quick save
set pastetoggle=<leader>i   " copy & paste

" }}}

" netrw {{{
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3
" }}}

" tags {{{
set tags=./tags;/
" }}}

" spelling (,se ; ,sp ; ,sd) {{{
set complete+=k
autocmd FileType * exec('set dictionary+=~/.vim/spell/' . &filetype)
set spelllang=en,pl
map <leader>se :setlocal spell spelllang=en<CR>
map <leader>sp :setlocal spell spelllang=pl<CR>
map <leader>sd :setlocal nospell<CR>
" }}}

" folding with the spacebar {{{
nnoremap <space> za
" }}}

" completion {{{
set completeopt=menu,menuone,longest " complete options (disable preview scratch window)
set pumheight=15 " limit popup menu height
" }}}

" airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_highlighting_cache = 1
let g:airline_theme='dark'
" }}}

" history {{{
set history=1000
set undolevels=1000
" }}}

" wrapping (,w) {{{
vmap <leader>w gq
nmap <leader>w gqap
" }}}

" numbers, lenght, horizontal and vertical line {{{
set number relativenumber" show line numbers
set tw=79 " line width
set nowrap " do not wrap automatically on load
set fo-=t " do not wrap automatically when typing
set colorcolumn=80
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline nocursorcolumn
set cursorline nocursorcolumn   " highlight current line but not the column
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" }}}

" autocommands {{{
if has("autocmd")
  autocmd FileType python setlocal ts=4 sts=4 sw=4 textwidth=79 expandtab
  autocmd FileType python set fileformat=unix
  autocmd FileType python set smartindent
  autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python set foldmethod=indent
  autocmd FileType python let python_highlight_all = 1
  autocmd FileType python inoremap <Nul> <C-x><C-o>
  autocmd FileType vim,unix,sshconfig,html,css,ruby,bash,sh,yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType xml setlocal ts=4 sts=4 sw=4 expandtab
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufEnter,BufNew *.note set smartindent foldmethod=indent expandtab tw=0 ts=4 sw=4 spell
endif
" }}}

" simplyfold {{{
let g:SimpylFold_docstring_preview = 1
" }}}

" wildmenu {{{
set wildmenu " turn on wild menu :e <Tab>
set wildmode=longest,list,full " set wildmenu to list choice
set wildignore+=*.gif,*.jpg,*.png,tmp,cache
" }}}

" buffer diffs indication {{{
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
\ | wincmd p | diffthis
endif
"" }}}

" search (,/ ; n ; N) {{{
set hlsearch   " highlight searches
noremap <silent><Leader>/ :nohls<CR> "remove highlight with ,/
set incsearch   " highlight dynamically as pattern is typed
set ignorecase   " Ignore case of searches
set smartcase
set matchtime=5
map N Nzz   " search backward
map n nzz   " search forward
" }}}

" session saving {{{
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,localoptions
" }}}

" mouse is handy {{{
if has('mouse')
  set mouse=a
  set mousehide
endif
" }}}

" tabs (,t ; ,x ; ,n ; ,m) {{{
map <leader>t <esc>:tabnew<CR>:Explore<CR>
map <leader>x <esc>:tabclose<CR>
map <leader>n <esc>:tabprevious<CR>
map <leader>m <esc>:tabnext<CR>
set tabstop=2   " Make tabs as wide as two spaces if it's not known file
" }}}

" highlight trailing whitespace in vim on non empty lines, but not while {{{
" typing in insert mode!
highlight ExtraWhitespace ctermbg=red guibg=brown
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/
" }}}

" block indentantion with < and > in visual mode {{{
vnoremap < <gv
vnoremap > >gv
" }}}

" tabularize mappings (,a= ; ,a> ; ,a:) {{{
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" }}}

" additional information that you can't modify RO files {{{
au BufReadPost * :call CheckReadonly()
function! CheckReadonly()
 if version >= 600
   if &readonly
    setlocal nomodifiable
    endif
 endif
endfunction
" }}}

" edit .vimrc (,v) {{{
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>v :tabedit $MYVIMRC<CR>
" }}}

" restore cursor position to where it was before {{{
"augroup JumpCursorOnEdit
"   au!
"   autocmd BufReadPost *
"            \ if expand("<afile>:p:h") !=? $TEMP |
"            \   if line("'\"") > 1 && line("'\"") <= line("$") |
"            \     let JumpCursorOnEdit_foo = line("'\"") |
"            \     let b:doopenfold = 1 |
"            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
"            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
"            \        let b:doopenfold = 2 |
"            \     endif |
"            \     exe JumpCursorOnEdit_foo |
"            \   endif |
"            \ endif
"   " Need to postpone using "zv" until after reading the modelines.
"   autocmd BufWinEnter *
"            \ if exists("b:doopenfold") |
"            \   exe "normal zv" |
"            \   if(b:doopenfold > 1) |
"            \       exe  "+".1 |
"            \   endif |
"            \   unlet b:doopenfold |
"            \ endif
"augroup END
" }}}

" par formating (,par) {{{
set formatprg=par\ -w60
map <A-q> {v}!par -jw60<CR>
vmap <A-q> !par -jw60<CR>
nnoremap <leader>par :%s/^>$//<CR>
" }}}

" gundo config (,g) {{{
nnoremap <leader>g :GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_preview_height = 10
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
" }}}

" signature killer (,sk) {{{
map <leader>sk <ESC>:/^[ ]*> -- *$/;?^[ >][ >]*$?;.,/^[ ]*$/-1d<CR>
" }}}

" strip trailing whitespace (,ss) {{{
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" }}}

" save a file as root (,W) {{{
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" }}}

" colorscheme and gui {{{
filetype plugin on   " enable plugins
filetype indent on   " enable indentation
filetype on
syntax enable
set t_Co=256   " force 256 colors
set background=dark
colorscheme gruvbox
hi CursorLine term=NONE cterm=bold guibg=Grey40 ctermbg=234
set listchars=tab:▸\ ,trail:◇,extends:»,precedes:«,eol:¬,space:·   "textmate a like invisible symbols
au * BufRead norm \   "urgency on slow load
" }}}

" fix for line redraw {{{
set lazyredraw
nnoremap <silent> j j:redraw<CR>
nnoremap <silent> k k:redraw<CR>
" }}}

" fzf (,F ; ctrl+t ; ctrl+x ; ctrl+v) {{{
map <leader>F :FZF<CR>
set rtp+=~/.fzf
let g:fzf_layout = { 'up': '~40%' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" }}}

" lsp {{{
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
highlight link LspErrorText GruvboxRedSign
highlight clear LspWarningLine
highlight lspReference ctermfg=white guifg=white ctermbg=darkblue guibg=red
let g:lsp_highlight_references_enabled = 1
if executable('pyls')
    " pip install python-language-server[ALL]
    " for other languages I depend on lsp-settings plugin
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
noremap <silent> <leader>] :LspNextDiagnostic <CR>
noremap <silent> <leader>[ :LspPreviousDiagnostic <CR>
" }}}

" completor {{{
let g:completor_complete_options = 'menuone,noselect,preview'
noremap <silent> <leader>d :call completor#do('definition')<CR>
noremap <silent> <leader>c :call completor#do('doc')<CR>
noremap <silent> <leader>f :call completor#do('format')<CR>
noremap <silent> <leader>o :call completor#do('hover')<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" }}}

" osc52 clipboard synchornization (,y) {{{
function! Osc52Yank()
    let buffer=system('base64 -w0', @0)
    let buffer=substitute(buffer, "\n$", "", "")
    let buffer='\e]52;c;'.buffer.'\x07'
    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/pts/0")
endfunction
map <leader>y :Osc52Yank()
augroup Example
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
augroup END
" }}}

" vimwiki {{{
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'}]
autocmd FileType vimwiki setlocal shiftwidth=2 tabstop=2 expandtab
autocmd BufRead,BufNewFile *.wiki setlocal spell
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_global_ext = 0
let g:vimwiki_hl_headers = 1
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
" }}}