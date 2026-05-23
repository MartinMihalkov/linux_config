return {
  cmd = { 'biome', 'lsp-proxy' },
  filetypes = { 
    "javascript", 
    "javascriptreact", 
    "typescript", 
    "typescriptreact", 
    "json", 
    "jsonc",
    "css" 
  },
  -- Root markers tell Biome where your project starts
  root_markers = { 'biome.json', 'biome.jsonc', 'package.json', '.git' },
  -- Optional: Settings to tell Biome to prioritize its own formatting
  settings = {
    biome = {
      rename = true,
      completion = true,
      format = { enabled = true },
      lint = { enabled = true },
    },
  },
}
