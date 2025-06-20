return {
  "folke/which-key.nvim",
  event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.add({
          { "<leader>s", group = "splits" },
          { "<leader>t", group = "tabs" },
        })
    end,
}
