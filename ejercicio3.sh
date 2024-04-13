#!/bin/bash

# Valeria Jarquin Vargas, B83986

# Argumento para guardar el ejecutable
ejecutable="$1"

# Nombre del archivo de registro
log_file="uso_cpu_mem.log"

# Iniciar ejecución del binario en segundo plano
./$ejecutable &

# Para obtener el ID del proceso del ejecutable
pid=$!

# Función para obtener el uso de CPU y memoria y escribirlo en el archivo de registro
monitor_process() {
    while ps -p $pid > /dev/null; do
        timestamp=$(date +%s)
        cpu_usage=$(ps -p $pid -o %cpu | grep -v CPU)
        mem_usage=$(ps -p $pid -o %mem | grep -v MEM)
        echo "$timestamp $cpu_usage $mem_usage" >> $log_file
        sleep 1
    done
}

# Para monitorear el proceso en segundo plano
monitor_process &

# Esperar a que el proceso termine
wait $pid
