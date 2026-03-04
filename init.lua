require("base_configs")
require("keymaps")
require("status_line")
require("config.lazy")
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "php", "python", "javascript", "bash", "c", "cpp", "c_sharp", "http", "hurl", "sql", "toml", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

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


