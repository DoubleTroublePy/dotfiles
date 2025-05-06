local vim = vim
local Plug = vim.fn['plug#']

vim.cmd([[
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive  
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
"set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

set signcolumn=yes          " always show the column with status symbols
nmap m :NERDTreeToggle<CR>  " open NERDTree with the m key
let NERDTreeQuitOnOpen=1    " when opening a file close NERDTree

nmap s :set spell!<cr>      " turn on and off spell checking
nnoremap <silent> <esc> :noh<cr><esc>

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
]])

vim.opt.wrap=true
vim.opt.mouse = ""

vim.call('plug#begin')
Plug('ellisonleao/gruvbox.nvim')
Plug('scrooloose/nerdtree')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('saadparwaiz1/cmp_luasnip')
Plug('L3MON4D3/LuaSnip')
Plug('folke/which-key.nvim')
vim.call('plug#end')

vim.cmd('set background=dark')
vim.cmd('colorscheme gruvbox')

local lspconfig = require('lspconfig')
--lspconfig.pyright.setup {}
--lspconfig.lua_ls.setup {}
--lspconfig.rust_analyzer.setup {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local luasnip = require 'luasnip'
vim.lsp.enable 'bashls'

local servers = {
  "lua_ls",
  "pyright",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        {name = "buffer"},
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      }),
}

