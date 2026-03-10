-- Check for remote nvim config updates on startup
vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Notify if nvim config has upstream changes to pull",
	group = vim.api.nvim_create_augroup("nvim-config-update-check", { clear = true }),
	once = true,
	callback = function()
		local config_dir = vim.fn.stdpath("config")
		vim.system(
			{ "git", "-C", config_dir, "fetch" },
			{ detach = false },
			function(fetch_result)
				if fetch_result.code ~= 0 then
					return
				end
				vim.system(
					{ "git", "-C", config_dir, "rev-list", "--count", "HEAD..@{u}" },
					{ detach = false },
					function(result)
						if result.code ~= 0 then
							return
						end
						local count = tonumber(vim.trim(result.stdout) or "0") or 0
						if count > 0 then
							vim.schedule(function()
								vim.notify(
									string.format(
										"Nvim config: %d new commit%s available. Run :!git -C %s pull to update.",
										count,
										count == 1 and "" or "s",
										config_dir
									),
									vim.log.levels.INFO,
									{ title = "Config Update" }
								)
							end)
						end
					end
				)
			end
		)
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
