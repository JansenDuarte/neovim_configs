
-- Global Settings
vim.g.nofsync = true

-- Language
--vim.api.nvim_exec('language en_US', true)

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
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")	--undo directory
vim.opt.updatetime = 300							--faster completion
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



-- Shortcuts & Keymaps

-- Key mappings
vim.g.mapleader = " "      --set leader key to space
vim.g.maplocalleader = " " --set local leader key (NEW)

-- Better ESC handling
vim.keymap.set("i", "<C-b>", "<ESC>", { desc = "go back to normal", silent = true} )
vim.keymap.set("v", "<C-b>", "<ESC>", { desc = "go back to normal", silent = true} )

-- Delete without yanking
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "D", '"_D')
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "d", '"_d')

-- Y to EOL
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previours search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Splitting & resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window verticaly" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontaly" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- Beter indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })


-- Quick comment
local function quick_comment()
	local ft = vim.bo.filetype
	local commchar = {
		lua = "--",
		php = "\\/\\/",
		python = "#"
	}
	local char = commchar[ft] or "\\/\\/"

	vim.cmd(":s/^\\(\\s*\\)/\\1" .. char .. " ")
end

vim.keymap.set("n", "<C-;>", quick_comment)
vim.keymap.set("v", "<C-;>", quick_comment)

-- Quick uncomment
local function quick_uncomment()
	local ft = vim.bo.filetype
	local commchar = {
		lua = "--",
		php = "\\/\\/",
		python = "#"
	}
	local char = commchar[ft] or "\\/\\/"

	-- this has a problem when there is no white space
	-- at the start of the line
	vim.cmd(":s/^\\(\\s*\\)" .. char .. " /\\1")
end

vim.keymap.set("n", "<C-A-;>", quick_uncomment)
vim.keymap.set("v", "<C-A-;>", quick_uncomment)

-- Copy full file-path
vim.keymap.set("n", "<leader>pa", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("file:", path)
end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
    group = augroup,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Command line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end


-- ============================================================================
-- STATUSLINE
-- ============================================================================

-- Git branch function
local function git_branch()
	local path = vim.fn.expand('%:h')
	local branch = ""

	if path == "." or path == "" then
		branch = vim.fn.system("git branch --show-current 2> /dev/null")
	else
		branch = vim.fn.system("git -C " .. path .. " branch --show-current 2> /dev/null")
	end
	branch = branch:gsub("%s+", "")
	if branch ~= "" then
		return " " .. branch .. " "
    end
    return " no git "
end

-- Git changes function
local function git_changes()
	-- use this to verify untracked files
	-- git ls-files --others --exclude-standard
	local path = vim.fn.expand('%:h')
	local diff = ""

	if path == "." or path == "" then
		diff = vim.fn.system("git diff --shortstat 2> /dev/null")
	else
		diff = vim.fn.system("git -C " .. path .. " diff --shortstat 2> /dev/null")
	end
	
	local s = {}
	for i in string.gmatch(diff, "([^,]+)") do
		table.insert(s, i)
	end

	local char={"#", "+", "-"}
	local num=""

	for index, j in ipairs(s) do
		for k in j.gmatch(j, "([%d]+)") do
			num = num .. k .. char[index] .. " "
		end
	end

	if #num == 0 then
		return ""
	else
		num = num:gsub("^%s*(.-)%s*$", "%1")
		return num
	end
end

-- File type with icon
local function file_type()
    local ft = vim.bo.filetype
    local icons = {
        lua = "[LUA]",
        python = "[PY]",
		php = "[PHP]",
        javascript = "[JS]",
        html = "[HTML]",
        css = "[CSS]",
        json = "[JSON]",
        markdown = "[MD]",
        vim = "[VIM]",
        sh = "[SH]",
		cs = "[C#]",
		text = "[TXT]",
		cpp = "[C++]",
		ps1 = "[PS]",
		toml = "[TOML]",
    }

    if ft == "" then
        return "  "
    end

    return (icons[ft] or "[" .. ft .. "]")
end

-- LSP status
local function lsp_status()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients > 0 then
        return "  LSP "
    end
    return ""
end

-- Word count for text files
local function word_count()
    local ft = vim.bo.filetype
    if ft == "markdown" or ft == "text" or ft == "tex" then
        local words = vim.fn.wordcount().words
        return " " .. words .. " words "
    end
    return ""
end

-- File size
local function file_size()
    local size = vim.fn.getfsize(vim.fn.expand('%'))
    if size < 0 then return "" end
    if size < 1024 then
        return size .. " B"
    elseif size < 1024 * 1024 then
        return string.format("%.1f KiB", size / 1024)
    else
        return string.format("%.1f MiB", size / 1024 / 1024)
    end
end

-- Mode indicators with icons
local function mode_icon()
    local mode = vim.fn.mode()
    local modes = {
        n = " NOR ",
        i = " INS ",
        v = " VIS ",
        V = " V-LI ",
        ["\22"] = " V-BL ", -- Ctrl-V
        c = " CMD ",
        s = " SEL ",
        S = " S-LI ",
        ["\19"] = " S-BL ", -- Ctrl-S
        R = " REP ",
        r = " REP ",
        ["!"] = " SHELL ",
        t = " TERMINAL "
    }
    return modes[mode] or " NONE " .. mode:upper()
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.git_changes = git_changes
_G.file_type = file_type
_G.file_size = file_size
_G.lsp_status = lsp_status
_G.word_count = word_count

vim.cmd([[
  highlight StatusLineBold gui=bold cterm=bold
]])

vim.api.nvim_set_hl(0, "StatusLine", { bold=true, bg="#d9d9d9", fg="#05021e"})

-- Function to change statusline based on window focus
local function setup_dynamic_statusline()
	-- Create command for window focused
    vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "BufWritePost" }, {
        callback = function()
			local git_changes = git_changes()
			if #git_changes == 0 then
				git_changes = ""
			else
				git_changes = "%#StatusLineBold#[ " .. git_changes .. " ]%#StatusLine#"
				-- git_changes = "%#StatusLine#[ " .. git_changes .. " ]%#StatusLine#"
			end
			
            vim.opt_local.statusline = table.concat {
                " ",
                "%#StatusLineBold#",
                "%{v:lua.mode_icon()}",
                "%#StatusLine#",
                " %f %h%m%r",			--%File %Hidden%Modified%Readonly
                 -- "%{v:lua.file_type()}", --File type
                "│",
                "%{v:lua.file_size()}",
                "│",
				"%{v:lua.word_count()}",
                "%{v:lua.lsp_status()}",
                "%=",					-- Right-align everything after this
				"%#StatusLineBold#[%{v:lua.git_branch()}]%#StatusLine#",
				git_changes,
                " %l:%c %P ",			-- Line:Column and Percentage
            }
        end
    })
    vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })
	
	-- Create command for window NOT focused
    vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
        callback = function()
            vim.opt_local.statusline = table.concat{" %f %h%m%r │ %{v:lua.file_type()} │ %=  %l:%c %P "}
        end
    })
end

setup_dynamic_statusline()

-- ============================================================================
-- ## STATUSLINE
-- ============================================================================
