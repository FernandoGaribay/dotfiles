from libqtile import layout
from libqtile.config import Match

from settings.variables import *

layout_conf_screen1 = {
    "border_focus": colorFecha,
    "border_width": 0,
    "margin": 8,
    "margin_on_single": True,
}

layout_conf_screen2 = {
    "border_focus": colorLayout,
    "border_width": 2,
    "margin": 30,
    "margin_on_single": True,
}

layouts = [
    layout.MonadTall(**layout_conf_screen1),
    layout.Bsp(**layout_conf_screen1),
    layout.Max(margin=[0, 10, 5, 10]),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    # layout.Columns(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

layouts_second_screen = [
    layout.MonadTall(**layout_conf_screen2),
    layout.Max(),
]

floating_layout = layout.Floating(
    border_width=0,  # Eliminar los bordes de todas las ventanas flotantes
    border_focus="#000000",  # Este no se usará
    border_normal="#000000",
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)
