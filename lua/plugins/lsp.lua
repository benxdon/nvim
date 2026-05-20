return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          on_new_config = function(config, root_dir)
            local uv_venv = root_dir .. "/.venv/bin/python"
            config.settings = config.settings or {}
            config.settings.python = config.settings.python or {}
            if vim.fn.executable(uv_venv) == 1 then
              config.settings.python.pythonPath = uv_venv
            else
              config.settings.python.pythonPath = vim.fn.expand("~/.dev/main_env/bin/python")
            end
          end,
        },
      },
    },
  },
}
