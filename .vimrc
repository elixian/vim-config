"execute pathogen#infect()
syntax on
filetype plugin indent on


set nocompatible


filetype off

set rtp+=~/.local/share/nvim/site/autoload/plug.vim
call plug#begin()

"Plug 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" ----- Vim as a programmer's text editor -----------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" ----- Working with Git ----------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plug 'Raimondi/delimitMate'

" ----- Syntax plugins ------------------------------------------------
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
"Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plug 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
Plug 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
Plug 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mattn/emmet-vim'

call plug#end()

filetype plugin indent on 

"--- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
"colorscheme solarized


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
"let g:airline_theme='solarized'

"" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"
"" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
