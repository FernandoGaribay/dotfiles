#!/bin/bash

sudo systemctl enable NetworkManager
sudo systemctl enable sddm
sudo systemctl start libvirtd

sudo usermod -aG libvirt $(whoami)
