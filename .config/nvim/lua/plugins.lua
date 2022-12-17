-- On file write, source the file and sync the packer plugins
vim.cmd([[
  augroup packer_sync
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd([[ packadd packer.nvim ]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Check if we can require packer
local ok, packer = pcall(require, "packer")

if not ok then
	error("Packer could not be required")
end

return packer.startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  -- Syntax/Formatting
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "neoclide/coc.nvim", branch = "release" }
  use {
    "prettier/vim-prettier",
    run = "yarn install --frozen-lockfile --production"
  }

  -- Navigation
  use "ggandor/leap.nvim"
  use "akinsho/toggleterm.nvim"
  use "nvim-tree/nvim-tree.lua"
  use { "nvim-telescope/telescope.nvim", tag = "0.1.0" }

  -- Editor
  use "sainnhe/everforest"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-lualine/lualine.nvim"
  use "lukas-reineke/indent-blankline.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
