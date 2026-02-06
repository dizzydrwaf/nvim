-- keymaps for better default experience

-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- for conciseness
local opts = { noremap = true, silent = true }

-- disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- make file executable
vim.keymap.set('n', '<leader>x', function()
    vim.fn.system({'chmod', '+x', vim.api.nvim_buf_get_name(0)})
    print("'" .. string.match(vim.api.nvim_buf_get_name(0), "([^/]+)/?$") .. "' is now executable")
end, opts)

-- open terminal
vim.keymap.set('n', '<leader>t', ":term<CR>i", opts)

-- clear highlight
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- find/find and replace
vim.keymap.set('n', '<leader>ff', function()
    local word = vim.fn.expand('<cword>')
    if word ~= '' then
        vim.cmd('let @/ = "' .. vim.fn.escape(word, '\\') .. '"')
        vim.opt.hlsearch = true
    end
end, opts)
vim.keymap.set('v', '<leader>ff', function()
    local old_reg = vim.fn.getreg('"')
    vim.cmd('normal! "vy')
    local text = vim.fn.getreg('"')
    vim.fn.setreg('"', old_reg)
    if text ~= '' then
        vim.cmd('let @/ = "' .. vim.fn.escape(text, '\\') .. '"')
        vim.opt.hlsearch = true
    end
end, opts)
vim.keymap.set('n', '<leader>fr', function()
    local word = vim.fn.expand('<cword>')
    if word ~= '' then
        vim.api.nvim_feedkeys(':%s/' .. word .. '/', 'n', false)
    end
end, opts)
vim.keymap.set('v', '<leader>fr', function()
    -- Save and restore register
    local old_reg = vim.fn.getreg('"')
    vim.cmd('normal! "vy')
    local text = vim.fn.getreg('"')
    vim.fn.setreg('"', old_reg)
    if text ~= '' then
        vim.api.nvim_feedkeys(':%s/' .. text .. '/', 'n', false)
    end
end, opts)

-- resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>bq', ':bdelete!<CR>', opts)   -- quit buffer
vim.keymap.set('n', '<leader>bx', ':bdelete<CR>', opts)    -- close buffer
vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', opts) -- new buffer

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', opts)     -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', opts)     -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', ':close<CR>', opts) -- close current split window

-- navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- toggle line wrapping
vim.keymap.set('n', '<leader>wl', '<cmd>set wrap!<CR>', opts)

-- press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', opts)

-- stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- move text up and down
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- do not put x into clipboard
vim.keymap.set({ 'n', 'v' }, 'x', '"_x')

-- colorcolumn
vim.keymap.set("n", "<leader>c", function()
    local cc = vim.opt.colorcolumn:get()
    if #cc == 0 or (cc[1] == "0") then
        vim.opt.colorcolumn = "72"
    else
        vim.opt.colorcolumn = "0"
    end
end, opts)

-- background
local bg_on = false
function ToggleBackground()
    vim.cmd [[
      highlight Normal ctermbg=Black guibg=#000000
      highlight NormalNC ctermbg=Black guibg=#000000
      highlight SignColumn ctermbg=Black guibg=#000000
      highlight VertSplit ctermbg=Black guibg=#000000
      ]] if bg_on then
        bg_on = false
    else
        vim.cmd [[
      highlight Normal ctermbg=Gray guibg=#171219
      highlight NormalNC ctermbg=Gray guibg=#171219
      highlight SignColumn ctermbg=Gray guibg=#171219
      highlight VertSplit ctermbg=Gray guibg=#171219
      ]]
        bg_on = true
    end
end

vim.api.nvim_set_keymap('n', '<leader>bg', ':lua ToggleBackground()<CR>', { noremap = true, silent = true })

-- expand and read a template file into the current buffer
local function read_tpl(name)
    local path = vim.fn.stdpath("config") .. "/skeletons/" .. name
    vim.cmd(("read %s"):format(vim.fn.fnameescape(path)))
    vim.cmd("normal! kvx")
end

vim.keymap.set("n", "<leader>,h", function() read_tpl("skeleton.html") end, { desc = "HTML skeleton" })
vim.keymap.set("n", "<leader>,p", function() read_tpl("skeleton.py") end, { desc = "Python skeleton" })
