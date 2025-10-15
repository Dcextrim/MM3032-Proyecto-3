% =========================
% Ejercicio1.pl — Árbol genealógico (Daniel)
% con primos/primas, nietos/nietas y tíos/tías políticos
% =========================

% --- HECHOS: sexo (agrupados) ---

mujer(maura).
mujer(patty).
mujer(elizabeth).
mujer(karen).
mujer(lidia).
mujer(nicole).
mujer(claudia).
mujer(virginia).
mujer(jocabed).
mujer(katty).
mujer(isabella).
mujer(narnell).

hombre(jose_adan).
hombre(luis).
hombre(pablo).
hombre(jeffrey).
hombre(pablito).
hombre(connor).
hombre(asa).
hombre(antonio).
hombre(tonito).
hombre(oscar).
hombre(daniel).
hombre(david).
hombre(dario).
hombre(obsdy).
hombre(randall).

% --- HECHOS: relaciones de progenitor ---

% Abuelos maternos -> hijos
progenitor(maura, luis).
progenitor(jose_adan, luis).
progenitor(maura, pablo).
progenitor(jose_adan, pablo).
progenitor(maura, patty).
progenitor(jose_adan, patty).
progenitor(maura, elizabeth).
progenitor(jose_adan, elizabeth).

% Parejas de los tíos maternos y sus hijos
progenitor(luis, lidia).
progenitor(karen, lidia).
progenitor(luis, nicole).
progenitor(karen, nicole).

progenitor(pablo, pablito).
progenitor(claudia, pablito).

progenitor(patty, connor).
progenitor(jeffrey, connor).
progenitor(patty, asa).
progenitor(jeffrey, asa).

% Padres de Daniel y David
progenitor(elizabeth, daniel).
progenitor(oscar, daniel).
progenitor(elizabeth, david).
progenitor(oscar, david).

% Abuelos paternos -> hijos
progenitor(virginia, tonito).
progenitor(antonio, tonito).
progenitor(virginia, jocabed).
progenitor(antonio, jocabed).
progenitor(virginia, oscar).
progenitor(antonio, oscar).

% Parejas de los tíos paternos y sus hijos
progenitor(tonito, obsdy).
progenitor(katty, obsdy).
progenitor(tonito, randall).
progenitor(katty, randall).
progenitor(tonito, narnell).
progenitor(katty, narnell).

progenitor(jocabed, isabella).
progenitor(dario, isabella).

% --- HECHOS: matrimonios ---
% Representa relaciones conyugales en dirección única para normalización.
% Ver conyuge/2 para consultas simétricas.

% Abuelos
matrimonio(maura, jose_adan).
matrimonio(virginia, antonio).

% Padres y tíos
matrimonio(luis, karen).
matrimonio(pablo, claudia).
matrimonio(patty, jeffrey).
matrimonio(oscar, elizabeth).
matrimonio(tonito, katty).
matrimonio(jocabed, dario).

% conyuge/2
% Predicado simétrico derivado de matrimonio/2.
% @param X Primer individuo
% @param Y Segundo individuo
% @return true si existe matrimonio(X,Y) ∨ matrimonio(Y,X)
% Implementa la propiedad conmutativa sobre matrimonio/2.

conyuge(X, Y) :- matrimonio(X, Y).
conyuge(X, Y) :- matrimonio(Y, X).

% --- REGLAS DERIVADAS BÁSICAS ---
% Especialización de progenitor/2 por género.

% padre/2
% @param P Progenitor masculino
% @param H Descendiente
% @satisfies progenitor(P, H) ∧ hombre(P)
padre(P, H)  :- progenitor(P, H), hombre(P).

% madre/2
% @param M Progenitor femenino
% @param H Descendiente
% @satisfies progenitor(M, H) ∧ mujer(M)
madre(M, H)  :- progenitor(M, H), mujer(M).

% hijo/2
% @param H Descendiente masculino
% @param P Progenitor
% @satisfies progenitor(P, H) ∧ hombre(H)
hijo(H, P)   :- progenitor(P, H), hombre(H).

% hija/2
% @param H Descendiente femenino
% @param P Progenitor
% @satisfies progenitor(P, H) ∧ mujer(H)
hija(H, P)   :- progenitor(P, H), mujer(H).

% --- RELACIONES DE HERMANDAD ---
% Relación simétrica entre individuos con al menos un progenitor común.

