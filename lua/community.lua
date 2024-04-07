-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.colorscheme.gruvbox-baby", enabled = true },
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.colorscheme.github-nvim-theme", enabled = true },
  { import = "astrocommunity.colorscheme.nord-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.everforest", enabled = true },
  { import = "astrocommunity.colorscheme.iceberg-vim", enabled = true },
  { import = "astrocommunity.note-taking.obsidian-nvim", enabled = true },
  -- import/override with your plugins folder
}
