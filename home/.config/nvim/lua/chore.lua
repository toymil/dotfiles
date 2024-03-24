-- remove the "How-to disable mouse" menu item
-- and the separator above it
-- see: https://neovim.io/doc/user/vim_diff.html#_default-mouse
vim.cmd.aunmenu("PopUp.How-to\\ disable\\ mouse")
vim.cmd.aunmenu("PopUp.-1-")
