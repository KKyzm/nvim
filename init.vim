"
"    _ __ ___  _   _  __   _(_)_ __ ___  _ __ ___
"  | '_ ` _ \| | | | \ \ / / | '_ ` _ \| '__/ __|
" | | | | | | |_| |  \ V /| | | | | | | | | (__
"|_| |_| |_|\__, |___\_/ |_|_| |_| |_|_|  \___|
"           |___/_____|
"
" fzf
" nodejs
" clang
" clangd
" clang-format
" riggrep
" pynvim
" keyring
" browser-cookie3
" pip3 install pynvim --user
" pip3 install keyring browser-cookie3 --user
"
"
" Check if vim-plug is installed.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.local/share/nvim/site/pack/packer/start/packer.nvim'))
	silent !git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
endif

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
set nolist

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set notimeout
set textwidth=80
set mouse=a
let mapleader=" "


call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'kshenoy/vim-signature'
" copy&paste register
Plug 'junegunn/vim-peekaboo'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
"
" Plug 'ianding1/leetcode.vim'

Plug 'RRethy/vim-illuminate'
Plug 'honza/vim-snippets'
Plug 'Sirver/ultisnips'

Plug 'ajmwagar/vim-deus'
Plug 'jacoborus/tender.vim'
Plug 'navarasu/onedark.nvim'
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'sainnhe/gruvbox-material'

Plug 'junegunn/vim-easy-align'

Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'

Plug 'sheerun/vim-polyglot'

Plug 'romgrk/barbar.nvim'

Plug 'preservim/nerdcommenter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mg979/vim-visual-multi'
Plug 'liuchengxu/vista.vim'

Plug 'tpope/vim-repeat'
"
Plug 'glepnir/dashboard-nvim'

Plug 'ryanoasis/vim-devicons'
call plug#end()


" ==============
" === COLORS ===
" ==============

let g:onedark_config = {
			\ 'style': 'cool',
			\ 'ending_tildes': v:true,
			\ 'diagnostics': {
				\ 'darker': v:true,
				\ 'background': v:true,
				\ },
				\ }
" colorscheme snazzy
" colorscheme tender
" colorscheme deus
" colorscheme space-vim-dark
colorscheme onedark
"
" let g:airline_theme = 'tender'
" let g:airline_theme = 'zenburn'
let g:airline_theme='onedark'
"

" ===
" === gruvbox-material
" ===
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'medium'
" colorscheme gruvbox-material
"
" Important!!
if has('termguicolors')
	set termguicolors
endif
set termguicolors
if &term =~# '^screen'
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" let g:gruvbox_material_enable_italic = 0
" let g:gruvbox_material_enable_bold = 1
" only work in GUI clients
" let g:gruvbox_material_cursor = 'green'
" let g:gruvbox_material_transparent_background = 0
" let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
" let g:gruvbox_material_diagnostic_virtual_text = 'colored'
" let g:gruvbox_material_current_word = 'bold'
" let g:gruvbox_material_statusline_style = 'original'


let g:DevIconsEnableFoldersOpenClose = 1
syntax enable


" ===
" === airline
" ===
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#buffer_idx_mode=1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
" let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
" let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'


" ===
" === leetcode
" ===
" let g:leetcode_browser='firefox'
" nnoremap <leader>ll :LeetCodeList<cr>
" nnoremap <leader>lt :LeetCodeTest<cr>
" nnoremap <leader>ls :LeetCodeSubmit<cr>
" nnoremap <leader>li :LeetCodeSignIn<cr>


" ===
" === vista
" ===
"
nnoremap <LEADER>vv :Vista<CR>
nnoremap <LEADER>vc :Vista!<CR>
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
" let g:vista_executive_for = {
"   \ 'cpp': 'vim_lsp',
"   \ 'php': 'vim_lsp',
"   \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" let g:vista_ctags_cmd = {
"       \ 'haskell': 'hasktags -x -o - -c',
"       \ }

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1


" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
ensure_installed = {
	"c",
	"cpp",
	"python",
	"lua",
	"vim",
	"json",
	"html",
	"javascript",
	},

-- Install languages synchronously (only applied to `ensure_installed`)
sync_install = true,

-- List of parsers to ignore installing
-- ignore_install = { "javascript" },

highlight = {
	-- `false` will disable the whole extension
enable = true,

-- list of language that will be disabled
-- disable = { "c", "rust" },

-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
-- Using this option may slow down your editor, and you may see some duplicate highlights.
-- Instead of true it can also be a list of languages
additional_vim_regex_highlighting = false,
},
  indent = {
  enable = true,
  disable = {},
  },
}
EOF

" ===
" === hop.nvim
" ===
nnoremap <LEADER><LEADER> :HopWord<CR>
nnoremap <LEADER>hl :HopLine<CR>
nnoremap <LEADER>hc :HopChar1<CR>
nnoremap <LEADER>hd :HopChar2<CR>


" ===
" === wildfire (select text objects with <CR> & <BS>)
" ===
let g:wildfire_objects = [ "i'", 'i>', 'i"', "i)", "i]", "i}", "ip", "it"]
nmap <leader>ws <Plug>(wildfire-quick-select)


