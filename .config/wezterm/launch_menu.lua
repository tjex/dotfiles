local module = {}

function module.apply(config)
	config.launch_menu = {
		{
			args = { "top" },
		},
		{
			-- Optional label to show in the launcher. If omitted, a label
			-- is derived from the `args`
			label = "Bash",
			-- The argument array to spawn.  If omitted the default program
			-- will be used as described in the documentation above
			args = { "bash", "-l" },

			-- You can specify an alternative current working directory;
			-- if you don't specify one then a default based on the OSC 7
			-- escape sequence will be used (see the Shell Integration
			-- docs), falling back to the home directory.
			-- cwd = "/some/path"

			-- You can override environment variables just for this command
			-- by setting this here.  It has the same semantics as the main
			-- set_environment_variables configuration option described above
			-- set_environment_variables = { FOO = "bar" },
		},
	}
end
return module
