local random_messages = {
    "there is no place like ~",
    "life is best lived in a shell",
    "thou shalt not kill -9",
    "if at first you don't succeed; call it version 1.0",
    "the more I C, the less I see",
    "i’d love to change the world, but they won’t give me the source code",
    "home is where the $HOME is",
    "i void warranties :)",
    "less is more, more or less",
    "lost in /var/log",
    "arguments with me end up in /dev/null",
    "feedback welcome; results may be sent to /dev/null",
    "if found, please return to /lost+found",
    "you’re my default gateway ^^",
    "script happens",
    "pipe dreams and shell scripts",
    "rusting away...",
	"mutability is a privilege",
	"from bugs into compile errors",
}

local function get_random_footer()
  math.randomseed(os.time())
  return random_messages[math.random(#random_messages)]
end

return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            "",
            "",
            "",
            "",
            "",
            "   /\\  /\\                                            /\\  /\\   ",
            "  /  \\/  \\                   ,@@,                   /  \\/  \\  ",
            " / /\\ \\/\\ \\               ,@@@@@@@@,               / /\\ \\/\\ \\ ",
            " \\ \\/\\ \\/ /            ,@@@@@@@@@@@@@@,            \\ \\/\\ \\/ / ",
            "  \\/ /\\/ /          ,@@@@@^  @@@@  ^@@@@@,          \\/ /\\/ /  ",
            "  / /\\/ /\\       ,@@@@@^     @@@@     ^@@@@@,       / /\\/ /\\  ",
            " / /\\  /\\ \\                  @@@@                  / /\\  /\\ \\ ",
            "/ /  \\/  \\ \\                 @@@@                 / /  \\/  \\ \\",
            "\\ \\  /\\  / /                 @@@@                 \\ \\  /\\  / /",
            " \\ \\/  \\/ /                  @@@@                  \\ \\/  \\/ / ",
            "  \\/ /\\/ /                   @@@@                   \\/ /\\/ /  ",
            "  / /\\/ /\\                   @@@@                   / /\\/ /\\  ",
            " / /\\ \\/\\ \\                  @@@@                  / /\\ \\/\\ \\ ",
            " \\ \\/\\ \\/ /                  @@@@                  \\ \\/\\ \\/ / ",
            "  \\  /\\  /                   @@@@                   \\  /\\  /  ",
            "   \\/  \\/                                            \\/  \\/   "
        }
        dashboard.section.buttons.val = {
            dashboard.button("n", "  New file", ":ene<CR>"),
            dashboard.button("e", "  Explorer", ":Neotree reveal<CR>"),
            dashboard.button("q", "  Quit NVIM", ":qa<CR>")
        }
        dashboard.section.footer.val = {"", "", get_random_footer()},
        require("alpha").setup(dashboard.config)
    end
}
