-------------- Init ----------------------
vim.cmd("syntax on")
vim.cmd("colorscheme material")

-------------- Plugins -------------------
local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'        	            -- Package manager
    use 'devinvs/material.vim'          	            -- Material Theme
    use 'neovim/nvim-lspconfig'                     	-- Config for nvim lsp
    use {'ms-jpq/coq_nvim', branch='coq'}	            -- Completion
    use {'ms-jpq/coq.artifacts', branch='artifacts'}	-- Completion
    use 'simrat39/rust-tools.nvim'      	            -- Rust
    use 'jiangmiao/auto-pairs'
    use 'dense-analysis/ale'
end)

-------------- PluginSetup ---------------
vim.g['coq_settings'] = { auto_start='shut-up', keymap = { recommended = false } }    -- Start completion

local lsp = require "lspconfig"
local coq = require "coq"

--lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())          -- Rust
lsp.ccls.setup(coq.lsp_ensure_capabilities())                   -- C/C++
lsp.ccls.setup(coq.lsp_ensure_capabilities())                   -- C/C++
--lsp.jedi_language_server.setup(coq.lsp_ensure_capabilities())   -- Python
lsp.ruff_lsp.setup(coq.lsp_ensure_capabilities())
lsp.eslint.setup(coq.lsp_ensure_capabilities())                 -- JS
lsp.gopls.setup(coq.lsp_ensure_capabilities())                  -- Go

-- Rust Tools Setup
local rt = require("rust-tools")
 rt.setup({
     tools = {
        runnables = {
            use_telescope = true,
        },
     },
     server = {
         standalone = false,
     },
 })

-------------- Options -------------------
vim.opt.guicursor = ""                	-- Use terminal cursor
vim.opt.termguicolors = true		    -- use theme colors
vim.opt.backspace = "indent,eol,start"	-- backspace behavior
vim.opt.number = true			        -- show numbers
vim.opt.showcmd = true			        -- show command line
vim.opt.tabstop = 4	                    -- set tabs to 4 spaces
vim.opt.expandtab = true		        -- replace tabs with spaces
vim.opt.shiftwidth = 4			        -- how far to shift by
vim.opt.softtabstop = 4
vim.opt.textwidth = 80                  -- break after 80 characters
vim.opt.incsearch = true                -- search as you type
vim.opt.hlsearch = true                 -- highlight search results
vim.opt.foldenable = true               -- enable folding nested code
vim.opt.foldlevelstart = 10             -- fold after 10 nested layers
vim.opt.foldmethod = "indent"           -- fold by indenting
vim.opt.clipboard = "unnamedplus"       -- use system clipboard!!!
vim.opt.undodir = "/home/devin/.vim/undodir"      -- store file histories here
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-------------- Keybinds ------------------
vim.keymap.set('n', 'j', 'gj')          -- Move through visual, not actual lines
vim.keymap.set('n', 'k', 'gk')          -- Move through visual, not acutal lines

-- coq
local remap = vim.api.nvim_set_keymap
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils= {}

remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
