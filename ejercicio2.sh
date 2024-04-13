#!/bin/bash

# Se asigna los argumentos a variables
process_name=$1
command_to_execute=$2

# Bucle infinito para monitorear el proceso
while true; do
    # Verifica si el proceso está corriendo
    pgrep -x "$process_name" >/dev/null

    # Si el proceso no está corriendo, ejecuta el comando para levantarlo
    if [ $? -ne 0 ]; then
        echo "No esta corriendo el proceso "$process_name". Volviendo a levantarlo..."
        #eval "$command_to_execute "
        nohup $command_to_execute >/dev/null 2>&1 &
    fi

    # Espera un tiempo antes de revisar nuevamente
    sleep 5
done
