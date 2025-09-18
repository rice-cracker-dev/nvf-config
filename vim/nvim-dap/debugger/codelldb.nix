{pkgs, ...}: {
  vim.debugger.nvim-dap.sources.codelldb = ''
    dap.adapters.codelldb = {
      name = 'codelldb',
      type = 'executable',
      command = '${pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter}/bin/codelldb'
    }

    dap.configurations.cpp = {
      {
        type = "codelldb",
        request = "launch",
        name = "launch codelldb",
        preLaunchTask = "clang++ build (debug)",
        postDebugTask = "clang++ clean (debug)",
        expressions = "native",
        cwd = "''${workspaceFolder}",
        program = "''${fileBasenameNoExtension}"
      },
    }
  '';
}
