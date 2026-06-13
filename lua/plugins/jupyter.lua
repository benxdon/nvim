return {
  -- 1. Jupytext: Converts .ipynb to Python scripts on the fly so you can edit them
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    opts = {
      style = "hydrogen",
      output_extension = "auto",
      force_ft = nil,
    },
  },

  -- 2. Molten.nvim: The interactive code runner engine
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use stable releases
    build = ":UpdateRemotePlugins",
    init = function()
      -- These must be set BEFORE the plugin loads
      vim.g.molten_image_provider = "none" -- Change to "kitty" or "wezterm" if your terminal supports graphics
      vim.g.molten_output_win_max_height = 20
    end,
    keys = {
      { "<leader>mi", "<cmd>MoltenInit<cr>", desc = "Initialize Molten" },
      { "<leader>me", "<cmd>MoltenEvaluateOperator<cr>", desc = "Evaluate Operator" },
      { "<leader>ml", "<cmd>MoltenEvaluateLine<cr>", desc = "Evaluate Line" },
      { "<leader>mr", "<cmd>MoltenReevaluateCell<cr>", desc = "Re-evaluate Cell" },
      { "<leader>mx", "<cmd>MoltenDelete<cr>", desc = "Delete Cell Output" },
    },
  },
}
