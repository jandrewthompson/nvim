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
                logs = {
                    level = "trace",
                    save = true,
                },
                result = {
                    split = {
                        horizontal = false,
                        in_place = true,
                        stay_in_current_window_after_split = true,
                    },
                    behavior = {
                        decode_url = true,
                        show_info = {
                            url = true,
                            headers = true,
                            http_info = true,
                            curl_command = true,
                        },
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
