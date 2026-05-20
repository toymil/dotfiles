-- internal encoding
vim.opt.encoding = "utf-8"
-- file encoding try list
vim.opt.fileencodings = {
    "ucs-bom",
    "utf-8",
    "prc",
    "taiwan",
    "japan",
    "korea",
    "latin1",
}

-- auto reload on external change
vim.opt.autoread = true

-- end of line/file
vim.opt.fileformats = { "unix", "dos" }
vim.opt.fixendofline = true

-- indentation
vim.opt.tabstop = 8
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
--
vim.opt.autoindent = true
vim.opt.smarttab = false
--
vim.opt.breakindent = true

-- persistent undo history
vim.opt.undodir = "."
vim.opt.undofile = true
vim.opt.undolevels = 512


-- space visibility
vim.opt.list = true
vim.opt.listchars = {
    tab = "|-",
    trail = "-",
    nbsp = "~",
    precedes = "<",
    extends = ">",
}

-- highlight search match
vim.opt.hlsearch = true
-- search when typing
vim.opt.incsearch = true

-- always show status line
vim.opt.laststatus = 2

-- gutter line number
vim.opt.number = true
-- cursor position in status line
vim.opt.ruler = true
-- column wrap guides
vim.opt.colorcolumn = { 81, 101, 121 }

-- cursor line highlight
vim.opt.cursorline = true
vim.opt.cursorlineopt = { "screenline", "number" }

-- cursor to edge
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 9
vim.opt.scrolljump = 1
vim.opt.sidescroll = 1

-- for some commands, move the cursor to the first non-blank of the line
vim.opt.startofline = true

-- mouse
vim.opt.mouse = "nv"
vim.opt.mousemodel = "extend"


-- no soft wrap by default
vim.opt.wrap = false
-- wrap at word boundary
vim.opt.linebreak = true
-- no hard wrap
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

-- keys to move over line boundary
vim.opt.whichwrap = "b,s,<,>,[,]"


-- file type detection and syntax highlight
--vim.opt.t_Co = 256
vim.opt.termguicolors = true
vim.cmd.filetype({ "plugin", "indent", "on" })
vim.cmd.syntax("enable")


---- colorscheme legacy
--vim.cmd.colorscheme("delek")

---- colorscheme bright
--vim.opt.background = "light"
--vim.cmd.colorscheme("wildcharm")

-- colorscheme light
vim.opt.background = "light"
vim.cmd.colorscheme("retrobox")

---- colorscheme dark
--vim.opt.background = "dark"
--vim.cmd.colorscheme("retrobox")

---- colorscheme dark alt
--vim.cmd.colorscheme("sorbet")

---- colorscheme contrast
--vim.opt.background = "dark"
--vim.cmd.colorscheme("wildcharm")
