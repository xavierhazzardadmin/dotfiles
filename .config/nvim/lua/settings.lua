local g = vim.g
local o = vim.opt
local v = vim

vim.cmd [[colorscheme shades_of_purple]]
vim.cmd [[set termguicolors]]
vim.cmd [[set signcolumn number]]
vim.cmd [[syntax on]]
vim.cmd [[set autowrite]]
vim.cmd [[filetype plugin on]]
vim.cmd [[set showmatch]]
vim.cmd [[set list]]
vim.cmd [[set ruler]]
vim.cmd [[set regexpengine=1]]
-- g.gruvbox_transparent_bg = 1

v.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

v.wo.number = true

o.title = true
o.autoindent = true
o.hlsearch = true
o.backup = false
o.showcmd = true
o.cmdheight = 1
o.laststatus = 2
o.expandtab = true
o.scrolloff = 10
o.shell = 'zsh'
o.inccommand = 'split'
o.ignorecase = true
o.smarttab = true
o.breakindent = true
o.shiftwidth = 4
o.tabstop = 4
o.ai = true
o.si = true
o.wrap = false
o.backspace = 'start,eol,indent'
o.path:append { '**' }
o.wildignore:append { '*/node_modules/*' }
v.cmd([[let &t_Cs = "\e[4:3m]"]])
v.cmd([[let &t_Cs = "\e[4:0m]"]])
o.formatoptions:append { 'r' }

g.delimitMate_expand_cr = 1

-- require("go").setup()
-- require("go.format").goimport()
-- -- Run gofmt + goimport on save
v.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

v.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = 'set nopaste'
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.golines,
    },
})

