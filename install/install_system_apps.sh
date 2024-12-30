#!/bin/bash

source /home/$(whoami)/.dotfiles/install/colors.sh

mv $HOME/.dotfiles/wallpapers $HOME/Pictures/
bash $HOME/.config/qtile/wallpaper.sh

WALLPAPER_SELECTOR_PATH="/home/$(whoami)/.dotfiles/apps/WallpaperSelector"
DESKTOP_FILE="/usr/share/applications/wallpaperselector.desktop"

python -m venv "$WALLPAPER_SELECTOR_PATH/venv"
echo -e "  > ${DARK_BLUE}[Wallpaper Selector]${NC} Virtual environment created"

echo -e "  > ${DARK_BLUE}[Wallpaper Selector]${NC} Installing requirements..."
source "$WALLPAPER_SELECTOR_PATH/venv/bin/activate"
pip install -r $WALLPAPER_SELECTOR_PATH/requirements.txt
echo -e "  > ${DARK_BLUE}[Wallpaper Selector]${NC} Requirements installed."


sudo ln -sf $WALLPAPER_SELECTOR_PATH /opt/WallpaperSelector
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$WALLPAPER_SELECTOR_PATH${NC} -> ${DARK_YELLOW}/opt/WallpaperSelector${NC}"

sudo ln -sf $WALLPAPER_SELECTOR_PATH/main.py /usr/local/bin/wallpaperselector
chmod +x /opt/WallpaperSelector/main.py
echo "  > ${DARK_BLUE}Symbolic link${NC} created: ${DARK_GREEN}$WALLPAPER_SELECTOR_PATH/main.py${NC} -> ${DARK_YELLOW}/usr/local/bin/wallpaperselector${NC}"

sudo bash -c "cat > $DESKTOP_FILE <<EOL
[Desktop Entry]
Version=1.0
Name=WallpaperSelector
Comment=Select your wallpapers easily
Exec=/opt/WallpaperSelector/venv/bin/python /opt/WallpaperSelector/main.py
Icon=/opt/WallpaperSelector/resources/wallpaper-icon.png
Terminal=false
Type=Application
Categories=Utility;Graphics;
EOL"

sudo chmod +x /usr/share/applications/wallpaperselector.desktop
echo -e "  > ${DARK_BLUE}[Wallpaper Selector]${NC} ${DARK_GREEN}wallpaperselector.desktop${NC} created."