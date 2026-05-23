return {
  cmd = { 'vue-language-server', '--stdio' },
  filetypes = { 'vue' },
  root_markers = { 'package.json', 'vite.config.ts', 'tsconfig.json', '.git' },
  init_options = {
    vue = {
      -- Hybrid mode must be true for the best performance with vtsls
      hybridMode = false,
    },
    typescript = {
      -- This needs to point to the 'lib' folder of your TypeScript installation
      -- You can usually find this by running: npm root -g
      tsdk = '/usr/local/lib/node_modules/typescript/lib',
    },
  },
}
