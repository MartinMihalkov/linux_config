return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.git' },
  -- Ruff specific: Disable hover if you prefer Pyright's hover docs
  init_options = {
    settings = {
      hover = { enabled = false },
    },
  },
}
