import sys
import os
from PySide6.QtWidgets import QApplication, QWidget, QLabel, QVBoxLayout, QSizePolicy
from PySide6.QtGui import QPixmap
from PySide6.QtCore import Qt
from gui.ui_image_widget import Ui_Form 

image_dir = "/home/fernando/Pictures/wallpapers"
image_width, image_height = 180, 130

class ImageWidget(QWidget):
    def __init__(self, image_path, label_text, parent=None):
        super().__init__(parent)
        self.ui = Ui_Form()
        self.ui.setupUi(self)
        self.image_path = image_path

        pixmap = QPixmap(image_path)
        scaled_pixmap = pixmap.scaled(image_width, image_height, Qt.IgnoreAspectRatio, Qt.SmoothTransformation)
        self.ui.image_label.setPixmap(scaled_pixmap)

        self.background_label = QLabel(self)
        self.background_label.setStyleSheet("""
            background-color: rgba(0, 0, 0, 128);
        """)
        self.background_label.setFixedSize(image_width, 30)
        self.background_label.move(0, 100) 

        self.options_label = QLabel("...", self)
        self.options_label.setStyleSheet("""
            background-color: rgba(0, 0, 0, 0);
            font-size: 18px;
            color: white; 
            font-weight: bold;
        """)
        self.options_label.setFixedSize(30, 30)
        self.options_label.setAlignment(Qt.AlignCenter)
        self.options_label.move(150, 100) 

        self.text_label = QLabel(label_text, self)
        self.text_label.setFixedSize(120, 15)
        self.text_label.setStyleSheet("""
            background-color: rgba(0, 0, 0, 0);
            font-size: 12px;
            font-weight: bold; 
            color: white; 
        """)
        self.text_label.move(10, 101) 

        self.size_label = QLabel(f"{pixmap.width()}x{pixmap.height()}", self)
        self.size_label.setFixedSize(120, 15)
        self.size_label.setStyleSheet("""
            background-color: rgba(0, 0, 0, 0);
            font-size: 10px; 
            color: white; 
        """)
        self.size_label.move(10, 114)

    def mousePressEvent(self, event):
        if event.button() == Qt.LeftButton:
            print(f"Imagen: {self.image_path}")
        super().mousePressEvent(event) 
