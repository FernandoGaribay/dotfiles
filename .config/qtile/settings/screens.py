from libqtile import bar, layout
from libqtile.config import Screen, Match
from libqtile.lazy import lazy

from settings.variables import *
from settings.layouts import *
from settings.widgets import *

decor_left = {
    "decorations": [
        PowerLineDecoration(
            path="arrow_left"
            # path="rounded_left"
            # path="forward_slash"
            # path="back_slash"
        )
    ],
}

decor_right = {
    "decorations": [
        PowerLineDecoration(
            path="arrow_right"
            # path="rounded_right"
            # path="forward_slash"
            # path="back_slash"
        )
    ],
}

powerline = {
    "decorations": [
        PowerLineDecoration()
    ]
}

screens = [
    Screen(
        top=bar.Bar(
            [
                # Imagen Alacritty -----------------
                Spacer(5, "#1793D1"), # #1793D1
                widget.Image(
                    **decor_left,
                    filename="~/.config/qtile/archlinux.png",
                    margin=5,
                    background="#1793D1",
                    mouse_callbacks = {
                        'Button1': lazy.spawn("kitty"),
                    }
                ),

                # Groups ---------------------------

                Spacer(5, Color2),

                widget.GroupBox(
                    **decor_left,
                    font = "JetBrainsMono Nerd Font",
                    fontsize=10,
                    active=Foreground,
                    inactive=Foreground,
                    background=Color2,
                    this_current_screen_border=darken_color(Color2, 0.5),
                    other_current_screen_border=darken_color(Color2, 0.5), 
                    other_screen_border=lighten_color(Color2, 0.25),
                    this_screen_border=lighten_color(Color2, 0.25),
                    borderwidth=5,
                    highlight_method='block',
                    disable_drag=True,
                    center_aligned=True,
                ),
                Spacer(10, colorBarra), 

                # Window name ----------------------
                widget.Prompt(),
                widget.WindowName(
                    max_chars = 40
                ),
                widget.Spacer(),
                widget.Spacer(
                    **decor_right,
                    length=30
                ),

                # Temperaturas ---------------------
                widget.CPU(
                    **decor_right,
                    fmt='  <b>{}</b>',
                    background=Color3,
                    fontshadow=colorNegro,
                ),

                widget.ThermalSensor(
                    **decor_right,
                    tag_sensor='Tctl',
                    format=' <b>{temp:.0f}{unit}</b>',
                    background=Color4,
                    fontshadow=colorNegro,
                ),

                widget.CurrentLayout(
                    **decor_right,
                    fmt='  <b>{}</b>',
                    background=Color5,
                    fontshadow=colorNegro,
                ),
                
                widget.Clock(
                    **decor_right,
                    format="%Y-%m-%d %a %I:%M %p",
                    fmt='󰃰  <b>{}</b>',
                    background=Color6,
                    fontshadow=colorNegro,
                ),

                widget.Systray(
                    background=Color7
                ),
                
                Spacer(10, Color7),

                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
            ],
            tamanoBarra,
            background=colorBarra,
            margin=[5,10,5,10],
            opacity=1,
            border_width=[0, 0, 0, 0],
            border_color=["ffffff", "ffffff", "ffffff", "ffffff"]
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),

    Screen(
        top=bar.Bar(
            [
                widget.WindowName(),
            ],
            tamanoBarra,
            background=colorBarra,
        ),
        #layouts=[
        #    layout.Max(),
        #],
    ),
]
