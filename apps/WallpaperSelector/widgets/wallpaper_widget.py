import gi
import subprocess

from gi.repository import Gtk, GdkPixbuf, Gdk, GLib

from config.config import (
    WIDGET_IMAGE_HEIGHT,
    WIDGET_IMAGE_WIDTH,
    LABEL_BACKGROUND_HEIGHT,
    LABEL_BACKGROUND_WIDTH,
    NAME_MAX_CHARACTERS,
)


class WallpaperWidget(Gtk.EventBox):
    def __init__(self, file_name, file_size, file_path):
        super().__init__()

        self.file_path = file_path
        self.set_size_request(WIDGET_IMAGE_WIDTH, WIDGET_IMAGE_HEIGHT)
        self.connect("button-press-event", self.on_click)

        css = """
        .background-label {
            background-color: rgba(0, 0, 0, 0.5);
        }

        .image-label{
            font-size: 12px;
            font-weight: bold;
            color: white;
        }

        .image-size{
            font-size: 10px;
            color: white;
        }
        """

        css_provider = Gtk.CssProvider()
        css_provider.load_from_data(css.encode("utf-8"))
        Gtk.StyleContext.add_provider_for_screen(
            Gdk.Screen.get_default(), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER
        )

        pixbuf = GdkPixbuf.Pixbuf.new_from_file(file_path)
        pixbuf = pixbuf.scale_simple(
            WIDGET_IMAGE_WIDTH,
            WIDGET_IMAGE_HEIGHT,
            GdkPixbuf.InterpType.BILINEAR,
        )
        image = Gtk.Image.new_from_pixbuf(pixbuf)

        overlay = Gtk.Overlay()
        overlay.set_size_request(WIDGET_IMAGE_WIDTH, WIDGET_IMAGE_HEIGHT)
        overlay.add(image)

        label_container = Gtk.Fixed()
        label_container.set_size_request(WIDGET_IMAGE_WIDTH, WIDGET_IMAGE_HEIGHT)

        if len(file_name) > NAME_MAX_CHARACTERS:
            file_name = file_name[:NAME_MAX_CHARACTERS] + "…"
        image_label = Gtk.Label(label=file_name)
        image_label.set_halign(Gtk.Align.START)
        image_label.set_valign(Gtk.Align.CENTER)
        image_label.set_size_request(-1, 15)
        image_label.get_style_context().add_class("image-label")

        image_size = Gtk.Label(label=file_size)
        image_size.set_halign(Gtk.Align.START)
        image_size.set_valign(Gtk.Align.CENTER)
        image_size.set_size_request(-1, 15)
        image_size.get_style_context().add_class("image-size")

        background = Gtk.Label()
        background.set_size_request(LABEL_BACKGROUND_WIDTH, 30)
        background.get_style_context().add_class("background-label")

        label_container.put(
            background, 0, WIDGET_IMAGE_HEIGHT - LABEL_BACKGROUND_HEIGHT
        )
        label_container.put(
            image_label, 5, WIDGET_IMAGE_HEIGHT - (LABEL_BACKGROUND_HEIGHT - 1)
        )
        label_container.put(
            image_size, 5, WIDGET_IMAGE_HEIGHT - (LABEL_BACKGROUND_HEIGHT / 2 + 1)
        )

        overlay.add_overlay(label_container)
        self.add(overlay)

    def on_click(self, widget, event):
        if event.button == 1:
            script_path = "~/.dotfiles/config/qtile/wallpaper.sh"
            argument = "path"

            subprocess.run(
                f"bash {script_path} {argument} {self.file_path}",
                shell=True,
                check=True,
            )
