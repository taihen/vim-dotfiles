" pathogen {{{
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" }}}

" colorscheme and gui {{{
filetype plugin on
filetype indent on
filetype on

let g:solarized_termcolors=256   "default value is 16
let g:solarized_contrast="high"   "default value is normal
let g:solarized_visibility="high"   "default value is normal
let g:solarized_diffmode="high"   "default value is normal
syntax enable

if has('gui_running')
    set background=dark
    set t_Co=256
    let g:solarized_termcolors=256
    highlight SpellBad term=underline gui=undercurl guisp=Orange
else
    set background=dark
    set t_Co=16
    let g:solarized_termcolors=16
    let g:CSApprox_loaded=1
endif

colorscheme solarized
call togglebg#map(",sol")   "toggle dark/light solarized

set guifont=Inconsolata:h14
set listchars=tab:▸\ ,trail:◇,extends:»,precedes:«,eol:¬   "textmate a like invisible symbols

au * BufRead norm \   "urgency on slow load
" }}}

" basic configuration {{{
imap <F6>  # Last change: <C-R>=strftime("%d/%m/%Y %H:%M:%S")<CR>
nmap <F9> :set paste!<BAR>:set paste?<CR>
map <F10> <Esc>:setlocal spell spelllang=en_us<CR>
map <F11> <Esc>:setlocal nospell<CR>
let mapleader = ","
nmap <leader>l :set list!<CR>
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set modeline   " Allow vim options to be embedded in files;
set modelines=5   " they must be within the first or last 5 lines.
set cursorline cursorcolumn   " Highlight current line and column
set guioptions=aegimrLt
set history=1000
set number   " Enable line numbers
set nocompatible   " Make Vim more useful
set term=builtin_ansi " arrow key navigation
set showcmd
set noswapfile " i don't want to recovery
set foldmethod=marker
set noexpandtab
set ignorecase
set autowrite
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/temp
if exists("&undodir")
	set undodir=~/.vim/undo
endif
set nohidden
set cursorline
set autochdir
set mousehide
set noerrorbells
set linespace=0
set report=0
set noicon
set ruler   " Show the cursor position
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
set tabstop=2   " Make tabs as wide as two spaces if it's not known file
set title   " Show the filename in the window titlebar
let g:SuperTabDefaultCompletionType = "context"  " SuperTab Completion Type
set completeopt=menuone,longest,preview   "enable the menu and pydoc preview to get the most useful information out of the code completion
" }}}

" autocommands for different type of files {{{
if has("autocmd")
	autocmd FileType html,css,ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType python setlocal ai ts=4 sts=4 et sw=4
	autocmd FileType python set autoindent
	autocmd FileType python set smartindent
	autocmd FileType python set textwidth=79 " PEP-8 Friendly
	autocmd BufNewFile,BufRead *.rss setfiletype xml
	autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd BufEnter,BufNew *.note set smartindent foldmethod=indent expandtab tw=0 ts=4 sw=4 spell
	set ofu=syntaxcomplete#Complete
endif
" }}}

" wildmenu settings {{{
" turn on wild menu :e <Tab>
set wildmenu
" set wildmenu to list choice
set wildmode=longest,list,full
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

" browser alike tab navigation {{{
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-x> :tabclose<CR>
" }}}

" tabularize mappings {{{
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /><CR>
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
" }}}

" par formating {{{
:set formatprg=par\ -w60
:map <A-q> {v}!par -jw60<CR>
:vmap <A-q> !par -jw60<CR>
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

" statusline configuration and changes colors based on mode {{{
set laststatus=2            " Always show statusline, even if only 1 window.

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=2 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           	" file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] 			"file format
set statusline+=%y      			"filetype
set statusline+=%h      			"help file flag
set statusline+=%m      			"modified flag
set statusline+=%r      			"read only flag
set statusline+=%{fugitive#statusline()} 	" git info
set statusline+=\ %=                        	" align left
set statusline+=Line:%l/%L[%p%%]            	" line X of Y [percent of file]
set statusline+=\ Col:%c                    	" current column
set statusline+=\ Buf:%n                    	" Buffer number
set statusline+=\ [%b][0x%B]\               	" ASCII and byte code under cursor
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