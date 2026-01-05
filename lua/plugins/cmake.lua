return {
  "Civitasv/cmake-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>lcp", "<cmd>CMakeSelectConfigurePreset<cr>", desc = "CMake: Select Configure Preset" },
    { "<leader>lcP", "<cmd>CMakeSelectBuildPreset<cr>", desc = "CMake: Select Build Preset" },
    { "<leader>lcg", "<cmd>CMakeGenerate<cr>", desc = "CMake: Generate" },
    { "<leader>lcb", "<cmd>CMakeBuild<cr>", desc = "CMake: Build" },
  },
  opts = {
    cmake_command = "cmake",
    ctest_command = "ctest",

    cmake_use_preset = true,

    cmake_regenerate_on_save = true,
    cmake_generate_options = {},
    cmake_build_options = {},

    cmake_build_directory = nil,

    cmake_compile_commands_options = { action = "soft_link", target = vim.loop.cwd() },
  },
}

