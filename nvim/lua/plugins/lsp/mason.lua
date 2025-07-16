return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- import lsp installer
        local mason_lspconfig = require("mason-lspconfig")

        -- list of servers for mason to install
        mason_lspconfig.setup({
            ensure_installed = {
                "ts_ls", -- Typescript & Javascript LSP
                "lua_ls",
                "vimls",
                "clangd",
                "phpactor"
            },
        })


        -- import tool installer
        local mason_tool_installer = require("mason-tool-installer")

        -- list of tools for mason to install
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",                         -- prettier formatter
                { "eslint_d", version = "13.1.2" }, -- js/ts linter
                "hadolint",                         -- docker lint
                -- "luacheck",                         -- lua linting
                "luaformatter",                     -- lua format
                "clang-format",                     -- c/c++
                "pretty-php",
            },
        })
    end
}
