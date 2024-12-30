#!/opt/WallpaperSelector/venv/bin/python

import gi
import os

gi.require_version("Gtk", "3.0")
gi.require_version("GdkPixbuf", "2.0")

from widgets.wallpaper_widget import WallpaperWidget
from gi.repository import Gtk, GLib, GdkPixbuf

from PIL import Image


class SystrayApp:
    def __init__(self):
        self.indicator = Gtk.StatusIcon()
        script_dir = os.path.dirname(os.path.realpath(__file__))
        image_path = os.path.join(script_dir, "resources", "wallpaper-icon.png")
        pixbuf = GdkPixbuf.Pixbuf.new_from_file(image_path)
        self.indicator.set_from_pixbuf(pixbuf)
        self.indicator.set_tooltip_text("Wallpaper Selector/")
        self.indicator.connect("activate", self.on_activate)
        self.indicator.connect("popup-menu", self.on_right_click)

        self.builder = Gtk.Builder()
        image_path = os.path.join(script_dir, "ui", "form.ui")
        self.builder.add_from_file(image_path)

        self.grid = self.builder.get_object("grid")
        self.add_wallpapers_to_grid(self.grid)

        self.window = self.builder.get_object("main_window")
        self.window.connect("delete-event", self.on_window_close)

    def on_activate(self, icon):
        self.fade_in_window()

    def fade_in_window(self):
        step = 0.10
        current_opacity = 0

        self.window.show_all()
        gdk_window = self.window.get_window()

        if gdk_window is not None:
            gdk_window.set_opacity(current_opacity)

            def fade():
                nonlocal current_opacity
                if current_opacity < 1:
                    current_opacity = min(current_opacity + step, 1)
                    gdk_window.set_opacity(current_opacity)
                    return True
                return False

            GLib.timeout_add(30, fade)
        else:
            print("Error: GdkWindow not found.")

    def on_right_click(self, icon, button, time):
        menu = Gtk.Menu()

        quit_item = Gtk.MenuItem(label="Salir")
        quit_item.connect("activate", self.on_quit)
        menu.append(quit_item)

        menu.show_all()
        menu.popup(None, None, None, None, button, time)

    def on_window_close(self, widget, event):
        self.window.hide()
        return True

    def on_quit(self, widget):
        Gtk.main_quit()

    def add_wallpapers_to_grid(self, grid):
        wallpapers_path = os.path.expanduser("~/Pictures/wallpapers")

        if not os.path.isdir(wallpapers_path):
            print(f"Error: {wallpapers_path} not found.")
            return

        files = os.listdir(wallpapers_path)
        row = 0
        column = 0

        for file_name in files:
            file_path = os.path.join(wallpapers_path, file_name)

            if file_name.lower().endswith((".png", ".jpg", ".jpeg", ".gif")):
                try:
                    with Image.open(file_path) as img:
                        width, height = img.size
                except Exception as e:
                    print(f"{e}")
                    continue

                wallpaper_widget = WallpaperWidget(
                    file_name, f"{width}x{height}", file_path
                )
                grid.attach(wallpaper_widget, column, row, 1, 1)

                column += 1
                if column >= 3:
                    column = 0
                    row += 1

    def run(self):
        GLib.idle_add(self.window.hide)
        Gtk.main()


if __name__ == "__main__":
    app = SystrayApp()
    app.run()
