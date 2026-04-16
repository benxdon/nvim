return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      vim.keymap.set("n", "<leader>mp", function()
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
    end,
  },
}
