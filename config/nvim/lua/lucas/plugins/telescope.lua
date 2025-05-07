return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-p>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-n>"] = actions.move_selection_next, -- move to next result
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" })
        keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "[S]earch [R]ecent [F]iles" })
        keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch [T]ext in files" })
        keymap.set("n", "<leader>scw", "<cmd>Telescope grep_string<cr>", { desc = "[S]earch for [C]urrent [W]ord" })
        keymap.set("n", "<leader>std", "<cmd>TodoTelescope<cr>", { desc = "[S]earch [T]o[D]os" })
    end,
}
