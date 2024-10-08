return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  opts = {
    use_diagnostic_signs = true,
    include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" },
    format = function(diagnostic)
      local message = diagnostic.message
      if diagnostic.source then
        message = string.format("[%s] %s", diagnostic.source, message)
      end
      return message
    end,
  },
}
