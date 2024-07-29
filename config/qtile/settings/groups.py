from libqtile.config import Group, Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from settings.keys import *

groups = [
    Group("1", label="1"),
    Group("2", label="2"),
    Group("3", label="3"),
    Group("4", label="4"),
    Group("5", label="5"),
]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name)
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name)
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
