set nocompatible
set hlsearch
set ignorecase
set smartcase
set noerrorbells
set belloff=esc
set tabstop=4             " Tab size of 4 spaces
set softtabstop=4         " On insert use 4 spaces for tab
set shiftwidth=4

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on
set mouse=a
" Gotta be first
set nocompatible

""filetype off

""set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"P"lugin 'gmarik/Vundle.vim'

"call vundle#end()

"filetype plugin indent on

" --- General settings ---
"set backspace=indent,eol,start
"set ruler	
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
" Plugins here !!!!
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelisense
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/a.vim'
Plug 'jez/vim-superman'
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'
Plug 'navarasu/onedark.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'jiangmiao/auto-pairs'
"Plug 'aben20807/vim-runner'
Plug 'vim-test/vim-test'
Plug 'udalov/kotlin-vim'
Plug 'dense-analysis/ale'
"Plug 'rust-lang/rust.vim'
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }
Plug 'OmniSharp/omnisharp-vim'
call plug#end()
"set background=dark

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
let g:nerdtree_tabs_open_on_console_startup = 0

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
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
"autocmd BufEnter * nested
colorscheme codedark
let g:airline_theme = 'codedark'
let g:runner_use_default_mapping = 1

" Save file first before compile and run by default.
let g:runner_is_save_first = 1

" Print a timestamp on the top of output by default.
let g:runner_print_timestamp = 1

" Print time usage of do all actions by default.
let g:runner_print_time_usage = 1

" Show the comment information by default.
let g:runner_show_info = 1

" Not auto remove tmp file by default.
let g:runner_auto_remove_tmp = 0

" Use <F5> to compile and run code by default.
" Feel free to change mapping you like.
let g:runner_run_key = "<F5>"

" Set tmp dir for output.
let g:runner_tmp_dir = "/tmp/vim-runner/"

" Section: work with other plugins
" w0rp/ale
let g:runner_is_with_ale = 0
" iamcco/markdown-preview.vim
let g:runner_is_with_md = 0

" Section: executable settings
let g:runner_c_executable = "gcc"
let g:runner_cpp_executable = "g++"
let g:runner_rust_executable = "cargo"
let g:runner_python_executable = "python3"

" Section: compile options settings
let g:runner_c_compile_options = "-std=c11 -Wall"
let g:runner_cpp_compile_options = "-std=c++11 -Wall"
let g:runner_rust_compile_options = ""

" Section: run options settings
let g:runner_c_run_options = ""
let g:runner_cpp_run_options = ""
let g:runner_rust_run_backtrace = 1
let g:runner_rust_run_options = ""
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :                                                                                                                    
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'
