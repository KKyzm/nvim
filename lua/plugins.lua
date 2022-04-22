-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

    use("nvim-treesitter/playground")

	use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
	
	local servers = { 'clangd', 'ccls'}
	-- require'lspconfig'.clangd.setup {
	--     on_attach = on_attach
	-- }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end

end)
