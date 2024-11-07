from libqtile import bar, layout
from libqtile.config import Screen
from libqtile.lazy import lazy

from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration

from settings.variables import *
import os
import subprocess

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

def get_battery_widget():
    battery_path = "/sys/class/power_supply/BAT0/"
    if os.path.exists(battery_path):
        return widget.Battery()
    else:
        return widget.TextBox(
            **decor_right,
            padding=10,
            background=Color2,
            fontshadow=colorNegro,
            fmt='<b>󰂄 Connected</b>'
        )

def get_active_connection_widget():
    return widget.TextBox(
        fmt=f"󱚽  <b>{_get_active_connection()}</b>",
        padding=5,
        background=Color4,
        fontshadow=colorNegro,
    )

def _get_active_connection():
    output = subprocess.check_output("nmcli -t -f CONNECTION device", shell=True).decode('utf-8').strip()
    connections = output.split('\n')
    for conn in connections:
        if conn and "Wired" in conn:
            return conn
    return "No Connection"

def Spacer(length=10, background=colorBarra):
    return widget.Spacer(
        length=length,
        background=background,
    ) 
    
def ArchLogo():
    return widget.Image(
        **decor_left,
        filename="~/.config/qtile/archlinux.png",
        margin=5,
        background="#1793D1",
        mouse_callbacks={
            "Button1": lazy.spawn("kitty"),
        },
    )

def GroupBox():
    return widget.GroupBox(
        **decor_left,
        font="JetBrainsMono Nerd Font",
        fontsize=10,
        active=Foreground,
        inactive=Foreground,
        background=Color2,
        this_current_screen_border=darken_color(Color2, 0.5),
        other_current_screen_border=darken_color(Color2, 0.5),
        other_screen_border=lighten_color(Color2, 0.25),
        this_screen_border=lighten_color(Color2, 0.25),
        borderwidth=5,
        highlight_method="block",
        disable_drag=True,
        center_aligned=True,
    )

def TextIcon(text="", padding=0, foreground=colorIMG, background=colorBlanco, fontshadow=colorNegro, fontsize=36):
    return widget.TextBox(
        text=text,
        padding=padding,
        foreground=foreground,
        background=background,
        fontshadow=fontshadow,
        fontsize=fontsize,
    )

def CurrentLayout():
    return widget.CurrentLayout(
        **decor_right,
        fmt="  <b>{}</b>",
        padding=10,
        background=Color5,
        fontshadow=colorNegro,
    )

def Clock():
    return widget.Clock(
        **decor_right,
        format="%Y-%m-%d %a %I:%M %p",
        fmt="󰃰  <b>{}</b>",
        padding=10,
        background=Color6,
        fontshadow=colorNegro,
    )