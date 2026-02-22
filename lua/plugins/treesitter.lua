return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local TS = require("nvim-treesitter")

		local ensure_installed = {
			"bash",
			"c",
			"cpp",
			"c_sharp",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"vim",
			"vimdoc",
		}

		-- Install missing parsers
		local installed = TS.get_installed()
		local to_install = vim.tbl_filter(function(lang)
			return not vim.tbl_contains(installed, lang)
		end, ensure_installed)
		if #to_install > 0 then
			TS.install(to_install, { summary = true })
		end

		-- Auto-install & enable highlighting on FileType
		local available = TS.get_available()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match)
				if not lang then
					return
				end

				-- Auto-install missing parser if available
				if not vim.tbl_contains(TS.get_installed(), lang) then
					if vim.tbl_contains(available, lang) then
						TS.install({ lang })
					end
					return
				end

				pcall(vim.treesitter.start, ev.buf)
			end,
		})
	end,
}
