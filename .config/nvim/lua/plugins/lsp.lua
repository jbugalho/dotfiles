local home = os.getenv("HOME")
if vim.fn.has("mac") == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "linux"
else
  print("Unsupported system")
end

local function on_init(client)
  if client.config.settings then
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name

return {
    "williamboman/mason-lspconfig.nvim",
    priority = 1000,
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "pyright",
                "solargraph",
                "jdtls"
            },
        }
        require("mason-lspconfig").setup_handlers {
            function (server_name)
                require("lspconfig")[server_name].setup {}
            end,
            ["lua_ls"] = function ()
                require("lspconfig").lua_ls.setup {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            end,
            ["jdtls"] = function ()
                require("lspconfig").jdtls.setup {
                    cmd = {

                        "java",
                        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                        "-Dosgi.bundles.defaultStartLevel=4",
                        "-Declipse.product=org.eclipse.jdt.ls.core.product",
                        "-Dlog.protocol=true",
                        "-Dlog.level=ALL",
                        "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
                        "-Xms1g",
                        "--add-modules=ALL-SYSTEM",
                        "--add-opens",
                        "java.base/java.util=ALL-UNNAMED",
                        "--add-opens",
                        "java.base/java.lang=ALL-UNNAMED",

                        "-jar",
                        vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar"),
                        -- 💀
                        "-configuration",
                        home .. "/.local/share/nvim/mason/packages/jdtls/config_mac" ,
                        "-data", workspace_dir,
                    },
                }
            end
        }
    end,
}
