local vimrc = vim.fn.stdpath("config") .. "/initrc.vim"
vim.cmd.source(vimrc)

if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = "§"
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
	    -- add your plugins here
	    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	    {'jremmen/vim-ripgrep'},
	    {'ludovicchabant/vim-gutentags'},
	    {'nvim-treesitter/nvim-treesitter-refactor'},
	    {'neovim/nvim-lspconfig'},
	    {'sindrets/diffview.nvim'},
	    { "junegunn/fzf", build = "./install --bin" },
	    { 'gen740/SmoothCursor.nvim',
		  config = function()
		    require('smoothcursor').setup()
		  end
		},
	    {"ibhagwan/fzf-lua",
		  -- optional for icon support
		  dependencies = { "nvim-tree/nvim-web-devicons" },
		  config = function()
		    -- calling `setup` is optional for customization
		    require("fzf-lua").setup({})
		  end
		},
		{
		  "HakonHarnes/img-clip.nvim",
		  event = "VeryLazy",
		  opts = {
		    -- add options here
		    -- or leave it empty to use the default settings
		  },
		  keys = {
		    -- suggested keymap
		    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		  },
		},
		{
		  "yetone/avante.nvim",
		  event = "VeryLazy",
		  lazy = false,
		  version = false, -- set this if you want to always pull the latest change
		  opts = {
		    -- add any opts here
		  },
		  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		  build = "make",
		  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		  dependencies = {
		    "stevearc/dressing.nvim",
		    "nvim-lua/plenary.nvim",
		    "MunifTanjim/nui.nvim",
		    --- The below dependencies are optional,
		    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		    --- "zbirenbaum/copilot.lua", -- for providers='copilot'
		    {
		      -- support for image pasting
		      "HakonHarnes/img-clip.nvim",
		      event = "VeryLazy",
		      opts = {
			-- recommended settings
			default = {
			  embed_image_as_base64 = false,
			  prompt_for_file_name = false,
			  drag_and_drop = {
			    insert_mode = true,
			  },
			  -- required for Windows users
			  use_absolute_path = true,
			},
		      },
		    },
		    {
		      -- Make sure to set this up properly if you have lazy=true
		      'MeanderingProgrammer/render-markdown.nvim',
		      opts = {
			file_types = { "markdown", "Avante" },
		      },
		      ft = { "markdown", "Avante" },
		    },
		  },
		},
	    	{
	    "nvim-treesitter/nvim-treesitter",
	    build = ":TSUpdate",
	    config = function () 
	      local configs = require("nvim-treesitter.configs")


	      configs.setup({
		  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
		  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "rust" },
		  -- Install parsers synchronously (only applied to `ensure_installed`)
		  sync_install = false,
		  -- Automatically install missing parsers when entering buffer
		  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		  auto_install = true,
		  -- List of parsers to ignore installing (or "all")
		  ignore_install = { "javascript" },
		  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
		  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
		  highlight = {
		    enable = true,
		    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		    -- the name of the parser)
		    -- list of language that will be disabled
		    -- disable = { "c", "rust" },
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

		  incremental_selection = {
		    enable = true,
		    keymaps = {
		      init_selection = "gnn", -- set to `false` to disable one of the mappings
		      node_incremental = "grn",
		      scope_incremental = "grc",
		      node_decremental = "grm",
		    },
		  },

		  refactor = {
		    highlight_definitions = {
		      enable = true,
		      -- Set to false if you have an `updatetime` of ~100.
		      clear_on_cursor_move = true,
		    },
		  },
		})
	    end
	 }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require('lspconfig').ruff.setup {
  cmd_env = { RUFF_TRACE = "messages" }
}

local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-mocha')
if not ok then
  vim.cmd 'colorscheme default' -- if the above fails, then use default
end

