local function getGroupName(key, label)
    local keybindings = vim.api.nvim_command_output("map <space>" .. key)
    local _, count = keybindings:gsub("\n","")
    return tostring(count / 2) .. " " .. label
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.add({
          { "<leader>s", group = getGroupName('s', "Splits") },
          { "<leader>t", group = getGroupName('t', "Tabs") },
          { "<leader>f", group = getGroupName('f', "Telescope") },
        })

        vim.keymap.set('n', '<leader>w', '<cmd>WhichKey<cr>', { desc = 'WhichKey' })
    end,
}
