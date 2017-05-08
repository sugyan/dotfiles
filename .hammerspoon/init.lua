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
launcher({'cmd', 'ctrl'}, 'q', 'iTerm')
launcher({'cmd', 'ctrl'}, 'w', 'Visual Studio Code')
launcher({'cmd', 'ctrl'}, 'e', 'Google Chrome')
launcher({'cmd', 'ctrl'}, 't', 'Twitter')
launcher({'cmd', 'ctrl'}, 's', 'Slack')
launcher({'cmd', 'ctrl'}, 'l', 'LINE')
launcher({'cmd', 'ctrl'}, 'c', 'HipChat')


-- KeyBind:

local function keyStroke(mods, key)
  return function() hs.eventtap.keyStroke(mods, key, 0) end
end

local function remap(mods, key, fn)
  return hs.hotkey.bind(mods, key, fn, nil, fn)
end

-- global
remap({'ctrl'}, 'j', keyStroke({}, 'return'))
remap({'ctrl'}, '[', keyStroke({}, 'escape'))

-- disable when a specific application is active
local remapKeys = {
  remap({'ctrl'}, 'b', keyStroke({}, 'left')),
  remap({'ctrl'}, 'f', keyStroke({}, 'right')),
  remap({'ctrl'}, 'n', keyStroke({}, 'down')),
  remap({'ctrl'}, 'p', keyStroke({}, 'up')),
  remap({'ctrl'}, 'y', keyStroke({'cmd'}, 'v'))
}

local function handleGlobalAppEvent(name, event, app)
  if event == hs.application.watcher.activated then
    if name == 'iTerm2' or name == 'Code' then
      for i, key in ipairs(remapKeys) do
        key:disable()
      end
    else
      for i, key in ipairs(remapKeys) do
        key:enable()
      end
    end
  end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()


-- SKK
local sticky_shift = false
local targets = {}
for i = 96, 122 do
  targets[hs.keycodes.map[string.char(i)]] = true
end

hs.hotkey.bind({}, ';', function()
  if hs.keycodes.currentMethod():find('AquaSKK') then
    sticky_shift = true
  else
    hs.eventtap.keyStrokes(';')
  end
end)

hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
  if sticky_shift and targets[event:getKeyCode()] then
    event:setFlags({shift = true})
  end
  sticky_shift = false
end):start()

hs.hotkey.bind({'ctrl'}, 'm', function()
  if hs.keycodes.currentMethod():find('AquaSKK') then
    hs.eventtap.keyStroke({'shift', 'ctrl'}, 'j', 0)
  end
end)


-- Config watcher:

local configWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', hs.reload):start()
hs.notify.new({title="Hammerspoon", informativeText='Config loaded'}):send()
