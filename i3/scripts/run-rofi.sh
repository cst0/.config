#!/bin/bash
# Execute rofi using my settings.
# This way, bindsym and exec don't freak out regarding the quote marks.

rofi -modi drun,run,window,ssh -show drun -display-drun "run " -display-run "run " -display-ssh "ssh " -display-window windows  -location 8 -sidebar-mode -xoffset 50