" ===
" === barbar
" ===
nnoremap <silent>    <A-o> :BufferPrevious<CR>
nnoremap <silent>    <A-i> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-O> :BufferMovePrevious<CR>
nnoremap <silent>    <A-I> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-f> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-q> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>
nnoremap <silent> <LEADER>bp :BufferPick<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
"
" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
let bufferline.add_in_buffer_number_order = v:false

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
" let bufferline.exclude_ft = ['javascript']
" let bufferline.exclude_name = ['package.json']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = "both"

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:true

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
			\ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

" hi link BufferCurrentMod Label
" hi link BufferVisibleMod Label


" ===
" === vim-autoformat
" ===
" clang-format, python3-autopep8, js-beautify, black, stylua
let g:autoformat_verbosemode=1
" autocmd BufWrite *.c,*.cc,*.hh,*.py,*.json,*.lua :Autoformat
nnoremap <C-A-f> :Autoformat<CR>
vnoremap <C-A-f> :Autoformat<CR>
let g:python3_host_prog="/usr/bin/python3"

let g:formatters_c = ['clangformat']
let g:formatters_jsonc = ['js-beautify']
let g:formatters_python = ['black']
let g:formatters_lua = ['stylua']


" ===
" === auto-pairs
" ===
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
au filetype cc let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})


" ===
" === hexokinase
" ===
set termguicolors
let g:Hexokinase_highlighters = ['backgroundfull']

"
" ===
" === illuminate
" ===
let g:Illuminate_delay = 500
let g:Illuminate_highlightUnderCursor = 1
let g:Illuminate_ftwhitelist = ['python', 'vim', 'sh', 'c', 'h', 'cc', 'hh', 'cpp', 'hpp']
augroup illuminate_augroup
	autocmd!
	autocmd VimEnter * hi link illuminatedWord MatchParen
	" autocmd VimEnter * hi illuminatedWord ctermbg=#212121 guibg=#212121
augroup END


" ===
" === rainbow
" ===
let g:rainbow_active=1


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"
" set hidden
" set shortmess+=c
" set updatetime=100
"


" ===
" === Nvim-Tree
" ===
" You can automatically close the tab/vim when nvim-tree is the last window in the tab. WARNING: other plugins or automation may interfere with this:
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 0 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
			\ 'git': 1,
			\ 'folders': 1,
			\ 'files': 1,
			\ 'folder_arrows': 1,
			\ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
\ 'default': "",
\ 'symlink': "",
\ 'git': {
\   'unstaged': "✗",
\   'staged': "✓",
\   'unmerged': "",
\   'renamed': "➜",
\   'untracked': "★",
\   'deleted': "",
\   'ignored': "◌"
\   },
\ 'folder': {
\   'arrow_open': "",
\   'arrow_closed': "",
\   'default': "",
\   'open': "",
\   'empty': "",
\   'empty_open': "",
\   'symlink': "",
\   'symlink_open': "",
\   }
\ }

nnoremap <LEADER>nn :NvimTreeToggle<CR>
nnoremap <LEADER>nr :NvimTreeRefresh<CR>
nnoremap <LEADER>nf :NvimTreeFocus<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=


" ===
" === FZF
" ===
"
" let g:fzf_command_prefix = 'fzf'
" float window version
nnoremap <LEADER>sb :Buffers<CR>
nnoremap <LEADER>sf :Files<CR>
nnoremap <LEADER>si :Lines<CR>
nnoremap <LEADER>sL :Rg<CR>
nnoremap <LEADER>st :BTags<CR>
nnoremap <LEADER>sT :Tags<CR>
nnoremap <LEADER>sw :Windows<CR>
nnoremap <LEADER>sm :Marks<CR>
nnoremap <LEADER>sh :History<CR>
nnoremap <LEADER>s: :History:<CR>
nnoremap <LEADER>s/ :History/<CR>
nnoremap <LEADER>sg :GFiles?<CR>
nnoremap <LEADER>sG :Commits<CR>
nnoremap <LEADER>sc :Colors<CR>
nnoremap <LEADER>sd :Files

nnoremap <Leader>ss :<C-u>SessionSave<CR>
nnoremap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <Leader>sn :DashboardNewFile<CR>

let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_shortcut = {
			\ 'last_session'       : 'SPC s l',
			\ 'find_history'       : 'SPC s h',
			\ 'find_file'          : 'SPC s f',
			\ 'new_file'           : 'SPC s n',
			\ 'change_colorscheme' : 'SPC s c',
			\ 'find_word'          : 'SPC s L',
			\ 'book_marks'         : 'SPC s m',
			\ }

" let g:dashboard_preview_pipeline = 'lolcat'
" let g:dashboard_preview_command = 'cat'
" let g:dashboard_preview_file = '~/.config/nvim/neovim.cat'
" let g:dashboard_preview_file_height = 12
" let g:dashboard_preview_file_width = 80
" let g:dashboard_custom_footer = [ 'yaniru' ]
let g:dashboard_custom_header = [
			\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
			\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
			\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
			\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
			\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
			\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
			\ '											Be your own hero.',
			\]
