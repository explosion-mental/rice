" __   _(_) _ __ ___
" \ \ / / || '_ ` _ \
"  \ V /| || | | | | |
"   \_/ |_||_| |_| |_|

" Plugins -------------------- {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'joshdick/onedark.vim'	" colorscheme
Plug 'junegunn/goyo.vim'	" distraction free mode
Plug 'tpope/vim-dispatch'	" async commands (parallel)
"Plug 'chrisbra/Colorizer'	" colors
Plug 'norcalli/nvim-colorizer.lua' "colors
Plug 'alvan/vim-closetag'	" html
Plug 'folke/twilight.nvim'	" dim inactive
"Plug 'karb94/neoscroll.nvim'	" smooth scrolling
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'othree/html5.vim'		" html only
"Plug 'vimwiki/vimwiki'
"Plug 'skammer/vim-css-color'
"Plug 'rrethy/hexokinase', { 'do': 'make hexokinase' }
"Plug 'junegunn/fzf'
"Plug 'tomasiser/vim-code-dark'
Plug 'mhartington/oceanic-next'
Plug 'nekonako/xresources-nvim'    " pywal scheme
"Plug 'marko-cerovac/material.nvim' " color scheme
Plug 'lukas-reineke/indent-blankline.nvim' " indent thingy
Plug 'matsuuu/pinkmare'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()
" }}}

" General settings -------------------- {{{
set title
set undofile	" keep undo along saves
"set undodir=$XDG_CONFIG_HOME/nvim/undo  "directory of undos
if has('nvim-0.5')
	" New format in https://github.com/neovim/neovim/pull/13973 (f42e932,
	" 2021-04-13).
	set undodir=$XDG_CONFIG_HOME/nvim/undo2  "directory of undos
else
	set undodir=$XDG_CONFIG_HOME/nvim/undo  "directory of undos
endif
set go=a
set mouse=a			" enable mouse
set nohlsearch
set noshowmode
set noruler
set spelllang=en
set laststatus=0
"set noshowcmd			" I like seeing what im typing
set smartcase
set number relativenumber	" relative numbers
set termguicolors
set clipboard+=unnamedplus	" clipboard(-selection clipboard)
set wildmode=longest,list,full
set formatoptions-=cro  " Turns off comentig on a new line
"set guicursor=a:blinkon200	" blinking cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait10-blinkoff700-blinkon700-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
" }}}

