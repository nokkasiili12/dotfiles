return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local wal = vim.fn.expand("~/.cache/wal/colors.json")
        if vim.fn.filereadable(wal) == 1 then
          local f = io.open(wal, "r")
          local colors = vim.fn.json_decode(f:read("*a"))
          f:close()

          local c = colors.colors

          vim.cmd("highlight clear")
          vim.cmd("set termguicolors")

          -- Basic highlights
          vim.api.nvim_set_hl(0, "Normal", { fg = c.color7, bg = c.color0 })
          vim.api.nvim_set_hl(0, "Comment", { fg = c.color8, italic = true })
          vim.api.nvim_set_hl(0, "String", { fg = c.color2 })
          vim.api.nvim_set_hl(0, "Function", { fg = c.color4 })
          vim.api.nvim_set_hl(0, "Keyword", { fg = c.color1 })
          vim.api.nvim_set_hl(0, "Identifier", { fg = c.color6 })
          vim.api.nvim_set_hl(0, "Type", { fg = c.color3 })
          vim.api.nvim_set_hl(0, "Constant", { fg = c.color5 })
        end
      end,
    },
  },
}
