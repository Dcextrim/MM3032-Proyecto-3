# MM3032-Proyecto-3

Este proyecto contiene la implementación de dos ejercicios de programación lógica utilizando Prolog, enfocados en el manejo de relaciones y grafos dirigidos.  

## Instrucciones del Proyecto

**Objetivo:** Entregar los siguientes ejercicios en grupo, cargando los programas y los gráficos según corresponda en la tarea en Canvas.  

### Ejercicio 1: Árbol Genealógico

Realizar un árbol genealógico definiendo y utilizando las relaciones:  

- `progenitor`, `mujer`, `hombre`  

- `padre`, `madre`  

- `hijo`, `hija`  

- `abuelo`, `abuela`  

- `hermano`, `hermana`  

- `tío`, `tía`  

- `sobrino`, `sobrina`  

### Ejercicio 2: Grafo Dirigido

Se tiene un grafo dirigido `({a,b,c,d}, {(a,b),(a,c),(a,d),(c,d)})`. Definir el predicado `camino` en Prolog y graficar el árbol de búsqueda para el objetivo `camino(X,d,Y)`, donde `X` es un vértice y `Y` es el camino, utilizando un programa (por ejemplo, SldDraw).  

## Estructura del Proyecto

```
MM3032-Proyecto-3/
│
├── README.md                   # Documentación del proyecto
│
├── Ejercicio1/                 # Árbol Genealógico
│   ├── Ejercicio1.pl           # Implementación en Prolog
│   ├── Ejercicio1.py           # Interfaz Python con PySwip
│   └── Pruebas.txt             # Ejemplos de consultas
│
└── Ejercicio2/                 # Grafo Dirigido
    ├── Ejercicio2.pl           # Implementación del predicado camino
    ├── Ejercicio2obj.pl        # Consultas de objetivo
    └── otput.pdf               # Resultado del árbol en SldDraw
    
```

## Requisitos y Ejecución

### Requisitos Generales

- **SWI-Prolog**: Instalar desde [swi-prolog.org](https://www.swi-prolog.org/)
- **Python 3.x** (para Ejercicio 1)
- **PySwip** (para Ejercicio 1): `pip install pyswip`
- **SldDraw** (para Ejercicio 2): Para visualización del árbol de búsqueda. Instalar desde [SldDraw 3.4](http://www.lcc.uma.es/~pacog/sldDraw/).

### Ejecutar Ejercicio 1

#### En Prolog:

```bash
swipl
?- load_files(Ejercicio1/Ejercicio1.pl).
?- padre(X, daniel).
```

#### Ejecución

```bash
cd Ejercicio1
python Ejercicio1.py
```

#### Configuración

Puedes modificar las variables en `Ejercicio1.py`:
```python
CONSULTA = "madre(elizabeth, X)"  # Consulta a ejecutar
ISBOOLEAN = False                 # True para consultas booleanas
```

### Ejecutar Ejercicio 2

Este ejercicio se ejecuta en el software de **SldDraw 3.4**.

## Autores

- Daniel Chet (231177)
- Cristian Túnchez (231359)
- Dulce Ambrosio (231143)

## Referencias

- Bratko, I. (2012). *Prolog Programming for Artificial Intelligence*
- Clocksin, W. F., & Mellish, C. S. (2003). *Programming in Prolog*
- Documentación de SWI-Prolog: [https://www.swi-prolog.org/](https://www.swi-prolog.org/)
- PySwip Documentation: [https://github.com/yuce/pyswip](https://github.com/yuce/pyswip)
