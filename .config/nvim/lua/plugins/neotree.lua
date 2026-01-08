return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,                -- neo-tree will lazily load itself
        opts = {},
        config = function()
            vim.keymap.set('n', '<leader>b', '<Cmd>Neotree toggle<CR>')
            require("neo-tree").setup({
                window = {
                    position = "left",
                    width = 30, -- Set the width in columns (default is 40)
                },
            })
        end
    }
}
