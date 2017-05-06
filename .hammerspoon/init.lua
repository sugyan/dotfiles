-- KeyRepeat:
-- $ defaults write -globalDomain KeyRepeat -int 1
-- $ defaults write -globalDomain InitialKeyRepeat -int 10
-- $ reboot

local log = hs.logger.new('init','debug')

local function keyStroke(mods, key)
  return function() hs.eventtap.keyStroke(mods, key, 0) end
end

local function remap(mods, key, fn)
  return hs.hotkey.bind(mods, key, fn, nil, fn)
end

remap({'ctrl'}, 'b', keyStroke({}, 'left'))
remap({'ctrl'}, 'f', keyStroke({}, 'right'))
remap({'ctrl'}, 'n', keyStroke({}, 'down'))
remap({'ctrl'}, 'p', keyStroke({}, 'up'))

remap({'ctrl'}, 'j', keyStroke({}, 'return'))
remap({'ctrl'}, '[', keyStroke({}, 'escape'))

keys = {
  remap({'ctrl'}, 'y', keyStroke({'cmd'}, 'v'))
}

local function disableHotkeys()
  for i, key in ipairs(keys) do
    key:disable()
  end
end

local function enableHotkeys()
  for i, key in ipairs(keys) do
    key:enable()
  end
end

local function handleGlobalAppEvent(name, event, app)
  if event == hs.application.watcher.activated then
    if name == 'iTerm2' or name == 'Code' then
      disableHotkeys()
    else
      enableHotkeys()
    end
  end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

local configWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', hs.reload):start()
hs.notify.new({title="Hammerspoon", informativeText='Config loaded'}):send()
