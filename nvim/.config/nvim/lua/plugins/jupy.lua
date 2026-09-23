local function jupynvim_install(ev)
    local data = ev.data

    if data.spec.name ~= "jupynvim" then
        return
    end

    if data.kind ~= "install" and data.kind ~= "update" then
        return
    end

    local install = loadfile(
        data.path .. "/lua/jupynvim/install.lua"
    )()

    install.run({
        dir = data.path,
    })
end

vim.api.nvim_create_autocmd("PackChanged", {
    callback = jupynvim_install,
})

vim.pack.add({
    {
        src = "https://github.com/sheng-tse/jupynvim",
    },
})

require("jupynvim").setup({
    log_level = "info",
    image_renderer = "placeholder",
})
