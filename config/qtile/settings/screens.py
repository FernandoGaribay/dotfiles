from libqtile import bar, layout, widget, hook
from libqtile.config import Screen, Match
from libqtile.lazy import lazy

from settings.variables import *
from settings.layouts import *
from settings.widgets import *

powerline = {"decorations": [PowerLineDecoration()]}

screens = [
    Screen(
        top=bar.Bar(
            [
                Spacer(5, "#1793D1"),
                ArchLogo(),
                Spacer(5, Color2),
                GroupBox(),
                Spacer(10, colorBarra),
                widget.Prompt(),
                widget.WindowName(max_chars=40),
                widget.Spacer(**decor_right, length=30),
                CurrentLayout(),
                get_battery_widget(),
                get_active_connection_widget(),
                widget.Net(
                    **decor_right,
                    format="󰓅  <b>{down:.0f}{down_suffix} ↓↑ {up:.0f}{up_suffix}</b>",
                    padding=10,
                    background=Color4,
                    fontshadow=colorNegro,
                ),
                Clock(),
                widget.Systray(background=Color7),
                Spacer(10, Color7),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
            ],
            tamanoBarra,
            background=colorBarra,
            margin=[5, 10, 5, 10],
            opacity=1,
            border_width=[0, 0, 0, 0],
            border_color=["ffffff", "ffffff", "ffffff", "ffffff"],
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
    Screen(
        top=bar.Bar(
            [
                Spacer(5, "#1793D1"),
                ArchLogo(),
                Spacer(5, Color2),
                GroupBox(),
                Spacer(10, colorBarra),
                widget.WindowName(max_chars=40),
                widget.Spacer(**decor_right, length=30),
                CurrentLayout(),
                widget.CPU(
                    fmt="  <b>{}</b>",
                    background=Color3,
                    fontshadow=colorNegro,
                ),
                widget.ThermalSensor(
                    **decor_right,
                    tag_sensor="Tctl",
                    format=" <b>{temp:.0f}{unit}</b>",
                    background=Color3,
                    padding=10,
                    fontshadow=colorNegro,
                ),
                widget.NvidiaSensors(
                    **decor_right,
                    threshold=75,
                    foreground_alert="ff6000",
                    fmt="󰺵  <b>{}</b>",
                    padding=10,
                    background=Color5,
                    fontshadow=colorNegro,
                ),
                widget.Memory(
                    **decor_right,
                    fmt=" <b>{}</b>",
                    padding=10,
                    background=Color4,
                    fontshadow=colorNegro,
                ),
                Spacer(10, Color7),
            ],
            tamanoBarra,
            background=colorBarra,
            margin=[5, 10, 5, 10],
            opacity=1,
            border_width=[0, 0, 0, 0],
            border_color=["ffffff", "ffffff", "ffffff", "ffffff"],
        ),
    ),
]
