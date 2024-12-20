import subprocess
import re
import os
import sys

# Agregar la carpeta raiz del proyecto al path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

def execute_commands():
    commands = [
        "pyside6-uic ui/form.ui -o gui/ui_form.py",
        "pyside6-uic ui/image_widget.ui -o gui/ui_image_widget.py",
        #"pyside6-uic ui/login.ui -o gui/login.py",
        #"pyside6-rcc resources.qrc -o resources_rc.py"
    ]

    for command in commands:
        try:
            subprocess.run(command, shell=True, check=True)
            print(f"Comando: {command} ejecutado.")
        except subprocess.CalledProcessError as e:
            print(f"Error al ejecutar el comando '{command}': {e}")

def replace_qt_qt_in_dashboard():
    dashboard_path = "gui/dashboard.py"
    
    if not os.path.exists(dashboard_path):
        print(f"El archivo {dashboard_path} no existe.")
        return
    
    with open(dashboard_path, "r", encoding="utf-8") as file:
        content = file.read()
    new_content = re.sub(r"\bQt\.Qt\.", "Qt.", content)
    
    if new_content != content:
        with open(dashboard_path, "w", encoding="utf-8") as file:
            file.write(new_content)
        print(f"Reemplazos realizados en {dashboard_path}.")
    else:
        print(f"No se encontraron coincidencias en {dashboard_path}.")

def run_main():
    try:
        print("Ejecutando main.py")
        subprocess.run("python main.py", shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error al ejecutar 'python main.py': {e}")

if __name__ == "__main__":
    execute_commands()
    replace_qt_qt_in_dashboard()
    run_main()
