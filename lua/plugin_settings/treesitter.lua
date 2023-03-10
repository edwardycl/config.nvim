require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = {
    'c',
    'cpp',
    'cmake',
    'rust',
    'go',
    'javascript',
    'typescript',
    'tsx',
    'python',
    'lua',
    'html',
    'css',
    'json',
    'yaml',
    'vim',
    'help',
    'bash',
    'dockerfile',
  }
}
