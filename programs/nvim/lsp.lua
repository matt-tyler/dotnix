
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local null_ls = require('null-ls')

require('Comment').setup {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local call_all = function(...)
  print("call all called")
  local args = {...}
  return function(client, bufnr)
    print("call all called from on_attach")
    for i, fn in ipairs(args) do
       fn(client, bufnr)
    end
  end 
end

local common_on_attach = function(client, bufnr)
  print("common_on_attach called")
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { buffer = 0 })
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { buffer = 0 })
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { buffer = 0 })
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { buffer = 0 })

  -- :wa = write all may be needed
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = 0 })

  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_next, { buffer = 0})
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0})

  -- ctrl+q to jump to quickfix
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", { buffer = 0})

  vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { buffer = 0 })

  -- common debugging keys
  vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { buffer = 0})
  vim.keymap.set("n", "<F8>", ":lua require'dap'.step_over()<CR>", { buffer = 0 })
  vim.keymap.set("n", "<F9>", ":lua require'dap'.step_into()<CR>", { buffer = 0 })
  vim.keymap.set("n", "<F10>", ":lua require'dap'.step_out()<CR>", { buffer = 0})
  vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { buffer = 0 })
  vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { buffer = 0})
  vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { buffer = 0})
  vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { buffer = 0 })
end

local go_attach = function() 
  call_all(common_on_attach)

  -- debug go tests
  vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
end

lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  capabilities = capabilities,
  on_attach = go_attach,
}

lspconfig.golangci_lint_ls.setup {
  capabilities = capabilities,
  on_attach = go_attach,
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
}

lspconfig.pyright.setup {
  capabilities = capabilites,
  on_attach = on_attach
}

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8
  }
}

require'lspconfig'.tsserver.setup{}


vim.filetype.add({
  extension = {
    astro = "astro"
  }
})

require'lspconfig'.astro.setup{}

local rt = require("rust-tools")

local mason_registry = require('mason-registry')
local codelldb = mason_registry.get_package("codelldb")
codelldb:get_install_path()

-- local extension_path = os.getenv("HOME") .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.1"
-- local codelldb_path = extension_path .. "/adapter/codelldb"
-- local liblldb_path = extension_path .. "/lldb/lib/liblldb.so"

local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local rt_attach = function(client, bufnr)
  print("rust attached called")
  vim.keymap.set("n", "<leader>h", rt.hover_actions.hover_actions, { buffer = 0 })
  vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = 0 })
end

rt.setup({
  tools = {
    inlay_hints = {
      auto = true,
      only_current_line = true,
      show_parameter_hints = true
    },
  },
  server = {
    on_attach = call_all(common_on_attach, rt_attach)
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb_path,
      liblldb_path
    ),
  },
});
