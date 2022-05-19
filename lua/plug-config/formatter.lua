local formatter_status_ok, formatter = pcall(require, "formatter")
if not formatter_status_ok then
  return
end

local util_status_ok, util = pcall(require, "formatter.util")
if not util_status_ok then
  return
end

-- Provides the Format and FormatWrite commands
formatter.setup {
  -- All formatter configurations are opt-in
  filetype = {
    lua = {
      -- Pick from defaults:
      require('formatter.filetypes.lua').stylua,

      -- ,or define your own:
      function()
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    }
  }
}
