from pyswip import Prolog

# Variables de configuración
CONSULTA = "madre(elizabeth, X)"
ISBOOLEAN = False

# Inicializar Prolog
prolog = Prolog()
prolog.consult("Ejercicio1/Ejercicio1.pl")


def ejecutar_consulta(consulta = CONSULTA, isBoolean = ISBOOLEAN):
    """Ejecuta una consulta en Prolog y devuelve los resultados"""
    try:
        if isBoolean:
            resultados = bool(list(prolog.query(consulta)))
        else:
            resultados = list(prolog.query(consulta))

        return resultados
    
    except Exception as e:
        print(f"Error al ejecutar la consulta: {e}")

        return []


def mostrar_resultados(resultados, variable1 = "X", variable2 = "Y"):
    """Muestra los resultados de una consulta"""
    if resultados:
        if isinstance(resultados, bool):
            print(f"\nResultado: {resultados}")
            return
        
        print(f"\nResultados encontrados: {len(resultados)}")
        for i, resultado in enumerate(resultados, 1):
            if variable1 in resultado:
                print(f"  {i}. {resultado[variable1]}")
            elif variable2 in resultado:
                print(f"  {i}. {resultado[variable2]}")
            else:
                print(f"  {i}. {resultado}")
    else:
        print("\nNo se encontraron resultados.")


def main():
    """Función principal del programa"""
    print("\n¡Bienvenido al Sistema de Consultas del Árbol Genealógico!")
    print("\nEstamos ejecutando tu consulta..." + '"' + CONSULTA + '"')

    resultados = ejecutar_consulta()
    mostrar_resultados(resultados)
    
    print("\nGracias por usar el sistema. ¡Hasta luego!\n")


# Ejecutar el programa
if __name__ == "__main__":
    main()
