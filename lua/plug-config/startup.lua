local startup_status_ok, startup = pcall(require, "startup")
if not startup_status_ok then
  return
end

startup.setup {
  theme = "startify"
}
