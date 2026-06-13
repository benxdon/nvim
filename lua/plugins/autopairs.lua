return {
  { "nvim-mini/mini.pairs", enabled = false },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      npairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          python = { "string" },
          javascript = { "template_string" },
        },
        fast_wrap = {},
      })

      -- Python string-prefix triggers: typing f' / r' / b' / u' (and combos)
      -- auto-inserts the closing '. Same for ".
      local prefixes = { "f", "r", "b", "u", "rb", "br", "fr", "rf" }
      for _, p in ipairs(prefixes) do
        npairs.add_rules({
          Rule(p .. "'", "'", "python"),
          Rule(p .. '"', '"', "python"),
        })
      end
    end,
  },
}
