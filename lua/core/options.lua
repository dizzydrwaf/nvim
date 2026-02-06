vim.wo.number = true
vim.wo.relativenumber = true
--vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.scrolloff = 4
vim.o.sidescrolloff = 8

-- Tabs
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.smartindent = true
vim.o.showmode = false
vim.o.conceallevel = 0
vim.o.fileencoding = "utf-8"
vim.o.autoindent = true
vim.o.colorcolumn = "0"
vim.o.foldmethod = "marker"

vim.opt.guicursor = {
    "n:block",
    "v:block",
    "V:block",
    "r-cr:block",
    "i-ci:ver25",
    "ve:block",
    "o:hor20",
    "c:ver25",
    "sm:block"
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.cmd [[
    highlight Normal ctermbg=Black guibg=#000000
    highlight NormalNC ctermbg=Black guibg=#000000
    highlight SignColumn ctermbg=Black guibg=#000000
    highlight VertSplit ctermbg=Black guibg=#000000
]]
