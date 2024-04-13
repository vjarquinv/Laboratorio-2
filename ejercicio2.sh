#!/bin/bash

# Valeria Jarquin Vargas, B83986
# Uso: ./ejercicio2.sh <nombre_proceso> <comando_para_ejecutarlo>

# Se asigna los argumentos a variables
nombre_proceso=$1
comando_ejecutar=$2

# Para monitorear el proceso se realiza un bucle
while true; do
    # Verifica si el proceso está corriendo
    pgrep -x "$nombre_proceso" >/dev/null

    # Si el proceso no está corriendo, ejecuta el comando para levantarlo
    if [ $? -ne 0 ]; then
        echo "No esta corriendo el proceso "$nombre_proceso". Volviendo a levantarlo..."
        # Se utliza nohup para que cuando el termine de ejecutar el script no deje de correr el proceso
        nohup $comando_ejecutar >/dev/null 2>&1 &
    fi

    # Espera 5s antes de revisar nuevamente
    sleep 5
done
