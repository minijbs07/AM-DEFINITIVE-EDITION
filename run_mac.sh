#!/bin/bash

# Directorio del script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$DIR/2.0"
SRC_DIR="$PROJECT_DIR/src"
BIN_DIR="$PROJECT_DIR/bin"
JAR_NAME="AgendasMatrimoniales.jar"

# Crear directorio bin si no existe
mkdir -p "$BIN_DIR"

# Compilar el programa
echo "🛠️  Compilando Agendas Matrimoniales..."
javac -d "$BIN_DIR" -sourcepath "$SRC_DIR" "$SRC_DIR/pract01/gui/GUIGestionAgenda.java"

if [ $? -eq 0 ]; then
    echo "✅ Compilación exitosa."
    
    # Copiar recursos al directorio bin para el empaquetado
    cp -R "$SRC_DIR/Recursos" "$BIN_DIR/"
    
    # Crear el JAR ejecutable
    echo "📦 Creando archivo JAR ejecutable..."
    jar cfm "$DIR/$JAR_NAME" "$PROJECT_DIR/manifest.txt" -C "$BIN_DIR" .
    
    if [ $? -eq 0 ]; then
        echo "🚀 ¡LISTO! Se ha creado '$JAR_NAME' en la raíz."
        echo "💡 Ahora puedes hacer DOBLE CLIC en '$JAR_NAME' para abrirlo."
        
        # Opcional: Ejecutar ahora
        # java -jar "$DIR/$JAR_NAME"
    else
        echo "❌ Error al crear el JAR."
    fi
else
    echo "❌ Error en la compilación."
fi
