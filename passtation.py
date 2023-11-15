import argparse

def generar_modificaciones(cadena):
    simbolos = ['!', '@', '#', '$', '%', '&', '*', '_', '-', '+', '?', '.']
    numeros = list(range(10))
    fechas = ['2020', '2022', '2023']

    modificaciones = []

    for simbolo in simbolos:
        modificaciones.append(cadena + simbolo)

    for numero in numeros:
        modificaciones.append(cadena + str(numero))

    for simbolo in simbolos:
        for numero in numeros:
            modificaciones.append(cadena + simbolo + str(numero))
            modificaciones.append(cadena + str(numero) + simbolo)

    for fecha in fechas:
        for simbolo in simbolos:
            modificaciones.append(cadena + fecha + simbolo)

    return modificaciones

def main():
    parser = argparse.ArgumentParser(description='Genera modificaciones de una cadena.')
    parser.add_argument('-c', '--cadena', required=True, help='La cadena para modificar.')
    parser.add_argument('-o', '--outfile', required=True, help='El nombre del archivo de salida.')
    args = parser.parse_args()

    modificaciones = generar_modificaciones(args.cadena)

    with open(args.outfile, 'w') as f:
        for modificacion in modificaciones:
            f.write(modificacion + '\n')

if __name__ == '__main__':
    main()