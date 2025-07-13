--  ~/.config/wezterm

local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Gruvbox Dark (Gogh)"

	-- 字体设置
	--
	config.font = wezterm.font_with_fallback({ "CaskaydiaCove NF", "Maple Mono NF CN" })

	config.font_rules = {
		{
			intensity = "Half",
			font = wezterm.font_with_fallback({
				{ family = "CaskaydiaCove NF", italic = true },
				{ family = "Maple Mono NF CN", italic = true },
			}),
		},
	}

	config.font_size = 12.5

	config.default_prog = { "pwsh", "-NoLogo" }
	config.initial_cols = 120
	config.initial_rows = 30
	config.window_decorations = "RESIZE"
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false
	-- config.window_background_opacity = 0.5
	config.colors = {
		tab_bar = {
			background = "none",
		},
	}

	wezterm.on("update-right-status", function(window, pane)
		-- Each element holds the text for a cell in a "powerline" style << fade
		local cells = {}

		-- Figure out the cwd and host of the current pane.
		-- This will pick up the hostname for the remote host if your
		-- shell is using OSC 7 on the remote host.
		local cwd_uri = pane:get_current_working_dir()
		if cwd_uri then
			local cwd = ""
			local hostname = ""

			if type(cwd_uri) == "userdata" then
				-- Running on a newer version of wezterm and we have
				-- a URL object here, making this simple!

				cwd = cwd_uri.file_path
				hostname = cwd_uri.host or wezterm.hostname()
			else
				-- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
				-- which doesn't have the Url object
				cwd_uri = cwd_uri:sub(8)
				local slash = cwd_uri:find("/")
				if slash then
					hostname = cwd_uri:sub(1, slash - 1)
					-- and extract the cwd from the uri, decoding %-encoding
					cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
						return string.char(tonumber(hex, 16))
					end)
				end
			end

			-- Remove the domain name portion of the hostname
			local dot = hostname:find("[.]")
			if dot then
				hostname = hostname:sub(1, dot - 1)
			end
			if hostname == "" then
				hostname = wezterm.hostname()
			end

			table.insert(cells, cwd)
			table.insert(cells, hostname)
		end

		-- I like my date/time in this style: "Wed Mar 3 08:14"
		local date = wezterm.strftime("%a %b %-d %H:%M")
		table.insert(cells, date)

		-- An entry for each battery (typically 0 or 1 battery)
		for _, b in ipairs(wezterm.battery_info()) do
			table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
		end

		-- The powerline < symbol
		local LEFT_ARROW = utf8.char(0xe0b3)
		-- The filled in variant of the < symbol
		local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

		-- Color palette for the backgrounds of each cell
		local colors = {
			"#223249", -- waveBlue1 (深背景)
			"#3d4c5f", -- sumiInk4（次一级背景）
			"#5e5c64", -- fujiGray（中性灰）
			"#7e9cd8", -- lightBlue（主色调，柔和的蓝）
			"#957fb8", -- springBlue（带紫的柔和色）
		}

		-- Foreground color for the text across the fade
		local text_fg = "#c0c0c0"

		-- The elements to be formatted
		local elements = {}
		-- How many cells have been formatted
		local num_cells = 0

		-- Translate a cell into elements
		function push(text, is_last)
			local cell_no = num_cells + 1
			table.insert(elements, {
				Foreground = {
					Color = text_fg,
				},
			})
			table.insert(elements, {
				Background = {
					Color = colors[cell_no],
				},
			})
			table.insert(elements, {
				Text = " " .. text .. " ",
			})
			if not is_last then
				table.insert(elements, {
					Foreground = {
						Color = colors[cell_no + 1],
					},
				})
				table.insert(elements, {
					Text = SOLID_LEFT_ARROW,
				})
			end
			num_cells = num_cells + 1
		end

		if #cells > 0 then
			table.insert(elements, {
				Foreground = {
					Color = colors[1],
				},
			})
			table.insert(elements, {
				Text = SOLID_LEFT_ARROW,
			})
		end

		while #cells > 0 do
			local cell = table.remove(cells, 1)
			push(cell, #cells == 0)
		end

		window:set_right_status(wezterm.format(elements))
	end)
end

return module
