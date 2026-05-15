vim.opt.encoding = "utf-8"
-- vim.opt.fileencodings = {
--     "ucs-bom",
--     "utf-8",
--     "default",
--     "latin1",
-- }


vim.opt.fileformats = { "unix", "dos" }

vim.opt.fixendofline = true


-- see: https://neovim.io/doc/user/options.html#'tabstop'
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.breakindent = true


vim.opt.undodir = "."
vim.opt.undofile = true
vim.opt.undolevels = 512





vim.opt.mouse:remove("i")


vim.opt.list = true
vim.opt.listchars = {
    tab = "|-",
    trail = "-",
    nbsp = "~",

    extends = ">",
    precedes = "<",
}


vim.opt.cursorline = true
vim.opt.cursorlineopt = { "number" }
-- vim.opt.colorcolumn = { "50", "80", "100", "120" }


vim.opt.number = true
vim.opt.ruler = true

-- vim.opt.showtabline = 2
vim.opt.laststatus = 2


vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10

vim.opt.wrap = false

vim.opt.sidescroll = 10

vim.opt.whichwrap:append("<")
vim.opt.whichwrap:append(">")
vim.opt.whichwrap:append("[")
vim.opt.whichwrap:append("]")





vim.opt.termguicolors = true

---- colorscheme legacy
--vim.cmd.colorscheme("delek")

---- colorscheme bright
--vim.cmd.colorscheme("wildcharm")
--vim.opt.background = "light"

-- colorscheme light
vim.cmd.colorscheme("retrobox")
vim.opt.background = "light"

---- colorscheme dark
--vim.cmd.colorscheme("retrobox")
--vim.opt.background = "dark"

---- colorscheme dark alt
--vim.cmd.colorscheme("sorbet")

---- colorscheme contrast
--vim.cmd.colorscheme("wildcharm")
--vim.opt.background = "dark"
