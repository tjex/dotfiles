local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/opt/homebrew/bin/fd"
local lsrc = "/Users/tjex/.local/src"
local dev = "/Users/tjex/dev"

M.toggle = function(window, pane)
	local projects = {}

	local success, stdout, stderr = wezterm.run_child_process({
		fd,
		"-HI",
		"-td",
		"--prune",
		".",
		lsrc,
		lsrc .. "/zk-org",
		dev,
		-- add more paths here
	})

	if not success then
		wezterm.log_error("Failed to run fd: " .. stderr)
		return
	end

	for line in stdout:gmatch("([^\n]*)\n?") do
		local project = line
		local label = project
		local id = project:sub(1, -2)
		id = id:gsub(".*/", "")

		-- handle git bare repositories,
		-- assuming following name convention `myproject.git`
		if string.match(project, "%.git/$") then
			-- wezterm.log_info("found .git " .. tostring(project))
			success, stdout, stderr =
				wezterm.run_child_process({ fd, "-HI", "-td", "--max-depth=1", ".", project .. "worktrees" })
			if success then
				for wt_line in stdout:gmatch("([^\n]*)\n?") do
					local wt_project = wt_line
					local wt_label = wt_project
					local wt_id = wt_project
					if string.find(wt_line, "worktrees") then
						table.insert(projects, { label = tostring(wt_label), id = tostring(wt_id) })
					end
				end
			else
				wezterm.log_error("Failed to run fd: " .. stderr)
			end
		end

		local display_label = label:gsub(os.getenv("HOME") .. "/", "")
		table.insert(projects, { label = tostring(label), id = tostring(id) })
	end

	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. label)
					win:perform_action(act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }), pane)
				end
			end),
			fuzzy = true,
			title = "Select project",
			choices = projects,
		}),
		pane
	)
end

return M
