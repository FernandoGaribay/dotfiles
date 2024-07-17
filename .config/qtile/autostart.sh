#!/bin/sh

# Configuracion de monitores
xrandr --output DP-1 --mode 1280x768 --pos 0x156 --rotate normal --output HDMI-0 --primary --mode 1920x1080 --rate 75 --pos 1280x0 --rotate normal &

# Configuracion del teclado en latinoamerica
setxkbmap latam &

# Inicializar Picom para efectos visuales
picom -f --xrender-sync-fence &

# Inicializar nitrogen (fondo de pantalla)
#nitrogen --restore &
bash /home/fernando/Documents/dotfiles/wallpaper.sh init

xinput --set-prop 12 "libinput Accel Speed" -0.3 & 

# Iconos del sistema
#pipewire &
#pipewire-pulse &
