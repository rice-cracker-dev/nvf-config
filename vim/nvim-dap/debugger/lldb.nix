{pkgs, ...}: {
  vim.debugger.nvim-dap.sources.lldb = ''
    dap.adapters.lldb = {
      type = 'executable',
      command = '${pkgs.lldb}/bin/lldb-dap',
      name = 'lldb'
    }

    dap.configurations.cpp = {
      {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "''${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    dap.configurations.c = dap.configurations.cpp
  '';
}
