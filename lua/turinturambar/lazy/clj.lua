return {
    "Olical/conjure",
    dependencies = {
        "clojure-vim/vim-jack-in",
        "tpope/vim-dispatch",
        "radenling/vim-dispatch-neovim",
        "julienvincent/nvim-paredit",
    },
    ft = {"clojure", "racket", "scheme"},
    lazy = true,
    init = function()
       vim.g["conjure#debug"] = true
       vim.g["conjure#filetypes"] = {'clojure','racket','scheme'}
    end,
    config = function()
        require('nvim-paredit').setup()
    end
}
