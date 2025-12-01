
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    -- These are the core parsers LazyVim expects to exist
    ensure_installed = {
      "bash",
      "lua",
      "vim",
      "vimdoc",
      "regex",
      "markdown",
      "markdown_inline",
      "json",
      "yaml",
      "toml",
      "javascript",
      "typescript",
      "dockerfile",
    },

    highlight = {
      enable = true,
    },

    indent = {
      enable = true,
    },
  },
}
