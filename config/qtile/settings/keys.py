from libqtile.config import Click, Drag, Key
from libqtile.lazy import lazy

from settings.variables import mod
from pathlib import Path

# Get home path
home = str(Path.home())

keys = [
    # Navigate between windows
    Key([mod], "left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows location
    Key(
        [mod, "shift"],
        "left",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "right",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "up", lazy.layout.shuffle_up(), desc="Move window up"),
    # Move windows between groups
    Key(
        [mod, "control"],
        "left",
        lazy.layout.grow_left(),
        desc="Grow window to the left",
    ),
    Key(
        [mod, "control"],
        "right",
        lazy.layout.grow_right(),
        desc="Grow window to the right",
    ),
    Key([mod, "control"], "down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Launch Terminal
    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch terminal"),
    # Launch Rofi app selector
    Key(
        [mod],
        "m",
        lazy.spawn(home + "/.config/rofi/launchers/type-2/launcher.sh"),
        desc="Abrir menu Rofi",
    ),
    Key(
        [mod],
        "c",
        lazy.spawn("rofi -show calc -modi calc -no-show-match -no-sort"),
        desc="Abrir menu Rofi",
    ),
    # Launch browser
    Key([mod], "f", lazy.spawn("brave"), desc="Abrir brave"),
    # Launch shutdown options
    Key(
        [mod],
        "BackSpace",
        lazy.spawn(home + "/.config/rofi/powermenu/type-2/powermenu.sh"),
        desc="Script de apagado",
    ),
    # Change wallpaper
    Key(
        [mod, "shift"],
        "w",
        lazy.spawn(home + "/.config/qtile/wallpaper.sh"),
        desc="Update Theme and Wallpaper",
    ),
    # Launch file explorer
    Key([mod], "e", lazy.spawn("thunar")),
    # Launch FlameShot
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui")),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod, "control"],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
