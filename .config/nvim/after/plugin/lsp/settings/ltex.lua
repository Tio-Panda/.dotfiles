--TODO: Para mejorarlo podriamos usar https://dacbreakpoint.com/post/2022-05-private-languagetool-server/ para crear nuestro
--propio server y usar LanguageTool premium por ejemplo.
return {
    filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
    settings = {
        ltex = {
            enabled = { "latex", "tex", "bib", "markdown", },
            language = "es",
            diagnosticSeverity = "information",
            sentenceCacheSize = 3000,
            additionalRules = {
                es = { "SPANISH_WORD_REPEAT_BEGINNING_RULE" },
                lenguageModel = "~./.ngrams/es",
                enablePickyRules = true,
                -- motherTongue = "es",
            },
            disabledRules = {
                es = { "MORFOLOGIK_RULE_ES" },
                en_US = { "MORFOLOGIK_RULE_EN_US" },
            },
            dictionary = (function()
                -- For dictionary, search for files in the runtime to have
                -- and include them as externals the format for them is
                -- dict/{LANG}.txt
                --
                -- Also add dict/default.txt to all of them
                local files = {}
                for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
                    local lang = vim.fn.fnamemodify(file, ":t:r")
                    local fullpath = vim.fs.normalize(file, ":p")
                    files[lang] = { ":" .. fullpath }
                end

                if files.default then
                    for lang, _ in pairs(files) do
                        if lang ~= "default" then
                            vim.list_extend(files[lang], files.default)
                        end
                    end
                    files.default = nil
                end
                return files
            end)(),
        },
    },
}
