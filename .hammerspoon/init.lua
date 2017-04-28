local function pressFn(mods, key)
  return function() hs.eventtap.keyStroke(mods, key, 0) end
end

local function remap(mods, key, pressFn)
  hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
end

local function disableAllHotkeys()
  for k, v in pairs(hs.hotkey.getHotkeys()) do
    v['_hk']:disable()
  end
end

local function enableAllHotkeys()
  for k, v in pairs(hs.hotkey.getHotkeys()) do
    v['_hk']:enable()
  end
end

local function handleGlobalAppEvent(name, event, app)
  if event == hs.application.watcher.activated then
    if name == 'iTerm2' or name == 'Code' then
      disableAllHotkeys()
    else
      enableAllHotkeys()
    end
  end
end

remap({'ctrl'}, 'j', pressFn({}, 'return'))
remap({'ctrl'}, 'y', pressFn({'cmd'}, 'v'))
remap({'ctrl'}, 'f', pressFn({}, 'right'))
remap({'ctrl'}, 'b', pressFn({}, 'left'))
remap({'ctrl'}, 'p', pressFn({}, 'up'))
remap({'ctrl'}, 'n', pressFn({}, 'down'))
remap({'ctrl'}, '[', pressFn({}, 'escape'))

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

hs.alert.show('Config loaded')
