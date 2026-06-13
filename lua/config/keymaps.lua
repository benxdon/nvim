local map = vim.keymap.set

map("n", "<leader>mp", function()
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r") .. ".pdf"
  vim.cmd("silent write")

  local cmd = string.format("pandoc %s -o %s --pdf-engine=typst", file, output)
  vim.fn.jobstart(cmd, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("PDF Generated!", "info")
        vim.fn.jobstart(string.format("zathura %s", output))
      else
        vim.notify("Pandoc Failed", "error")
      end
    end,
  })
end, { desc = "Markdown to PDF (Pandoc/Typst)" })

-- Keep cursor centered on half-page jumps and search hops
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up (centered)" })
map("n", "n", "nzzzv", { desc = "Next search (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search (centered)" })
