@echo off
echo 🛠️  Compilando Agendas Matrimoniales para Windows...
if not exist "bin" mkdir bin
javac -d bin -sourcepath 2.0\src 2.0\src\pract01\gui\VentanaMain.java
if %errorlevel% neq 0 (
    echo ❌ Error en la compilación.
    pause
    exit /b %errorlevel%
)
echo ✅ Compilación exitosa.
echo 📦 Creando archivo JAR ejecutable...
jar cfe AgendasMatrimoniales.jar pract01.gui.VentanaMain -C bin . -C 2.0\src Recursos
echo 🚀 ¡LISTO! Se ha creado 'AgendasMatrimoniales.jar'.
echo 💡 Haz doble clic en el archivo para abrirlo.
pause
