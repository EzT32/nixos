local M = {}

function M.setup()
	local indent_settings = {
		lua = 2,
		nix = 2,
		python = 4,
		c = 2,
	}

	for ft, size in pairs(indent_settings) do
		vim.api.nvim_create_autocmd("FileType", {
			pattern = ft,
			callback = function()
				vim.opt_local.tabstop = size
				vim.opt_local.shiftwidth = size
				vim.opt_local.softtabstop = size
			end,
		})
	end

	vim.api.nvim_create_autocmd("CursorHold", {
		callback = function()
			-- Only open diagnostics if no floating window exists
			local float_exists = false
			for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
				if vim.api.nvim_win_get_config(win).relative ~= "" then
					float_exists = true
					break
				end
			end
			if not float_exists then
				vim.diagnostic.open_float(nil, {
					focusable = false,
					border = "rounded",
					scope = "cursor",
				})
			end
		end,
	})
end

return M