" Lua ---------- {{{
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  --ensure_installed = "maintained",
  ensure_installed = { "c" },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  indent = {
    enable = false
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "bash", "md", "markdown" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

--let g:indent_blankline_space_char_blankline_highlight_list = ['Error', 'Function']
--let g:indent_blankline_max_indent_increase = 2
--let g:indent_blankline_show_end_of_line = v:true
--let g:indent_blankline_indent_level = 4
--let g:indent_blankline_space_char_highlight_list
--let g:indent_blankline_space_char_blankline_highlight_list
--let g:indent_blankline_char = '|'
--vim.g.tokyonight_style = "night"
--vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_italic_functions = true

vim.opt.list = true
--vim.opt.tabstop = 2
--vim.opt.listchars:append({ eol = "$" })
vim.opt.listchars = {
    tab = "  ",
    trail = "_",
    nbsp = " ",
}
require("indent_blankline").setup {
	char_list = { '', '|', '║', '╬', '┃', '█'},
	space_char_blankline = " ",
	show_end_of_line = true,
	show_current_context = true,
	show_current_context_start = true,
	show_current_context_start_on_current_line = false,
	show_first_indent_level = false,
	max_indent_increase = 2,
	--indent_level = 4,
	strict_tabs = true,
	blankline_indent = false,
	filetype_exclude = {'checkhealth', 'text', 'help', 'markdown', 'dashboard', 'vim'},
}
EOF
"}}}

" Colors -------------------- {{{
syntax on		" syntax highlithing
colorscheme onedark
"colorscheme xresources
"set bg=dark
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" Theme
"colorscheme tokyonight

" Make comments stand out
hi Comment gui=bold guifg=#0f7acf
"hi Comment guifg=#ABCDEF
"hi Comment guibg=#929eaa
"colorscheme wal
"hi Normal guibg=#ffffff guifg=#000000 ctermbg=black ctermfg=white
" }}}

" Functions/Commands Definitions -------------------- {{{

" Toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleStatusBar()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

" st
"if &term =~ '256color'
"    " disable Background Color Erase (BCE) so that color schemes
"    " render properly when inside 256-color tmux and GNU screen.
"    " see also https://sunaku.github.io/vim-256color-bce.html
"    set t_ut=
"endif

" Turns off highlighting on the bits of code that are changed, so the line
" that is changed is highlighted but the actual text that has changed stands
" out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Goyo, (ensure to :q)
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

" Toggle transparency
let t:is_transparent = 1
function! ToggleTransparency()
  if t:is_transparent == 0
    hi Normal guibg=#111111 ctermbg=black
    set background=dark
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 0
  endif
  " keep the comments bold and blue
  hi Comment gui=bold guifg=#0f7acf
endfunction

" Jump to the last position
"function! LastPosition()
"	if line("'\'") > 0 && line("'\'") <= line("$") && &ft !~# 'commit'
"		exe "normal! g'\""
"	endif
"endfunction

" }}}

" autocmd -------------------- {{{

" Saves on goyo
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" Jump to the last position when reopening a file
"autocmd BufReadPost * cal LastPosition()
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent! loadview

" center screen
autocmd InsertEnter + norm zz

" turns off comentig on a new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" automatically deletes them on file save.
"autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e	" Trailing whitespace
"autocmd BufWritePre * %s/\n\+\%$//e	" Newlines
"autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" dwmblocks
autocmd BufWritePost ~/.config/dwmblocks/config.h silent !sudo make install -C ~/.config/dwmblocks/ && { killall -q dwmblocks; setsid -f dwmblocks }

" syntax highlighting on all files inside customs directory
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile ~/.local/bin/* set filetype=sh

" extensions with custom filetype
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" on certain files with extension make the background transparent
autocmd BufRead,BufNewFile *.py,*.sql,*.html cal ToggleTransparency()

" mkview and save
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

" }}}

" Mappings
let mapleader = ","
"vnoremap <leader>u :w ! dmenurl
"nnoremap ,e <c-v>GI0<Esc>gvg<C-A>
" nnoremap <leader>o :setl spelllang=es<CR>
" nnoremap J mzJ`z
" inoremap jk <escape>

" Toggle background transparency
nnoremap <silent> <leader>t : call ToggleTransparency()<CR>
" Toggle the status bar
nnoremap <silent> <leader>h : call ToggleStatusBar()<CR>
" Dim
nnoremap <silent> <leader>d : Twilight<CR>
" Colorizer
nnoremap <leader>v :ColorizerToggle<CR>

" Spelling
map <leader>oo :setlocal spell<CR>
map <leader>o :setlocal nospell<CR>

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Goyo (Less stuff on the screen)
map <silent> <leader>f :Goyo \| set linebreak<CR>

" Bulk rename
	nnoremap <leader>e :g/.*\./norm dt.<cr><c-v>ggI0<Esc>gvg<C-A><Esc>
	" gvIEjercicio<Esc>
	"nnoremap <leader>x <c-v>Gt.d<c-v>GI0<Esc>gvg<C-A><c-v>GIEjercicio<Esc>

" Movement bindings
	nnoremap <Up> {zz
	nnoremap <Down> }zz
"	nnoremap J <c-d>zz
"	nnoremap K <c-u>zz
	nnoremap n nzz
	nnoremap } }zz
"	nnoremap <silent> j gj
"	nnoremap <silent> k gk
"	inoremap <Up> <Esc>gka
"	inoremap <Down> <Esc>gja

" Comfy things
	"noremap c "_c
	nnoremap <leader>w :w<CR>
	" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>
	" nnoremap W :wq<cr>
	nnoremap <leader>W :wq<cr>
	nnoremap \ :wq<cr>
	"nnoremap Q :q!<CR>
	nnoremap <leader>q :q!<CR>
	nnoremap cw ciw
	"nnoremap yy y$
	vnoremap <silent> j gj
	vnoremap <silent> k gk
	" colon and semicolon change(NOT A to B, but just switching)
	nnoremap ; :
	" nnoremap : ;

" splits
	map <Tab> <C-W>w
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	" nnoremap <leader>s :vsplit<Space>
	nnoremap <silent> <C-Left> :vertical resize +3<CR>
	nnoremap <silent> <C-Right> :vertical resize -3<CR>
	nnoremap <leader>a :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>
	" nnoremap <silent> <C-Up> :resize +3<CR>
	" nnoremap <silent> <C-Down> :resize -3<CR>
	" nnoremap <leader>tt :vnew term://zsh<CR>
	" nnoremap <leader>tf :vnew term://vifmrun<CR>

" Saves files as sudo (use sudoedit!)
	nnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Compile document (dependency: `compiler` script)
map <leader>C :w \| :silent Start!compiler % && notify-send "Done👍"<CR>
map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding pdf/.html or preview
	"map <silent> <leader>p :silent !opout <c-r>%<CR><CR>
	"map <silent> <leader>p :silent !zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR>

" Leader comfy things
nnoremap <leader>' ci'

"does this bothers?
"inoremap ( ()<Esc>i
"inoremap { {}<Esc>i
"inoremap {<CR> {<CR>}<Esc>O
"inoremap [ []<Esc>i
"inoremap < <><Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i

"be able to quit on insert mode
" inoremap <C-w> <Esc>:wq<cr>

" Latex -------------------- {{{
autocmd FileType tex inoremap ;f \textbf{}<()><Esc>T{i
autocmd FileType tex inoremap ;t \textit{}<()><Esc>T{i
autocmd FileType tex inoremap <Tab><Tab> <Esc>/<()><CR><Esc>cf>
autocmd FileType tex inoremap ;u <Esc>a\begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><()><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;s \subsubsection{}<Enter><()><Esc>kA<Left>
autocmd FileType tex inoremap ;S \subsection{}<Enter><()><Esc>kA<Left>
autocmd FileType tex inoremap ;i <Esc>o\item<Space>
autocmd FileType tex inoremap ;I <Esc>O\item<Space>
autocmd FileType tex inoremap ;o <Esc>o
autocmd FileType tex inoremap ;c <Esc>:w \| :silent Start!compiler %<CR>a
autocmd FileType tex inoremap <c-k> <Esc>ea
autocmd FileType tex inoremap <c-j> <Esc>bi
autocmd FileType tex inoremap ;h <Esc>0f<space>a
autocmd FileType tex inoremap ;j <Esc>u
"autocmd FileType tex start
"autocmd FileType BufRead,BufNewFile tex start
"autocmd FileType tex inoremap { {<Esc>A}

" Runs a script that cleans out tex build files whenever vim is closed out of
" a .tex file
autocmd VimLeave *.tex Start!texclear %

" }}}

" vim: filetype=vim:foldmethod=marker:foldlevel=0
