return {
    cmd = {
        "clangd",
        "--background-index",
        "--query-driver=" .. vim.fn.exepath("clang"),
    },

    root_markers = {
        ".git",
        "compile_commands.json",
        "compile_flags.txt",
        ".c",
        ".cpp",
        ".h",
        ".hpp",
    },
}
