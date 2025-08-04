local highlights = {
    -- UI highlights
    ModeMsg = { bg = 'NONE', ctermbg = 'NONE' },
    MoreMsg = { bg = 'NONE', ctermbg = 'NONE' },

    -- custom highlights
    Whitespace = { fg = '#ff8282' },
    ColumnGuide = { fg = '#303030', ctermfg = 236 },

    -- diff mode highlights
    DiffLeftLine = { bg = '#26171c' },
    DiffLeftText = { bg = '#782d2d' },
    DiffRightLine = { bg = '#13261d' },
    DiffRightText = { bg = '#206036' },

    -- plugin highlights
    NormalFloat = { bg = 'none' },
    BufferLineFill = { bg = 'none' },
}

-- apply all highlights
for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
end
