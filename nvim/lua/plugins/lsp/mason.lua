return {
    "mason-org/mason.nvim",
     version = "^1.0.0",
    dependencies = {
        {"mason-org/mason-lspconfig.nvim",  version = "^1.0.0"}
    },
    opts = {},
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

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

      -- list of servers for mason to install
    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls", -- Typescript & Javascript LSP
        "lua_ls",
      },
    })

    
    end
}
