return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            lua = { "luacheck" },
            -- c = { "cpplint" },
            -- cpp = { "cpplint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        -- Run try_lint on buffer write
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        -- Disable linting
        vim.keymap.set("n", "<leader>dl", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
