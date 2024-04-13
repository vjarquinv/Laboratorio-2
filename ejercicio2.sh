#!/bin/bash

# Valeria Jarquin Vargas, B83986
# Uso: ./ejercicio2.sh <nombre_proceso> <comando_para_ejecutarlo>

# Se asigna los argumentos a variables
process_name=$1
command_to_execute=$2

# Para monitorear el proceso se realiza un bucle
while true; do
    # Verifica si el proceso está corriendo
    pgrep -x "$process_name" >/dev/null

    # Si el proceso no está corriendo, ejecuta el comando para levantarlo
    if [ $? -ne 0 ]; then
        echo "No esta corriendo el proceso "$process_name". Volviendo a levantarlo..."
        # Se utliza nohup para que cuando el termine de ejecutar el script no deje de correr el proceso
        nohup $command_to_execute >/dev/null 2>&1 &
    fi

    # Espera 5s antes de revisar nuevamente
    sleep 5
done
