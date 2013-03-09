// hot key launch
var launch_and_focus = function (target) {
    return function (win) {
        win = win || S.window();
        var apps = [];
        S.eachApp(function (app) { apps.push(app.name()); });
        if (! _.find(apps, function (name) { return name === target; })) {
            win.doOperation(
                S.operation('shell', {
                    command: "/usr/bin/open -a " + target,
                    waithFoeExit: true
                })
            );
        }
        win.doOperation(S.operation('focus', { app: target }));
    };
};
S.bind('q:ctrl,cmd', launch_and_focus('iTerm'));
S.bind('w:ctrl,cmd', launch_and_focus('Emacs'));
S.bind('e:ctrl,cmd', launch_and_focus('Google Chrome'));
S.bind('t:ctrl,cmd', launch_and_focus('Twitter'));
