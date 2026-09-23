return {
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                -- Options: "off", "basic", "standard", "strict"
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                    reportMissingParameterType = "warning",
                    reportMissingReturnType = "warning",
                    reportUnreachable = "warning",

                    -- Ruff handles and auto-fixes
                    reportUnusedImport = "none",
                    reportUnusedVariable = "none",
                },
            },
        },
    },
}
