var hotkey = ['ctrl', 'cmd'];
Key.on('q', hotkey, function () {
    App.launch('iTerm').focus();
});
Key.on('w', hotkey, function () {
    App.launch('Emacs').focus();
});
Key.on('e', hotkey, function () {
    App.launch('Google Chrome').focus();
});
Key.on('t', hotkey, function () {
    App.launch('Night Owl').focus();
});
