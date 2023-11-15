#!/bin/bash

# Verificar si se proporcionaron los parámetros necesarios
if [ $# -ne 2 ]; then
    echo "Uso: $0 <cadena> <archivo_de_salida>"
    exit 1
fi

# Parámetros de entrada
cadena=$1
outfile=$2

# Arrays
simbolos=('!' '@' '#' '$' '%' '&' '*' '_' '-' '+' '?' '.')
numeros=(0 1 2 3 4 5 6 7 8 9)
fechas=('2020' '2022' '2023')

# Vaciar el archivo de salida
> $outfile

# Generar modificaciones
for simbolo in "${simbolos[@]}"; do
    echo $cadena$simbolo >> $outfile
done

for numero in "${numeros[@]}"; do
    echo $cadena$numero >> $outfile
done

for simbolo in "${simbolos[@]}"; do
    for numero in "${numeros[@]}"; do
        echo $cadena$simbolo$numero >> $outfile
        echo $cadena$numero$simbolo >> $outfile
    done
done

for fecha in "${fechas[@]}"; do
    for simbolo in "${simbolos[@]}"; do
        echo $cadena$fecha$simbolo >> $outfile
    done
done
