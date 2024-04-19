function ColorStuff(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "@attribute", { fg = "gold" })
	vim.api.nvim_set_hl(0, "@lsp.type.attribute", { fg = "gold" })

end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function() 
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            vim.cmd("colorscheme rose-pine")

            ColorStuff()
        end
    },

}
