var keys = [];

var hotkey = ['ctrl', 'cmd'];
keys.push(Phoenix.bind('q', hotkey, function() { App.launch('iTerm').focus();     }));
keys.push(Phoenix.bind('w', hotkey, function() { App.launch('Emacs').focus();     }));
keys.push(Phoenix.bind('e', hotkey, function() { App.launch('Vivaldi').focus();   }));
keys.push(Phoenix.bind('t', hotkey, function() { App.launch('Night Owl').focus(); }));
