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
vim.api.nvim_set_hl(0, "NoBuffStatusLine", { bold=true, bg="#0a0723", fg="#d9d9d9"})

-- Inverted colors
-- vim.api.nvim_set_hl(0, "StatusLine", { bold=true, bg="#0a0723", fg="#d9d9d9"})
-- vim.api.nvim_set_hl(0, "NoBuffStatusLine", { bold=true, bg="#d9d9d9", fg="#05021e"})

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
            vim.opt_local.statusline = table.concat{"%#NoBuffStatusLine# %f %h%m%r %=  %P "}
        end
    })
end

setup_dynamic_statusline()

-- ============================================================================
-- ## STATUSLINE
-- ============================================================================
