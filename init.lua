require("base_configs")
require("keymaps")
require("status_line")


-- These configs are still being tested and changed A LOT
-- Once they are consolidated, they will be passed into 
-- their own file or to a file that best encapsulates
-- their behaviour.




-- Quick comment
comment_chars = {
		lua = "--",
		php = "\\/\\/",
		python = "#",
		toml = "#",
}

local function quick_comment()
	local ft = vim.bo.filetype
	local char = comment_chars[ft] or "\\/\\/"

	local mode = vim.fn.mode()
	if (mode == 'v' or mode == 'V') then
		local _, start_s = unpack(vim.fn.getpos("v"))
		local _, end_s = unpack(vim.fn.getpos("."))
		vim.cmd(":" .. start_s .. "," .. end_s .. "s/^\\(\\s*\\)/\\1" .. char .. " ")
	else
		vim.cmd([[:s/^\(\s*\)/\1]] .. char .. " ")
	end
end

vim.keymap.set("n", "<C-;>", quick_comment)
vim.keymap.set("v", "<C-;>", quick_comment)

-- Quick uncomment
local function quick_uncomment()
	local ft = vim.bo.filetype
	local char = comment_chars[ft] or "\\/\\/"

	local mode = vim.fn.mode()
	if (mode == 'v' or mode == 'V') then
		local _, start_s = unpack(vim.fn.getpos("v"))
		local _, end_s = unpack(vim.fn.getpos("."))
		vim.cmd(":" .. start_s .. "," .. end_s .. "s/^\\(\\s*\\)" .. char .. " /\\1")
		-- vim.cmd([[:'<,'>s/^\(\s*\)]] .. char .. " /\\1")
	else
		vim.cmd([[:s/^\(\s*\)]] .. char .. " /\\1")
	end
end

vim.keymap.set("n", "<C-A-;>", quick_uncomment)
vim.keymap.set("v", "<C-A-;>", quick_uncomment)

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


-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end


--Set encoding for php files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "php",
	callback = function()
		vim.opt.fileencoding = "iso-8859-1"
	end
})


