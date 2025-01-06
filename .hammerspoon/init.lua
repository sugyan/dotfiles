-- KeyRepeat:
-- $ defaults write -globalDomain KeyRepeat -int 1
-- $ defaults write -globalDomain InitialKeyRepeat -int 10
-- $ reboot


-- Launcher Shortcut:

local function launcher(mods, key, appname)
  hs.hotkey.bind(mods, key, function()
    hs.application.launchOrFocus('/Applications/' .. appname .. '.app')
  end)
end

launcher({'cmd', 'ctrl'}, 'q', 'WezTerm')
launcher({'cmd', 'ctrl'}, 'w', 'Visual Studio Code')
launcher({'cmd', 'ctrl'}, 'e', 'Google Chrome')
launcher({'cmd', 'ctrl'}, 's', 'Slack')
launcher({'cmd', 'ctrl'}, 'd', 'Discord')
launcher({'cmd', 'ctrl'}, 'o', 'Obsidian')


-- KeyBind:

local function keyStroke(mods, key)
  return function() hs.eventtap.keyStroke(mods, key, 0) end
end

local function remap(mods, key, fn)
  return hs.hotkey.bind(mods, key, fn, nil, fn)
end

remap({'ctrl'}, 'h', keyStroke({}, 'delete'))
remap({'ctrl'}, '[', keyStroke({}, 'escape'))
remap({'ctrl'}, 'j', keyStroke({}, 'return'))
remap({'ctrl', 'cmd'}, 'j', keyStroke({'cmd'}, 'return'))

hs.hotkey.bind({'ctrl'}, 'm', function()
  if hs.keycodes.currentMethod():find('AquaSKK') then
    hs.eventtap.keyStroke({'shift', 'ctrl'}, 'j', 0)
  end
end)


-- Config watcher:

configWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', hs.reload):start()
hs.notify.new({title="Hammerspoon", informativeText='Config loaded'}):send()
