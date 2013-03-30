" pathogen {{{
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" }}}

" basic configuration {{{
set encoding=utf-8
imap <F6>  # Last change: <C-R>=strftime("%d/%m/%Y %H:%M:%S")<CR>
nmap <F9> :set paste!<BAR>:set paste?<CR>
map <F10> <Esc>:setlocal spell spelllang=en<CR>
map <F11> <Esc>:setlocal spell spelllang=pl<CR>
map <F12> <Esc>:setlocal nospell<CR>
let mapleader = ","
nmap <leader>l :set list!<CR>
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn " Highlight current line and column
map <Esc>s :w<CR>
set pastetoggle=<F7> " Better copy & paste
set bs=2 " Fix backspace on some environments in INSERT mode
set modeline " Allow vim options to be embedded in files;
set modelines=5 " they must be within the first or last 5 lines.
set guioptions=aegimrLt
set nocompatible   " Make Vim more useful
set term=builtin_ansi " arrow key navigation
set showcmd
set foldmethod=marker
set noexpandtab
set ignorecase
set autowrite
set backup
set backupdir=~/.vim/backup
set noswapfile " i don't want to recovery
set directory=~/.vim/temp
if exists("&undodir")
	set undodir=~/.vim/undo
endif
set nohidden
set autochdir
set mousehide
set noerrorbells
set linespace=0
set report=0
set noicon
set shell=bash
set showmode   " Show the current mode
set shortmess=atI   " Don’t show the intro message when starting Vim
set ttyscroll=0
set wrapmargin=1
set foldexpr=getline(v:lnum)[0]==\"\\t\"
set scrolloff=3   " Start scrolling three lines before the horizontal window border
set esckeys   " Allow cursor keys in insert mode
set backspace=indent,eol,start   " Allow backspace in insert mode
set ttyfast   " Optimize for fast terminal connections
set binary
set noeol   " Don’t add empty newlines at the end of files
set title   " Show the filename in the window titlebar
" }}}

" better tab {{{
set completeopt=menu,menuone,longest " Complete options (disable preview scratch window)
set pumheight=15 " Limit popup menu height
let g:SuperTabDefaultCompletionType="context" " SuperTab option for context aware completion
let g:clang_complete_auto=0 " Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_copen=1 " Show clang errors in the quickfix window
" let g:snippets_dir="$HOME/.vim/snipmate-snippets/snippets/"
" let g:snips_trigger_key='<c-space>' " for testing purposes
" }}}

" powerline config {{{
set laststatus=2 " always show status line
let g:Powerline_colorscheme="solarized16"
let g:Powerline_symbols="fancy"
" }}}

" history settings {{{
set history=1000
set undolevels=1000
" }}}

" wrapping long rows {{{
vmap Q gq
nmap Q gqap
" }}}

" show line numbers and line lenght {{{
set number " show line numbers
set tw=79 " line width
set nowrap " do not wrap automatically on load
set fo-=t " do not wrap automatically when typing
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" }}}

" pymode {{{
" Disable pylint checking every save
let g:pymode_lint_write = 0
" Load show documentation plugin
let g:pymode_doc = 1
" Key for show python documentation
let g:pymode_doc_key = 'K'
" Load run code plugin
let g:pymode_run = 1
" Key for run python code
let g:pymode_run_key = '<leader>r'
" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1
" Load pylint code plugin
let g:pymode_lint = 0
" Load rope plugin
let g:pymode_rope = 0
" Enable python folding
let g:pymode_folding = 1
" Enable python objects and motion
let g:pymode_motion = 1
" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1
" }}}

" autocommands for different type of files {{{
if has("autocmd")
  autocmd FileType python setlocal ts=4 sw=4 sta et sts=4 ai
  autocmd FileType python set autoindent
  autocmd FileType python set smartindent
  autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd FileType python let python_highlight_all = 1
	autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd FileType python inoremap <Nul> <C-x><C-o>
  autocmd FileType html,css,ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufEnter,BufNew *.note set smartindent foldmethod=indent expandtab tw=0 ts=4 sw=4 spell
endif
" }}}

" wildmenu settings {{{
set wildmenu " turn on wild menu :e <Tab>
set wildmode=longest,list,full " set wildmenu to list choice
set wildignore+=*.gif,*.jpg,*.png,tmp,,cache
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

" search settings {{{
set hlsearch   " Highlight searches
noremap <silent><Leader>/ :nohls<CR> "remove highlight with ,/
set incsearch  " Highlight dynamically as pattern is typed
set showmatch
set ignorecase   " Ignore case of searches
set smartcase
set matchtime=5
map N Nzz
map n nzz
" }}}

" mouse is handy {{{
if has('mouse')
  set mouse=a
endif
" }}}

" tab settings and navigation {{{
map <Leader>t <esc>:tabnew<CR>
map <Leader>x <esc>:tabclose<CR>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
set tabstop=2   " Make tabs as wide as two spaces if it's not known file
" }}}

" Highlight trailing whitespace in vim on non empty lines, but not while {{{
" typing in insert mode!
highlight ExtraWhitespace ctermbg=red guibg=brown
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/
" }}}

" moving block of code {{{
vnoremap < <gv
vnoremap > >gv
" }}}

" tabularize mappings {{{
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

".vimrc nices (,v) {{{
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>v :tabedit $MYVIMRC<CR>
" }}}

" restore cursor position to where it was before {{{
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END
" }}}

" load dictionary files for complete suggestion (CTRL-n) {{{
set complete+=k
autocmd FileType * exec('set dictionary+=~/.vim/spell/' . &filetype)
set spelllang=en,pl
" }}}

" par formating {{{
set formatprg=par\ -w60
map <A-q> {v}!par -jw60<CR>
vmap <A-q> !par -jw60<CR>
nnoremap <leader>par :%s/^>$//<CR>
" }}}

" nerd_tree config (F3) {{{
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>
" }}}

" gundo config (F2) {{{
nnoremap <F2> :GundoToggle<CR>
let g:gundo_width = 30
let g:gundo_preview_height = 10
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
" }}}

" pep8 checker (,8) {{{
let g:pep8_map='<leader>8'
" }}}

" signature killer (F8) {{{
map <F8> <ESC>:/^[ ]*> -- *$/;?^[ >][ >]*$?;.,/^[ ]*$/-1d<CR>
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

" syntastic configuration {{{
let g:syntastic_check_on_open=1   "syntax checks when buffers are first loaded
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=1   "cursor jump to the first detected error
" }}}

" colorscheme and gui {{{
filetype plugin on
filetype indent on
filetype on
set ofu=syntaxcomplete#Complete " enable completion for any code
let g:solarized_contrast="high"   "default value is normal
let g:solarized_visibility="high"   "default value is normal
let g:solarized_diffmode="high"   "default value is normal
let g:solarized_termtrans = 1
syntax enable
set background=dark
colorscheme solarized

if has('gui_running')
    let g:solarized_termcolors=256
    set t_Co=256
    highlight SpellBad term=underline gui=undercurl guisp=Orange
else
    let g:solarized_termcolors=256
    set t_Co=256
    "let g:CSApprox_loaded=1
endif

call togglebg#map(",sol")   "toggle dark/light solarized
set listchars=tab:▸\ ,trail:◇,extends:»,precedes:«,eol:¬   "textmate a like invisible symbols
au * BufRead norm \   "urgency on slow load
" }}}