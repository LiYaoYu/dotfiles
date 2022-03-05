local modes = {
    ['n']    = 'NORMAL',
    ['no']   = 'O-PENDING',
    ['nov']  = 'O-PENDING',
    ['noV']  = 'O-PENDING',
    ['no']   = 'O-PENDING',
    ['niI']  = 'NORMAL',
    ['niR']  = 'NORMAL',
    ['niV']  = 'NORMAL',
    ['nt']   = 'NORMAL',
    ['v']    = 'VISUAL',
    ['vs']   = 'VISUAL',
    ['V']    = 'V-LINE',
    ['Vs']   = 'V-LINE',
    ['']     = 'V-BLOCK',
    ['s']    = 'V-BLOCK',
    ['\x16'] = 'V-BLOCK',
    ['s']    = 'SELECT',
    ['S']    = 'S-LINE',
    ['i']    = 'INSERT',
    ['ic']   = 'INSERT',
    ['ix']   = 'INSERT',
    ['R']    = 'REPLACE',
    ['Rc']   = 'REPLACE',
    ['Rx']   = 'REPLACE',
    ['Rv']   = 'V-REPLACE',
    ['Rvc']  = 'V-REPLACE',
    ['Rvx']  = 'V-REPLACE',
    ['c']    = 'COMMAND',
    ['cv']   = 'EX',
    ['ce']   = 'EX',
    ['r']    = 'REPLACE',
    ['rm']   = 'MORE',
    ['r?']   = 'CONFIRM',
    ['!']    = 'SHELL',
    ['t']    = 'TERMINAL',
}

vim.highlight.create('Mode', {ctermfg = 0, ctermbg = 39}, false)
vim.highlight.create('FilePath', {ctermfg = 15, ctermbg = 237}, false)
vim.highlight.create('FileEncoding', {ctermfg = 15, ctermbg = 237}, false)
vim.highlight.create('LineInfo', {ctermfg = 0, ctermbg = 39}, false)
vim.highlight.create('FileType', {ctermfg = 0, ctermbg = 15}, false)

local function mode_section()
    return string.format('  %s  ', modes[vim.api.nvim_get_mode().mode])
end

local function filepath_section()
    return '  %F  '
end

local function filestatus_section()
    return '  %m%r%w'
end

local function fileencoding_section()
    return '  %{"".(&fenc!=""?&fenc:&enc).""}  '
end

local function lineinfo_section()
    if vim.bo.filetype == 'alpha' then
        return ''
    end
    return ' %5l, %3c  (%P) '
end

local function filetype_section()
    return '  %y  '
end

function statuslinedisplay()
    return table.concat {
        '%#Statusline#',
        '%#Mode#',
        mode_section(),

        '%#Normal#',
        '%#FilePath#',
        filestatus_section(),
        filepath_section(),

        '%=%#StatusLineExtra#',
        '%#FileEncoding#',
        fileencoding_section(),
        '%#LineInfo#',
        lineinfo_section(),
        '%#FileType#',
        filetype_section(),
    }
end

vim.api.nvim_exec([[set statusline=%!v:lua.statuslinedisplay()]], false)
