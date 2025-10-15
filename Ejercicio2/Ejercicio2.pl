% ==============================================
% Ejercicio2.pl — Caminos en un grafo dirigido
% Grafo: nodos {a,b,c,d}, arcos {(a,b),(a,c),(a,d),(c,d)}
% ==============================================

% --- Nodos y arcos ---
nodo(a). nodo(b). nodo(c). nodo(d).

arco(a,b).
arco(a,c).
arco(a,d).
arco(c,d).

% --- Utilidades de listas (definidas aquí para evitar dependencias) ---
% member/2
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

% append/3
append([], L, L).
append([H|T], L, [H|R]) :- append(T, L, R).

% no_member/2 (sin negación; usa desigualdad estructural)
no_member(_, []).
no_member(X, [H|T]) :- X \= H, no_member(X, T).

% ----------------------------------------------
% Camino con control de "visitados"
% Construye el camino en orden natural (X ... Y) sin reverse/2
% ----------------------------------------------
camino(X, Y, Camino) :-
    nodo(X), nodo(Y),
    camino(X, Y, [X], Camino).

% Caso base: Actual -> Destino (arco directo)
camino(Actual, Destino, Visitados, Camino) :-
    arco(Actual, Destino),
    append(Visitados, [Destino], Camino).

% Paso recursivo: Actual -> Siguiente, Siguiente aún no visitado
camino(Actual, Destino, Visitados, Camino) :-
    arco(Actual, Siguiente),
    no_member(Siguiente, Visitados),
    append(Visitados, [Siguiente], Visitados1),
    camino(Siguiente, Destino, Visitados1, Camino).