% hermano/2
% @param X Individuo masculino
% @param Y Co-descendiente
% @satisfies ∃P(progenitor(P,X) ∧ progenitor(P,Y) ∧ X≠Y ∧ hombre(X))
hermano(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    X \= Y,
    hombre(X).

% hermana/2
% @param X Individuo femenino
% @param Y Co-descendiente
% @satisfies ∃P(progenitor(P,X) ∧ progenitor(P,Y) ∧ X≠Y ∧ mujer(X))
hermana(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    X \= Y,
    mujer(X).

% --- RELACIONES DE SEGUNDA GENERACIÓN: ABUELOS ---
% Relación transitiva sobre progenitor/2 (composición de funciones).

% abuelo/2
% @param A Progenitor de segundo orden masculino
% @param N Descendiente de segundo orden
% @satisfies ∃P(progenitor(A,P) ∧ progenitor(P,N) ∧ hombre(A))
abuelo(A, N)  :- hombre(A), progenitor(A, P), progenitor(P, N).

% abuela/2
% @param A Progenitor de segundo orden femenino
% @param N Descendiente de segundo orden
% @satisfies ∃P(progenitor(A,P) ∧ progenitor(P,N) ∧ mujer(A))
abuela(A, N)  :- mujer(A),  progenitor(A, P), progenitor(P, N).

% --- RELACIONES COLATERALES DE PRIMER GRADO ---
% Categorización: consanguínea (hermano de progenitor) y afín (cónyuge de consanguíneo).

% tio_consang/2
% Relación masculina colateral consanguínea.
% @param T Hermano masculino de progenitor
% @param S Individuo de referencia
% @satisfies ∃P(progenitor(P,S) ∧ hermano(T,P) ∧ hombre(T))
tio_consang(T, S) :-
    hombre(T),
    progenitor(P, S),
    hermano(T, P).

% tia_consang/2
% Relación femenina colateral consanguínea.
% @param T Hermana femenina de progenitor
% @param S Individuo de referencia
% @satisfies ∃P(progenitor(P,S) ∧ hermana(T,P) ∧ mujer(T))
tia_consang(T, S) :-
    mujer(T),
    progenitor(P, S),
    hermana(T, P).

% tio_politico/2
% Relación masculina colateral por afinidad.
% @param T Cónyuge masculino de hermana de progenitor
% @param S Individuo de referencia
% @satisfies ∃P,A(progenitor(P,S) ∧ hermana(A,P) ∧ conyuge(T,A) ∧ hombre(T))
tio_politico(T, S) :-
    hombre(T),
    progenitor(P, S),
    hermana(A, P),
    conyuge(T, A).

% tia_politica/2
% Relación femenina colateral por afinidad.
% @param T Cónyuge femenino de hermano de progenitor
% @param S Individuo de referencia
% @satisfies ∃P,A(progenitor(P,S) ∧ hermano(A,P) ∧ conyuge(T,A) ∧ mujer(T))
tia_politica(T, S) :-
    mujer(T),
    progenitor(P, S),
    hermano(A, P),
    conyuge(T, A).

% tio/2, tia/2
% Predicados unificados: disyunción de relaciones consanguíneas y afines.
% @return true si tio_consang(T,S) ∨ tio_politico(T,S)
tio(T, S) :- tio_consang(T, S).
tio(T, S) :- tio_politico(T, S).

tia(T, S) :- tia_consang(T, S).
tia(T, S) :- tia_politica(T, S).

% --- RELACIONES INVERSAS: SOBRINOS/SOBRINAS ---
% Relación inversa de tio/2 y tia/2.

% sobrino/2
% @param S Individuo masculino
% @param T Tío o tía de S
% @satisfies hombre(S) ∧ (tio(T,S) ∨ tia(T,S))
sobrino(S, T) :- hombre(S), (tio(T, S) ; tia(T, S)).

% sobrina/2
% @param S Individuo femenino
% @param T Tío o tía de S
% @satisfies mujer(S) ∧ (tio(T,S) ∨ tia(T,S))
sobrina(S, T) :- mujer(S),  (tio(T, S) ; tia(T, S)).

% --- RELACIONES COLATERALES DE SEGUNDO GRADO ---
% Individuos cuyos progenitores son hermanos entre sí.

% primo/2
% @param X Individuo masculino
% @param Y Co-descendiente de hermano de progenitor
% @satisfies ∃PX,PY(progenitor(PX,X) ∧ progenitor(PY,Y) ∧ 
%            (hermano(PX,PY) ∨ hermana(PX,PY)) ∧ hombre(X))
primo(X, Y) :-
    progenitor(PX, X),
    progenitor(PY, Y),
    (hermano(PX, PY) ; hermana(PX, PY)),
    hombre(X).

% prima/2
% @param X Individuo femenino
% @param Y Co-descendiente de hermano de progenitor
% @satisfies ∃PX,PY(progenitor(PX,X) ∧ progenitor(PY,Y) ∧ 
%            (hermano(PX,PY) ∨ hermana(PX,PY)) ∧ mujer(X))
prima(X, Y) :-
    progenitor(PX, X),
    progenitor(PY, Y),
    (hermano(PX, PY) ; hermana(PX, PY)),
    mujer(X).

% primo_o_prima/2
% Predicado no especializado por género.
% @satisfies ∃PX,PY(progenitor(PX,X) ∧ progenitor(PY,Y) ∧ 
%            (hermano(PX,PY) ∨ hermana(PX,PY)))
primo_o_prima(X, Y) :-
    progenitor(PX, X),
    progenitor(PY, Y),
    (hermano(PX, PY) ; hermana(PX, PY)).

% --- RELACIONES INVERSAS DE SEGUNDA GENERACIÓN: NIETOS ---
% Relación inversa de abuelo/2 y abuela/2.

% nieto/2
% @param N Descendiente de segundo orden masculino
% @param A Progenitor de segundo orden
% @satisfies ∃P(progenitor(A,P) ∧ progenitor(P,N) ∧ hombre(N))
nieto(N, A) :-
    hombre(N),
    progenitor(A, P),
    progenitor(P, N).

% nieta/2
% @param N Descendiente de segundo orden femenino
% @param A Progenitor de segundo orden
% @satisfies ∃P(progenitor(A,P) ∧ progenitor(P,N) ∧ mujer(N))
nieta(N, A) :-
    mujer(N),
    progenitor(A, P),
    progenitor(P, N).

% nieto_o_nieta/2
% Predicado no especializado por género.
% @satisfies ∃P(progenitor(A,P) ∧ progenitor(P,N))
nieto_o_nieta(N, A) :-
    progenitor(A, P),
    progenitor(P, N).