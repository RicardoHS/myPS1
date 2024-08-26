local vimrc = vim.fn.stdpath("config") .. "/initrc.vim"
vim.cmd.source(vimrc)

require('lspconfig').ruff.setup {
  cmd_env = { RUFF_TRACE = "messages" }
}


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
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
	    -- add your plugins here
	    {
	  "yetone/avante.nvim",
	  event = "VeryLazy",
	  build = "make",
	  opts = {
	    -- add any opts here
	  },
	  dependencies = {
	    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	    "stevearc/dressing.nvim",
	    "nvim-lua/plenary.nvim",
	    "MunifTanjim/nui.nvim",
	    --- The below is optional, make sure to setup it properly if you have lazy=true
	    {
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

