return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        -- Config
        require("treesitter-context").setup({
            enable = true,
            separator = "-",
        })

        -- Appearance
        vim.cmd("hi TreesitterContext guibg=NONE")

        -- Keymaps
        vim.keymap.set("n", "[c", function()
            require("treesitter-context").go_to_context(vim.v.count1)
        end, { silent = true })
    end
}
