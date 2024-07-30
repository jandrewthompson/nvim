return {
    "Olical/conjure",
    dependencies = {
        "clojure-vim/vim-jack-in",
        "tpope/vim-dispatch",
        "radenling/vim-dispatch-neovim",
        "julienvincent/nvim-paredit",
    },
    config = function()
        require('nvim-paredit').setup()
    end

}
