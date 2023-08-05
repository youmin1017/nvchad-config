local setup = function(_, opts)
  local on_attach = require("plugins.configs.lspconfig").on_attach
  local capabilities = require("plugins.configs.lspconfig").capabilities

  local lspconfig = require "lspconfig"

  -- List of servers to install
  local servers = { "html", "cssls", "tsserver", "clangd" }

  require("mason").setup(opts)

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }

  -- This will setup lsp for servers you listed above
  -- And servers you install through mason UI
  -- So defining servers in the list above is optional
  require("mason-lspconfig").setup_handlers {
    -- Default setup for all servers, unless a custom one is defined below
    function(server_name)
      lspconfig[server_name].setup {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          -- Add your other things here
          -- Example being format on save or something
        end,
        capabilities = capabilities,
      }
    end,
    -- custom setup for a server goes after the function above
    -- Example, override rust_analyzer
    -- ["rust_analyzer"] = function ()
    --   require("rust-tools").setup {}
    -- end,
    -- Another example with clangd
    -- Users usually run into different offset_encodings issue,
    -- so this is how to bypass it (kindof)
    ["clangd"] = function()
      lspconfig.clangd.setup {
        cmd = {
          "clangd",
          "--offset-encoding=utf-16", -- To match null-ls
          --  With this, you can configure server with
          --    - .clangd files
          --    - global clangd/config.yaml files
          --  Read the `--enable-config` option in `clangd --help` for more information
          "--enable-config",
        },
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
      }
    end,

    -- ["rust_analyzer"] = function()
    --   local rt = require "rust-tools"
    --   local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/"
    --   local codelldb_path = extension_path .. "adapter/codelldb"
    --   local liblldb_path = extension_path .. "lldb/lib/liblldb"
    --   local this_os = vim.loop.os_uname().sysname
    --
    --   -- -- The path in windows is different
    --   -- if this_os:find "Windows" then
    --   --   codelldb_path = package_path .. "adapter\\codelldb.exe"
    --   --   liblldb_path = package_path .. "lldb\\bin\\liblldb.dll"
    --   -- else
    --
    --   -- The liblldb extension is .so for linux and .dylib for macOS
    --   liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
    --
    --   -- end
    --   rt.setup {
    --     server = {
    --       on_attach = function(client, bufnr)
    --         vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
    --         vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
    --         vim.keymap.set("n", "<leader>q", function()
    --           vim.diagnostic.open_float { border = "rounded" }
    --         end, { buffer = bufnr })
    --       end,
    --       capabilities = capabilities,
    --     },
    --     dap = {
    --       adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    --     },
    --   }
    -- end,

    -- Example: disable auto configuring an LSP
    -- Here, we disable lua_ls so we can use NvChad's default config
    ["lua_ls"] = function() end,
  }
end

---@type NvPluginSpec
local spec = {
  "neovim/nvim-lspconfig",
  -- BufRead is to make sure if you do nvim some_file then this is still going to be loaded
  event = { "VeryLazy", "BufRead" },
  config = function() end, -- Override to make sure load order is correct
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = function(plugin, opts)
        setup(plugin, opts)
      end,
    },
    "williamboman/mason-lspconfig",
    -- TODO: Add mason-null-ls? mason-dap?
  },
}

return spec
