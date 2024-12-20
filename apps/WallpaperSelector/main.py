# This Python file uses the following encoding: utf-8
import sys

from PySide6.QtWidgets import QApplication, QWidget

# Important:
# You need to run the following command to generate the ui_form.py file
#     pyside6-uic form.ui -o ui_form.py, or
#     pyside2-uic form.ui -o ui_form.py
from gui.ui_form import Ui_main
from PySide6.QtWidgets import QDialog, QLabel
from PySide6.QtGui import QKeyEvent, QPixmap
from PySide6.QtCore import Qt
from widgets.ImageWidget import ImageWidget
import os

image_dir = "/home/fernando/Pictures/wallpapers"

class main(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.ui = Ui_main()
        self.ui.setupUi(self)

        columns = 3
        row, col = 0, 0

        # Iterar sobre las imágenes en el directorio
        for filename in os.listdir(image_dir):
            if filename.lower().endswith(('.png', '.jpg', '.jpeg', '.bmp', '.gif')):
                image_path = os.path.join(image_dir, filename)

                image_widget = ImageWidget(image_path, filename)

                self.ui.gridLayout.addWidget(image_widget, row, col)

                # Actualizar posición en la cuadrícula
                col += 1
                if col >= columns:
                    col = 0
                    row += 1


if __name__ == "__main__":
    app = QApplication(sys.argv)
    widget = main()
    widget.show()
    sys.exit(app.exec())
