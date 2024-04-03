return {
	"lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        require("ibl").setup({
            indent = { char = "▏" , smart_indent_cap = true },
            whitespace = { remove_blankline_trail = false },
            scope = { enabled = false, }
        })
    end,
}
