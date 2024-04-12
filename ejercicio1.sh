#!/bin/bash

# Se asigna el primer argumento

id_proceso=$1

# Se verifica si el proceso existe

if ! ps -p $id_proceso > /dev/null; then
    echo " No existe el proceso con ID $id_proceso"
    exit 1
fi


nombre_proceso=$(ps -o comm= -p $id_proceso)
ppid=$(ps -o ppid= -p $id_proceso)
usuario=$(ps -o user= -p $id_proceso)
porcentaje_cpu=$(ps -o %cpu= -p $id_proceso)
consumo_memoria=$(ps -o %mem= -p $id_proceso)
estado=$(ps -o state= -p $id_proceso)
path_exe=$(readlink /proc/$id_proceso/exe)

echo "Nombre del proceso: $nombre_proceso"
echo "ID del proceso: $id_proceso"
echo "Parent process ID: $ppid"
echo "Usuario propietario: $usuario"
echo "Porcentaje de uso de CPU: $porcentaje_cpu"
echo "Consumo de memoria: $consumo_memoria"
echo "Estado: $estado"
echo "Patch del ejecutable: $path_exe"