-- configure encodings
vim.g.encoding = 'UTF-8'
vim.o.fileencoding = 'utf-8'

-- emit true color
vim.opt.termguicolors = true

-- reserve lines when moving cursor
vim.o.scrolloff = 4
vim.o.sidescrolloff = 4

-- confirm before exit
vim.o.confirm = true

-- configure lines wrapping
vim.o.wrap = false
vim.wo.wrap = false

-- enable mouse
vim.o.mouse = 'a'

-- disable swap file
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- enable line number
vim.wo.number = true

-- enable cursor line
vim.wo.cursorline = true

-- handle trailing list
vim.opt.list = true
vim.opt.listchars:append('trail:⋅')

-- set tab expanding
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set tab config specifically for Makefile
vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = false
    end,
    desc = "Use tabs instead of spaces for Makefiles"
})

-- ignore case sensitive when string search
vim.opt.ignorecase = true

-- configure diagnostic
vim.diagnostic.config(
    {
        virtual_text = false,
        float = { border = 'rounded' },
        underline = {
            severity = {
                min = vim.diagnostic.severity.HINT,
            },
        },
        signs = {
            priority = 10,
            text = {
                [vim.diagnostic.severity.ERROR] = "|",
                [vim.diagnostic.severity.WARN] = "|",
                [vim.diagnostic.severity.INFO] = "|",
                [vim.diagnostic.severity.HINT] = "|"
            }
        }
    }
)

-- configure 80 column reminder
local ns_id = vim.api.nvim_create_namespace("column_guide")

local function show_column_guide()
    local bufnr = vim.api.nvim_get_current_buf()
    local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')

    -- Only show for normal editable buffers (buftype == '')
    -- This includes empty buffers and excludes terminals, help, quickfix, etc.
    if buftype ~= '' then
        return
    end

    local total_lines = vim.api.nvim_buf_line_count(bufnr)

    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

    -- process entire buffer, which is simpler and reliable
    for i = 0, total_lines - 1 do
        local line = vim.api.nvim_buf_get_lines(bufnr, i, i + 1, false)[1] or ''
        local line_len = #line
        local visual_width = vim.fn.strdisplaywidth(line)

        if visual_width < 80 then
            vim.api.nvim_buf_set_extmark(
                bufnr, ns_id, i, line_len, {
                    virt_text = { { "│", "ColumnGuide" } },
                    virt_text_pos = "overlay",
                    virt_text_win_col = 79,
                    hl_mode = "combine"
                }
            )
        end
    end
end

vim.api.nvim_create_autocmd(
    { "TextChanged", "TextChangedI", "BufEnter" }, {
        callback = show_column_guide,
    }
)
