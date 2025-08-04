if vim.wo.diff then

    local function set_diff_mode_highlight()
        local bufnr = vim.api.nvim_get_current_buf()

        if bufnr == 1 then
            vim.cmd(
                'set winhl=' ..
                'DiffAdd:DiffLeftLine,' ..
                'DiffChange:DiffLeftLine,' ..
                'DiffDelete:DiffLeftLine,' ..
                'DiffText:DiffLeftText'
            )
        elseif bufnr == 2 then
            vim.cmd(
                'set winhl=' ..
                'DiffAdd:DiffRightLine,' ..
                'DiffChange:DiffRightLine,' ..
                'DiffDelete:DiffRightLine,' ..
                'DiffText:DiffRightText'
            )
        end
    end

    vim.api.nvim_create_autocmd(
        'BufRead', { callback = set_diff_mode_highlight }
    )
end
