return {
  cmd = { 'vtsls', '--stdio' },
  filetypes = { 
    'javascript', 
    'javascriptreact', 
    'typescript', 
    'typescriptreact', 
  },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  settings = {
    -- NEW: Vue Plugin Configuration
    vtsls = {
      tsserver = {
        -- globalPlugins = {
        --   {
        --     name = '@vue/typescript-plugin',
        --     -- Path to the vue-language-server node module
        --     location = '/usr/local/lib/node_modules/@vue/language-server',
        --     languages = { 'vue' },
        --     configNamespace = 'typescript',
        --     enableForWorkspaceTypeScriptVersions = true,
        --   },
        -- },
      },
    },
    -- Existing TS/JS Settings
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      inlayHints = {
        parameterNames = { enabled = "all" },
        variableTypes = { enabled = true },
      },
    },
    javascript = { 
      updateImportsOnFileMove = { enabled = "always" },
      implicitProjectConfig = {
        checkJs = true,
        strictNullChecks = true,
        strictFunctionTypes = true,
      },
      suggestionActions = { enabled = true },
      format = { enable = true },
    },
  },
}
--
--
--
--
-- return {
--   cmd = { 'vtsls', '--stdio' },
--   filetypes = { 
--     'javascript', 
--     'javascriptreact', 
--     'typescript', 
--     'typescriptreact', 
--    'vue' 
--   },
--   -- Looks for the root of your project
--   root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
--   settings = {
--     typescript = {
--       updateImportsOnFileMove = { enabled = "always" },
--       inlayHints = {
--         parameterNames = { enabled = "all" },
--         variableTypes = { enabled = true },
--       },
--     },
--     javascript = { 
--       updateImportsOnFileMove = { enabled = "always" },
--       implicitProjectConfig = {
--         checkJs = true,
--         strictNullChecks = true,
--         strictFunctionTypes = true,
--       },
--       suggestionActions = { enabled = true },
--       format = { enable = true },
--     },
--   },
-- }
--
--
--
--
-- vim.lsp.config('vtsls', {
--   cmd = { 'vtsls', '--stdio' },
--   filetypes = { 
--     'javascript', 
--     'javascriptreact', 
--     'typescript', 
--     'typescriptreact', 
--     'vue' 
--   },
--   -- Looks for the root of your project
--   root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
--   settings = {
--     typescript = {
--       updateImportsOnFileMove = { enabled = "always" },
--       inlayHints = {
--         parameterNames = { enabled = "all" },
--         variableTypes = { enabled = true },
--       },
--     },
--     javascript = { updateImportsOnFileMove = { enabled = "always" },
--       implicitProjectConfig = {
--         checkJs = true,
--         strictNullChecks = true,
--         strictFunctionTypes = true,
--       },
--       suggestionActions = { enabled = true },
--       format = { enable = true },
--     },
--   },
-- })
--
-- -- 2. Enable it
--
-- vim.lsp.enable('vtsls')
