return {

	"junegunn/vim-easy-align",

	init = function()
		local key = require("tjex.keymap")
		key.nmap({ "ga", ":EasyAlign<cr>" })
		key.vmap({ "ga", ":EasyAlign<cr>" })
	end,
}
