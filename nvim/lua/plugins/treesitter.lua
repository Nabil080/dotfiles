return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({
            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "bash",
                "lua",
                "vim",
                "vimdoc",
                "c",
                "cpp",
                "markdown",
                "markdown_inline",
            },

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (or "all")
            -- ignore_install = {"javascript"},

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                -- disable = { "c", "rust" },
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end
}
