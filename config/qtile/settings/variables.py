# Variables -------------------------------------

import os
import json
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()
tamanoBarra = 25
fuentePredeterminada = "UbuntuMono Nerd Font"
tamanoFuente = 14
colorBlanco = "#FFFFFF"
colorNegro = "#000000"
ThisFocus = "#005186"
OtherFocus = "#0089E4"

colorBarra = "#282a36"
colorActivo = "#7ED0FF"
colorFecha = "#994DCC"
colorLayout = "#E46C76"
colorTemperaturas = "#EE977B"
colorIMG = "#3AAEFC"

colors = os.path.expanduser("~/.cache/wal/colors.json")
colordict = json.load(open(colors))
Color0 = colordict["colors"]["color0"]
Color1 = colordict["colors"]["color1"]
Color2 = colordict["colors"]["color2"]
Color3 = colordict["colors"]["color3"]
Color4 = colordict["colors"]["color4"]
Color5 = colordict["colors"]["color5"]
Color6 = colordict["colors"]["color6"]
Color7 = colordict["colors"]["color7"]
Color8 = colordict["colors"]["color8"]
Color9 = colordict["colors"]["color9"]
Color10 = colordict["colors"]["color10"]
Color11 = colordict["colors"]["color11"]
Color12 = colordict["colors"]["color12"]
Color13 = colordict["colors"]["color13"]
Color14 = colordict["colors"]["color14"]
Color15 = colordict["colors"]["color15"]
Foreground = colordict["special"]["foreground"]


def darken_color(hex_color, factor=0.5):
    """
    Oscurece un color hexadecimal en un porcentaje dado.

    :param hex_color: Color en formato hexadecimal (ejemplo: '#a6c7bd').
    :param factor: Factor de oscurecimiento (0.0 - 1.0), donde 0.5 representa un 50%.
    :return: Color oscurecido en formato hexadecimal.
    """
    # Asegúrate de que el color comience con '#'
    hex_color = hex_color.lstrip("#")

    # Convertir el color hexadecimal a RGB
    rgb = tuple(int(hex_color[i : i + 2], 16) for i in (0, 2, 4))

    # Oscurecer cada componente RGB
    darkened_rgb = tuple(int(c * factor) for c in rgb)

    # Convertir de nuevo a hexadecimal
    darkened_hex = "#{:02x}{:02x}{:02x}".format(*darkened_rgb)

    return darkened_hex


def lighten_color(hex_color, factor=0.5):
    """
    Aclara un color hexadecimal en un porcentaje dado.

    :param hex_color: Color en formato hexadecimal (ejemplo: '#a6c7bd').
    :param factor: Factor de aclaramiento (0.0 - 1.0), donde 0.5 representa un 50%.
    :return: Color aclarado en formato hexadecimal.
    """
    # Asegúrate de que el color comience con '#'
    hex_color = hex_color.lstrip("#")

    # Convertir el color hexadecimal a RGB
    rgb = tuple(int(hex_color[i : i + 2], 16) for i in (0, 2, 4))

    # Aclarar cada componente RGB
    lightened_rgb = tuple(min(int(c + (255 - c) * factor), 255) for c in rgb)

    # Convertir de nuevo a hexadecimal
    lightened_hex = "#{:02x}{:02x}{:02x}".format(*lightened_rgb)

    return lightened_hex
