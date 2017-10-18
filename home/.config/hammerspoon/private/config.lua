-- Specify Spoons which will be loaded
hspoon_list = {
    "AClock",
    "BingDaily",
    -- "Calendar",
    "CircleClock",
    "ClipShow",
    "CountDown",
    "FnMate",
    "HCalendar",
 --   "HSaria2",
    "HSearch",
    -- "KSheet",
    "SpeedMenu",
    -- "TimeFlow",
    -- "UnsplashZ",
    "WinWin",
}

-- appM environment keybindings. Bundle `id` is prefered, but application `name` will be ok.
hsapp_list = {
    {key = 'c', id = 'com.google.Chrome'},
    {key = 'f', name = 'Finder'},
    {key = 'g', name = 'Gitter'},
    {key = 'i', name = 'IntelliJ IDEA'},
    {key = 'l', name = 'Sublime Text'},
    {key = 'm', name = 'Wavebox'},
--    {key = 'p', name = 'mpv'},
    {key = 's', name = 'Spotify'},
    {key = 't', name = 'iTerm'},
    {key = 'v', id = 'com.apple.ActivityMonitor'},
    {key = 'w', name = 'Wunderlist'},
    {key = 'y', id = 'com.apple.systempreferences'},
}

-- Modal supervisor keybinding, which can be used to temporarily disable ALL modal environments.
hsupervisor_keys = {{"cmd", "shift", "ctrl"}, "Q"}

-- Reload Hammerspoon configuration
hsreload_keys = {{"cmd", "shift", "ctrl"}, "R"}

-- Toggle help panel of this configuration.
hshelp_keys = {{"alt", "shift"}, "/"}

-- aria2 RPC host address
hsaria2_host = "http://localhost:6800/jsonrpc"
-- aria2 RPC host secret
hsaria2_secret = "token"

----------------------------------------------------------------------------------------------------
-- Those keybindings below could be disabled by setting to {"", ""} or {{}, ""}

-- Window hints keybinding: Focuse to any window you want
hswhints_keys = {{"alt","shift"}, "tab"}

-- appM environment keybinding: Application Launcher
hsappM_keys = {"alt", "A"}

-- clipshowM environment keybinding: System clipboard reader
hsclipsM_keys = {"alt", "C"}

-- Toggle the display of aria2 frontend
hsaria2_keys = {"alt", "D"}

-- Launch Hammerspoon Search
hsearch_keys = {"alt", "G"}

-- Read Hammerspoon and Spoons API manual in default browser
hsman_keys = {"alt", "H"}

-- countdownM environment keybinding: Visual countdown
hscountdM_keys = {"alt", "I"}

-- Lock computer's screen
hslock_keys = {"alt", "L"}

-- resizeM environment keybinding: Windows manipulation
hsresizeM_keys = {"alt", "R"}

-- cheatsheetM environment keybinding: Cheatsheet copycat
hscheats_keys = {"alt", "S"}

-- Show digital clock above all windows
hsaclock_keys = {"alt", "T"}

-- Type the URL and title of the frontmost web page open in Google Chrome or Safari.
hstype_keys = {"alt", "V"}

-- Toggle Hammerspoon console
hsconsole_keys = {"alt", "Z"}
-- Remap media keys to Spotify-priority equivalents
hs.hotkey.bind({"ctrl"}, "f7", function()
	hs.spotify.previous()
	hs.spotify.displayCurrentTrack()
end)

hs.hotkey.bind({"ctrl"}, "f8", function()
	hs.spotify.playpause()
end)

hs.hotkey.bind({"ctrl"}, "f9", function()
	hs.spotify.next()
	hs.spotify.displayCurrentTrack()
end)

hs.hotkey.bind({"ctrl"}, "f11", function()
	playing = hs.spotify.isPlaying()

	if playing then
		hs.spotify.volumeDown()
	else
		output = hs.audiodevice.defaultOutputDevice()
		output:setVolume(output:volume() - 10)
	end
end)

hs.hotkey.bind({"ctrl"}, "f12", function()
	playing = hs.spotify.isPlaying()

	if playing then
		hs.spotify.volumeUp()
	else
		output = hs.audiodevice.defaultOutputDevice()
		output:setVolume(output:volume() + 10)
	end
end)
