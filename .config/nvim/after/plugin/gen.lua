local ok, _ = pcall(require, "gen")
if not ok then
	vim.cmd(":set cmdheight=0") -- makes messages persist
	print("gen conf has a problem")
	vim.cmd(":set cmdheight=1") -- set to default
	return
end

local usr_cmd = vim.api.nvim_create_user_command

usr_cmd("GenSelectModel", require("gen").select_model, {})

require("gen").prompts = {} -- clear defaults first
local prompt = require("gen").prompts

require("gen").setup({
	model = "mixtral",
	host = "localhost",
	port = "11434",
	display_mode = "split",
	show_prompt = true,
	show_model = true,
	quit_map = "q",
	no_auto_close = true,
	init = function()
		pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
	end,
	-- Function to initialize Ollama
	command = function(options)
		return "curl --silent --no-buffer -X POST http://"
			.. options.host
			.. ":"
			.. options.port
			.. "/api/chat -d $body"
	end,
	debug = false,
})

prompt["chat"] = {
	prompt = "$input",
	replace = false,
}

-- code

prompt["explain_code"] = {
	model = "deepseek-coder:6.7b",
	prompt = "Explain how the following code works:\n\n```$filetype\n$text\n```",
	replace = false,
}

prompt["fix_code"] = {
	model = "deepseek-coder:6.7b",
	prompt = "The following code is buggy, fix it. Output ONLY the fixed code. DONOT include anything except the specific code required to fix this problem:\n\n```$filetype\n$text\n```",
	replace = true,
	extract = "```$filetype\n(.-)```",
}

prompt["optimize_code"] = {
	model = "deepseek-coder:6.7b",
	prompt = "Optimize the following code, and explain concisely why the changes were made:\n\n```$filetype\n$text\n```",
	replace = true,
	extract = "```$filetype\n(.-)```",
}

prompt["code_question"] = {
	model = "deepseek-coder:6.7b",
	prompt = "I want to ask you a question about some code. $input:\n\n```$filetype\n$text\n```",
	replace = false,
}

-- writing and general text

prompt["improve_writing"] = {
	prompt = "Improve the following text by making it clearer and easier to understand: $text",
	replace = true,
	extract = '"(.-)"',
}

prompt["explain_text"] = {
	prompt = "I'm finding it hard to understand some text. Please summarise it so I can better understand: $text",
}

prompt["summarise_text"] = {
	prompt = "Summarise the following text: $text",
}

prompt["ask_about_text"] = {
	prompt = "I have a question about some text. Answer the question concisely and DO NOT elaborate. Here is the text: $text. And my question is as follows: $input",
}
