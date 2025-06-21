return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require("telescope.actions")

        telescope.setup({
          defaults = {
            path_display = { "smart" },
            mappings = {
              i = {
                ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                ["<C-j>"] = actions.move_selection_next, -- move to next result
                ["<Left>"] = false,
                ["<Right>"] = false,
                ["<Up>"] = false,
                ["<Down>"] = false,
              },
            },
          },
        })

        telescope.load_extension("fzf")

        ---------- keymaps
        local keymap = vim.keymap
        local builtin = require('telescope.builtin')

        -- Global
        keymap.set('n', '<leader>f<leader>', '<cmd>Telescope<cr>', { desc = 'Telescope cmds' })
        keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
        keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })

        -- Current working directory
        keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files'})
        keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Find string' })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

        -- Git
        keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Git files' })
        keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Git status' })
    end,
}
