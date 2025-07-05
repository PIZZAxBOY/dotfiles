mp.msg.info("AutoProfile script initialized")

local function is_youtube(url)
	if not url then
		return false
	end

	-- 支持多种 YouTube URL 格式
	local patterns = {
		"youtube%.com",
		"youtu%.be",
	}

	for _, pattern in ipairs(patterns) do
		if url:match(pattern) then
			mp.msg.info("Matched YouTube pattern: " .. pattern)
			return true
		end
	end

	return false
end

mp.register_event("start-file", function()
	local path = mp.get_property("path")
	mp.msg.info("File detected: " .. (path or "nil"))

	if is_youtube(path) then
		mp.msg.info("Applying ytb profile")
		mp.command("apply-profile ytb")
	else
		mp.msg.info("Not a YouTube URL, skipping profile")
	end
end)
