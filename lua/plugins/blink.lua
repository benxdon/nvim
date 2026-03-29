return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = { preset = "default" },
      
      -- 1. DISABLE TRANSPARENCY (Fixes visual ghosting)
      completion = {
        menu = {
          border = "rounded",
          winblend = 0, -- 0 means solid background; no leftover shadows
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          },
        },

        -- 2. STOP STUCK DOCS (Huge source of ghosting)
        documentation = {
          auto_show = false, -- Only shows when you press a key, prevents stuck windows
          window = { border = "rounded", winblend = 0 },
        },

        ghost_text = { enabled = false },
        list = { selection = { preselect = true, auto_insert = true } },
      },
    },
  },
}
