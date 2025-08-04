return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    lazy = false,
    config = function()
        require("claudecode").setup()

        -- send selection and add buffer
        vim.api.nvim_create_user_command("ClaudeCodeSendAndAdd", function()
            vim.cmd("ClaudeCodeSend")
            vim.cmd("ClaudeCodeAdd %")
        end, { range = true })

        -- add ESC to exit terminal mode in Claude buffers
        vim.api.nvim_create_autocmd("TermOpen", {
            callback = function()
                local bufname = vim.api.nvim_buf_get_name(0)
                if bufname and bufname ~= "" and
                   (bufname:match("claude") or bufname:match("Claude")) then
                    -- map ESC to exit terminal mode in Claude buffers
                    vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", {
                        buffer = true,
                        nowait = true,
                        desc = "Exit terminal mode in Claude buffer"
                    })
                end
            end,
            desc = "Setup Claude terminal buffer keymaps"
        })
    end,
    keys = {
        { "<A-l>", "<cmd>ClaudeCode --resume<cr>", desc = "Claude resume session" },
        { "<A-l>", "<C-\\><C-n><cmd>ClaudeCode<cr>", desc = "Toggle Claude", mode = "t" },
        { "<A-;>", "<cmd>ClaudeCodeSendAndAdd<cr>", desc = "Add and send selection", mode = "v" },
    },
}
