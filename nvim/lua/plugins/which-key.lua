return {
  "folke/which-key.nvim",
  event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.add({
          { "<leader>s", group = " Splits" },
          { "<leader>t", group = " Tabs" },
          { "<leader>f", group = " Telescope"},
        })

        vim.keymap.set('n', '<leader>w', '<cmd>WhichKey<cr>', { desc = 'WhichKey' })
    end,
}
