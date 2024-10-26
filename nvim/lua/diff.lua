if vim.api.nvim_win_get_option(0, "diff") then
    vim.api.nvim_command('hi DiffLeftLine guibg=#26171c')
    vim.api.nvim_command('hi DiffLeftText guibg=#782d2d')
    vim.api.nvim_command('hi DiffRightLine guibg=#13261d')
    vim.api.nvim_command('hi DiffRightText guibg=#206036')

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

    vim.api.nvim_create_autocmd("BufRead", {
        callback = set_diff_mode_highlight,
    })

end
