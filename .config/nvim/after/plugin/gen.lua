local ok, _ = pcall(require, "gen")
if not ok then
	print("gen conf has a problem")
	return
end

require("gen").prompts = {}
local prompt = require("gen").prompts

require("gen").setup({
	model = "mixtral", -- The default model to use.
	host = "localhost", -- The host running the Ollama service.
	port = "11434", -- The port on which the Ollama service is listening.
	display_mode = "split", -- The display mode. Can be "float" or "split".
	show_prompt = true, -- Shows the Prompt submitted to Ollama.
	show_model = true, -- Displays which model you are using at the beginning of your chat session.
	quit_map = "q", -- set keymap for quit
	no_auto_close = true, -- Never closes the window automatically.
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
	debug = true, -- Prints errors and the command which is run.
})

prompt["explain_code"] = {
	prompt = "Explain how the following code works, then give some examples of what problems the code could help solve. \nHere is the code:\n\n```\n$text\n```",
	replace = false,
}

prompt["optimize_code"] = {
	prompt = "Optimize the following code, and explain concisely why the changes were made:\n ```$filetype\n$text\n```",
	replace = true,
    extract = "```$filetype\n(.-)```",
}

prompt["improve_writing"] = {
	prompt = "Improve the following text by making it clearer and easier to understand: $text",
	replace = true,
}

prompt["ask"] = {
	prompt = "$input",
	replace = false,
}


