let mapleader = " "

"Vim-plug
call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
Plug 'jreybert/vimagit'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'puremourning/vimspector'
Plug 'vim-scripts/AutoComplPop'
Plug 'vim-scripts/delimitMate.vim'
Plug 'turbio/bracey.vim'

call plug#end()

" Airline configuration
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	let g:airline_powerline_fonts = 1
	let g:airline_theme = 'gruvbox'
	set showtabline=2
	set noshowmode
	
" Theme configuration
	let g:gruvbox_italic=1
	set bg=dark
	colorscheme gruvbox
" Basic setup
	syntax on
	filetype plugin indent on
	set number
	set relativenumber
	set clipboard=unnamedplus
	set nowrap						" don't wrap lines
	set tabstop=4
	set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
	set expandtab                   " expand tabs by default (overloadable per file type later)
	set shiftwidth=4                " number of spaces to use for autoindenting
	set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
	set backspace=indent,eol,start  " allow backspacing over everything in insert mode
	set autoindent                  " always set autoindenting on
	set copyindent                  " copy the previous indentation on autoindenting
	set showmatch
	set ignorecase                  " ignore case when searching
	set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
	set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
	set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
	set encoding=utf-8
	set autoindent
	set hlsearch                    " highlight search terms
	set incsearch                   " show search matches as you type
	set autoread                    " Auto reload file 
" Enbale autocompletion
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo setup
	map <leader>f : Goyo \| set linebreak<CR>

" Splits open at the bottom and right
	set splitbelow splitright

" Shortcuting split navigation
	map<C-h> <c-w>h
	map<C-j> <c-w>j
	map<C-k> <c-w>k
	map<C-l> <c-w>l

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" auto completion setting
set completeopt=menuone,longest
set shortmess+=c

" auto completion html
let g:closing_html_style=1
au FileType html,xml,xsl source ~/.vim/scripts/closetag.vim
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Changing tab airline
nmap <leader>] :bn<CR>
nmap <leader>[ :bp<CR>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Compiler and run cpp file
function CompilerCpp(...)
    if a:0==1
        execute '!g++ % -o %< && ./%< <' . a:1
    elseif a:0==2
        execute '!g++ % -o %< && ./%< <' . a:1 . '>' . a:2
    else
        execute '!g++ % -o %< && ./%<'
    endif
endfunction

function CompilerCpr(...)
    if a:0==1
        execute '!g++ *.cpp -o myProg && ./myProg <' . a:1
    elseif a:0==2
        execute '!g++ *.cpp -o myProg && ./myProg <' . a:1 . '>' . a:2
    else
        execute '!g++ *.cpp -o myProg && ./myProg'
    endif
endfunction


:command -nargs=* Cpp :wa | call CompilerCpp(<f-args>)
:command -nargs=* Cpr :wa | call CompilerCpr(<f-args>)

" Copy ans paste to system clipboard
vnoremap <C-c> "+y :let @+=@*<CR>
map <C-p> "+P

" Select all file
map <C-a> ggVG

"Disable <> auto pair
let delimitMate_matchpairs = "(:),[:],{:},/*:*/"
let delimitMate_expand_cr= 2

" LiveDown server setup
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1501

" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "google-chrome"

"Launch/Kill the livedown server
nmap gm :LivedownToggle<CR>

"Debugger setup
let g:vimspector_enable_mappings = 'HUMAN'
