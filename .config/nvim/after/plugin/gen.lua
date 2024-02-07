local ok, _ = pcall(require, "gen")
if not ok then
	print("gen conf has a problem")
	return
end

local prompt = require("gen").prompts

require("gen").setup({
	model = "mixtral", -- The default model to use.
	display_mode = "split", -- The display mode. Can be "float" or "split".
	show_prompt = false, -- Shows the Prompt submitted to Ollama.
	show_model = true, -- Displays which model you are using at the beginning of your chat session.
	no_auto_close = true, -- Never closes the window automatically.
	load_default_prompts = false,
	init = function()
		pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
	end,
	-- Function to initialize Ollama
	command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
	-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
	-- This can also be a lua function returning a command string, with options as the input parameter.
	-- The executed command must return a JSON object with { response, context }
	-- (context property is optional).

	debug = false, -- Prints errors and the command which is run.
	user_prompts = {
		["Test_prompt"] = {
			prompt = "tell me something interesting",
			replace = false,
			model = "codellama",
		},
	},
})

