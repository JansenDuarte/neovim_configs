-- Global Settings
vim.g.nofsync = true

-- Theme & transparency
vim.cmd.colorscheme("zaibatsu")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- Basic settings
vim.opt.number = true								--line numbers
vim.opt.relativenumber = false						--relative line numbers
vim.opt.cursorline = true							--highlight current line
vim.opt.wrap = false								--don't wrap lines
vim.opt.scrolloff = 20								--keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8							--keep 8 lines left/right of cursor

-- Indentation
vim.opt.tabstop = 4									--tab width this is a test
vim.opt.shiftwidth = 4								--ident width
vim.opt.softtabstop = 4								--soft tab stop
vim.opt.expandtab = false							--turn tabs to spaces
vim.opt.smartindent = true							--smart auto-indenting
vim.opt.autoindent = true							--copy indent from current line

-- Search settings
vim.opt.ignorecase = true							--case insensitive search
vim.opt.smartcase = true							--case sensitive if upercase in search
vim.opt.hlsearch = false							--don't highlight search results
vim.opt.incsearch = true							--show matches as you type

-- Visual settings
vim.opt.termguicolors = true						--24-bit colors
vim.opt.signcolumn = "yes"							--always show sign column
vim.opt.colorcolumn = "80"							--don't show color column
vim.opt.showmatch = true							--highlight matching brackets
vim.opt.matchtime = 5								--how long to show matching bracket
vim.opt.cmdheight = 1								--cmd height
vim.opt.completeopt = "menuone,noinsert,noselect"	--completion options
vim.opt.showmode = false							--show mode in cmd line
vim.opt.pumheight = 10								--popup menu height
vim.opt.pumblend = 30								--popup menu transparency
vim.opt.winblend = 0								--floating window transparency
vim.opt.conceallevel = 0							--don't hide markup
vim.opt.concealcursor = ""							--hide cursor when in mode <n><i><v><c>
vim.opt.lazyredraw = true							--don't redraw during macros
vim.opt.synmaxcol = 300								--sintax highlighting limit

-- File handling
vim.opt.backup = false								--don't create backup files
vim.opt.writebackup = false							--don't create backup before writing
vim.opt.swapfile = false							--don't create swap files
vim.opt.undofile = true								--persistent undo
vim.opt.undodir = vim.fn.expand("~/.nvim/undodir")	--undo directory
vim.opt.updatetime = 100								--faster completion
vim.opt.timeoutlen = 500							--key timeout duration
vim.opt.ttimeoutlen = 0								--key code timeout
vim.opt.autoread = true								--auto reload files changed outside vim
vim.opt.autowrite = false							--don't auto save

-- Behaviour settings
vim.opt.hidden = true                   --allow hidden buffers
vim.opt.errorbells = false              --no error bells
vim.opt.backspace = "indent,eol,start"  --better backspace behaviour
vim.opt.autochdir = false               --don't auto change directory
vim.opt.iskeyword:append("-")           --treat dash as part of word
vim.opt.path:append("**")               --include subdirectories in search
vim.opt.selection = "exclusive"         --selection behaviour
vim.opt.mouse = "a"                     --enable mouse support
vim.opt.clipboard:append("unnamedplus") --use system clipboard
vim.opt.modifiable = true               --allow buffer modifications
vim.opt.encoding = "UTF-8"              --set encoding

-- Cursor settings
vim.opt.guicursor =
"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon150-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Command line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
