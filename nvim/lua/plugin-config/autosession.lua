local opts = {
  log_level = 'info',
  auto_session_enable_last_session = true,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = false,
  auto_restore_enabled = true,
  auto_session_use_git_branch = false,
  -- the configs below are lua only
  bypass_session_save_file_types = nil
}

require('auto-session').setup(opts)
