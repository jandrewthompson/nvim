return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup({
                result = {
                    split = {
                        horizontal = false,
                        in_place = true,
                        stay_in_current_window_after_split = true,
                    },
                },
                keybinds = {
                    {
                        "<localleader>rr", "<cmd>Rest run<cr>", "Run request under cursor",
                    },
                    {
                        "<localleader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
                    }
                }
            })
        end,
    }
}
