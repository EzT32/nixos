local M = {}

function M.setup()
	vim.api.nvim_create_autocmd("FileType", {
		callback = function(ev)
			pcall(vim.treesitter.start, ev.buf)
			vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})
end

return M
