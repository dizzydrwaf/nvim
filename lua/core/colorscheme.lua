local c = {}
--c[0] =	"#171219"	--opaque background
c[0] =	"#000000"		--transparent background
c[1] =	"#b11b20"
c[2] =	"#889333"
c[3] =	"#b7aa29"
c[4] =	"#5b20a0"
c[5] =	"#9a2189"
c[6] =	"#2874b6"
c[7] =	"#d5dbc5"
c[8] =	"#2b272e"
c[9] =	"#d03d36"
c[10] =	"#a3ae4d"
c[11] =	"#d4c546"
c[12] =	"#773abc"
c[13] =	"#b740a4"
c[14] =	"#4a8dd2"
c[15] =	"#f1f8e1"

vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.background = "dark"
vim.o.termguicolors = true

local set = vim.api.nvim_set_hl;

-- General
set(0, "Normal",			{ bg = c[0], fg = c[15] })

-- Punctuation
set(0, "@punctuation",		{ fg = c[7] })
set(0, "@operator",			{ fg = c[7] })
set(0, "@constructor",		{ fg = c[7] })

-- General coding
set(0, "@comment",			{ fg = c[12] })
set(0, "@keyword",			{ fg = c[15] })
set(0, "@function",			{ fg = c[13] })
set(0, "@function.builtin", { fg = c[5] })
set(0, "@type",				{ fg = c[12] })
set(0, "@type.builtin",		{ fg = c[4] })

-- Variables
set(0, "@variable",			{ fg = c[14] })
set(0, "@variable.builtin",	{ fg = c[6] })
set(0, "@property",			{ fg = c[14] })
set(0, "@constant",			{ fg = c[11] })

-- Datatypes
set(0, "@string",			{ fg = c[2] })
set(0, "@string.escape",	{ fg = c[3] })
set(0, "@character",		{ fg = c[2] })
set(0, "@number",			{ fg = c[2] })
set(0, "@number.float",		{ fg = c[2] })
set(0, "@boolean",			{ fg = c[2] })
