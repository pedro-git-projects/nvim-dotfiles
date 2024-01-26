local colorschemes = {
    gruvbox = function() vim.cmd [[colorscheme gruvbox]] end,
    baby = function() vim.cmd [[colorscheme gruvbox-baby]] end,
    melange = function() vim.cmd [[colorscheme melange]] end,
    mellifluous = function() vim.cmd [[colorscheme mellifluous]] end,
    miasma = function() vim.cmd [[colorscheme miasma]] end,
    momiji = function() vim.cmd [[colorscheme momiji]] end,
}

local function apply_colorscheme(color)
    local colorscheme = colorschemes[color]
    if not colorscheme then
        color = "gruvbox"
        colorscheme = colorschemes[color]
    end
    colorscheme()
end

local function set_transparency(enabled)
    if enabled then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

function ColorMyPencils(color)
    apply_colorscheme(color)
    set_transparency(true)
end

ColorMyPencils("melange")
