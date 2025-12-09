Install the STALKER Neovim colorscheme

Copy the `stalker.vim` file into your Neovim colors folder:

mkdir -p ~/.config/nvim/colors
cp colors/stalker.vim ~/.config/nvim/colors/

Then in your `init.vim` add:

colorscheme stalker

If using `init.lua`, add:

vim.cmd('colorscheme stalker')

Optional: add plugin highlight tweaks (treesitter, lsp) following the file comments.
