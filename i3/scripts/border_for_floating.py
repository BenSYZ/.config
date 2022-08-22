#!/usr/bin/env python3

import i3ipc

i3 = i3ipc.Connection()

def border_on_floating(self, e):
    #ws = self.get_tree().find_focused().workspace()
    #print('dir e.container.floating'+str(dir(e.container.floating)))
    #print('e.container.floating'+str(e.container.floating))
    if (e.container.floating=='user_off'):
        e.container.command('border none')
    elif (e.container.floating=='user_on'):
        e.container.command('border normal')

i3.on('window::floating', border_on_floating)

i3.main()
