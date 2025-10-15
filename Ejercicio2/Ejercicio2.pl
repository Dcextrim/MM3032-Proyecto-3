% ------------------------------------
%  Ejercicio2.pl — Grafo Dirigido
% ------------------------------------

% Representación del grafo dirigido --------------------

% 1. Definición de los arcos del grafo

arco(a, b).
arco(a, c).
arco(a, d).
arco(c, d).

% 2. Definición de nodos (se pueden inferir de los arcos) 

es_nodo(X) :- arco(X, _).
es_nodo(X) :- arco(_, X).


% Predicado camino(+Origen, +Destino, -Camino) --------------------

% 1. Caso base: Si hay un arco directo entre Origen y Destino el camino es [Origen, Destino]

camino(Origen, Destino, [Origen, Destino]) :- arco(Origen, Destino).

% 2. Caso recursivo: Si existe un nodo intermedio el camino incluye el nodo intermedio y el resto del camino

camino(Origen, Destino, [Origen|RestoCamino]) :-
    arco(Origen, Intermedio),
    camino(Intermedio, Destino, RestoCamino).
