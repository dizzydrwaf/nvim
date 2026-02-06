local c = {
    black = "#171219",
    red = "#b11b20",
    green = "#889333",
    yellow = "#b7aa29",
    blue = "#5b20a0",
    magenta = "#9a2189",
    cyan = "#2874b6",
    white = "#d5dbc5",
    brblack = "#2b272e",
    brred = "#d03d36",
    brgreen = "#a3ae4d",
    bryellow = "#d4c546",
    brblue = "#773abc",
    brmagenta = "#b740a4",
    brcyan = "#4a8dd2",
    brwhite = "#f1f8e1"
}

local theme = {
    normal = {
        a = {bg = c["brmagenta"], fg = c["black"], gui = "bold"},
        b = {bg = c["magenta"], fg = c["black"]},
        c = {bg = c["black"], fg = c["white"]},
    },
    insert = {
        a = {bg = c["brgreen"], fg = c["black"], gui = "bold"},
        b = {bg = c["green"], fg = c["black"]},
        c = {bg = c["black"], fg = c["white"]},
    },
    visual = {
        a = {bg = c["brcyan"], fg = c["black"], gui = "bold"},
        b = {bg = c["cyan"], fg = c["black"]},
        c = {bg = c["black"], fg = c["white"]},
    },
    replace = {
        a = {bg = c["brred"], fg = c["black"], gui = "bold"},
        b = {bg = c["red"], fg = c["black"]},
        c = {bg = c["black"], fg = c["white"]},
    },
    command = {
        a = {bg = c["brmagenta"], fg = c["black"], gui = "bold"},
        b = {bg = c["magenta"], fg = c["black"]},
        c = {bg = c["black"], fg = c["white"]},
    },
    inactive = {
        a = {bg = c["brcyan"], fg = c["black"]},
        b = {bg = c["cyan"], fg = c["black"]},
        c = {bg = c["black"], fg = c["white"]},
    }
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      theme = theme,
      --component_separators = { left = "", right = "" },
      --section_separators = { left = "", right = "" },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "filename" },
      lualine_c = { "branch", "diff", "diagnostics" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
