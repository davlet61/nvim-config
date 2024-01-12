return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.move").setup({
        keys = {
          { "<M-l>", mode = { "n", "v" } },
          { "<M-k>", mode = { "n", "v" } },
          { "<M-j>", mode = { "n", "v" } },
          { "<M-h>", mode = { "n", "v" } },
        },
      })
      require("mini.bufremove").setup({})
    end,
  },
}