"
"
" ===
" === snippets
" ===

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" ===
" === asyncrun
" ===
"
let g:asyncrun_open = 15
let g:asyncrun_bell = 1
" let g:asyncrun_mode = 4
let g:asyncrun_save = 2
" let g:asyncrun_exit = "<C-w>j"

noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>
noremap <silent><f6> :AsyncTask project-run<cr>
noremap <silent><f7> :AsyncTask project-build<cr>

let g:asynctasks_term_pos = 'right'


" ===
" === nerdcommenter
" ===

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


" ===
" === COC
" ===
let g:coc_global_extensions=['coc-vimlsp', 'coc-marketplace', 'coc-clangd', 'coc-translator']

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=yes
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
inoremap <silent><expr> <C-o> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" inoremap <silent><expr> <CR>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
inoremap <expr> <c-j>
			\ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetNext', [])<cr>" :
			\ pumvisible() ? "\<c-n>" :
			\ "\<c-j>"
inoremap <expr> <c-k>
			\ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetPrev', [])<cr>" :
			\ pumvisible() ? "\<c-p>" :
			\ "\<c-k>"
"
" let g:coc_snippet_next = '<C-j>'
" let g:cpc_snippet_prev = '<C-k>'
" imap <C-l> <Plug>(coc-snippets-expand-jump)
"
" if exists('*complete_info')
"	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <LEADER>d to show documentation in preview window.
nnoremap <silent> <LEADER>d :call <SID>show_documentation()<CR>

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
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
xnoremap <leader>ca  <Plug>(coc-codeaction-selected)
nnoremap <leader>ca  <Plug>(coc-codeaction-selected)
"
" " Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Map function and class text objects
" " NOTE: Requires ' textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
"
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
"
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>od  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>oe  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>oc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>oo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>os  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <C-j>  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <C-k>  :<C-u>CocPrev<CR>
"
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" coc-translator
" NOTE: do NOT use `nore` mappings
" popup
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)


" ===
" === tabout
" ===
lua <<EOF
require'nvim-tree'.setup()
EOF

lua require('plugins')
"------------------------------------------------------------------
"------------------------------------------------------------------

syntax on
set number
set relativenumber
set autoindent
set shiftwidth=4
set tabstop=4
set nocompatible
set wrap
set showcmd
set wildmenu
exec "nohlsearch"
set hlsearch
set incsearch
set ignorecase
set smartcase

" nnoremap ;y : !/mnt/c/Windows/System32/clip.exe<cr>u
tnoremap <LEADER><ESC> <C-\><C-n>

vnoremap Y "+y
" relate to System Paste Pad
noremap <LEADER>y "*y
noremap <LEADER>p "*p
" paste without considering Cut
noremap <LEADER>P "0p

" switch windows
nnoremap sw <C-w><C-w>

inoremap " ""<ESC>i
inoremap ' ''<ESC>i
noremap <LEADER><CR> :nohlsearch<CR>
noremap K 5<up>
noremap J 5<down>
inoremap <C-b> <BS>
inoremap <C-d> <Delete>
inoremap <C-l> <Esc>la
nnoremap R :source ~/.config/nvim/init.vim<CR>:nohlsearch<CR>
nnoremap sc :e ~/.config/nvim/init.vim<CR>
nnoremap sa :e ~/.config/nvim/lua/plugins.lua<CR>
nnoremap sfi :r !figlet
nnoremap S :w<CR>
nnoremap Q :q!<CR>
nnoremap sq :bd<CR>
map s <nop>
map ss <nop>
nnoremap <LEADER><right> :set splitright<CR>:vsp<CR>
nnoremap <LEADER><left> :set nosplitright<CR>:vsp<CR>
nnoremap <LEADER><down> :set splitright<CR>:sp<CR>
nnoremap <LEADER><up> :set nosplitright<CR>:sp<CR>
nnoremap ,f <ESC>/<++><CR>:nohlsearch<CR>c4l
nnoremap ,m <Esc>a<++><Esc>2h
nnoremap s; mzA;<Esc>`z:delm z<CR>

nnoremap D ^d$

" When set spell, <C-c> to convert word under cursor into similar word
map <LEADER>sp :set spell!<CR>
noremap <C-c> ea<C-x>s
inoremap <C-c> <Esc>ea<C-x>s

map <A-l> :vertical res +1<CR>
map <A-h> :vertical res -1<CR>
map <A-j> :res -1<CR>
map <A-k> :res +1<CR>

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set cursorline
set nocursorcolumn
set scrolloff=15

" to reload rainbow plug after source vimrc
" call rainbow_main#load()

silent! cal repeat#set("\<Plug>MyWonderfulMap", v:count)


autocmd FileType c,h set shiftwidth=2
" hi CursorLine ctermfg=242 ctermbg=59 guibg=#4b5263
hi CursorLine ctermfg=242 ctermbg=59 guibg=#384050
