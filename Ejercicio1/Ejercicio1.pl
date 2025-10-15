% ------------------------------------
%  Ejercicio1.pl — Árbol Genealógico
% ------------------------------------

% HECHOS: Un predicado (relación) entre objetos.

% 1. Mujeres -> Relación: <nombre> es mujer

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



% 2. Hombres -> Relación: <nombre> es hombre

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



% 3. Progenitores -> Relación: <nombre> es progenitor de <nombre>

% Abuelos Maternos --------------------

progenitor(maura, luis).
progenitor(jose_adan, luis).
progenitor(maura, pablo).
progenitor(jose_adan, pablo).
progenitor(maura, patty).
progenitor(jose_adan, patty).
progenitor(maura, elizabeth).
progenitor(jose_adan, elizabeth).

% Tíos maternos --------------------

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

% Padres ------------------------------

progenitor(elizabeth, daniel).
progenitor(oscar, daniel).
progenitor(elizabeth, david).
progenitor(oscar, david).

% Abuelos Paternos --------------------

progenitor(virginia, tonito).
progenitor(antonio, tonito).
progenitor(virginia, jocabed).
progenitor(antonio, jocabed).
progenitor(virginia, oscar).
progenitor(antonio, oscar).

% Tíos Paternos --------------------

progenitor(tonito, obsdy).
progenitor(katty, obsdy).
progenitor(tonito, randall).
progenitor(katty, randall).
progenitor(tonito, narnell).
progenitor(katty, narnell).

progenitor(jocabed, isabella).
progenitor(dario, isabella).



% 4. Padre -> Relación: <nombre> es padre de <nombre>

% Abuelos Maternos --------------------

padre(jose_adan, luis).
padre(jose_adan, pablo).
padre(jose_adan, patty).
padre(jose_adan, elizabeth).

% Tíos maternos --------------------

padre(luis, lidia).
padre(luis, nicole).

padre(pablo, pablito).

padre(jeffrey, connor).
padre(jeffrey, asa).

% Padres ------------------------------

padre(oscar, daniel).
padre(oscar, david).

% Abuelos Paternos --------------------

padre(antonio, tonito).
padre(antonio, jocabed).
padre(antonio, oscar).

% Tíos Paternos --------------------

padre(tonito, obsdy).
padre(tonito, randall).
padre(tonito, narnell).

padre(dario, isabella).



% 5. Madre -> Relación: <nombre> es madre de <nombre>

% Abuelos Maternos --------------------

madre(maura, luis).
madre(maura, pablo).
madre(maura, patty).
madre(maura, elizabeth).

% Tíos maternos --------------------

madre(karen, lidia).
madre(karen, nicole).

madre(claudia, pablito).

madre(patty, connor).
madre(patty, asa).

% Padres ------------------------------

madre(elizabeth, daniel).
madre(elizabeth, david).

% Abuelos Paternos --------------------

madre(virginia, tonito).
madre(virginia, jocabed).
madre(virginia, oscar).

% Tíos Paternos --------------------

madre(katty, obsdy).
madre(katty, randall).
madre(katty, narnell).

madre(jocabed, isabella).



% 6. Hijo -> Relación: <nombre> es hijo de <nombre>

% Abuelos Maternos --------------------

hijo(luis, maura).
hijo(luis, jose_adan).
hijo(pablo, maura).
hijo(pablo, jose_adan).

% Tíos maternos --------------------

hijo(pablito, claudia).
hijo(pablito, pablo).

hijo(connor, patty).
hijo(asa, jeffrey).

% Padres ------------------------------

hijo(daniel, elizabeth).
hijo(daniel, oscar).
hijo(david, elizabeth).
hijo(david, oscar).

% Abuelos Paternos --------------------

hijo(tonito, virginia).
hijo(tonito, antonio).
hijo(oscar, virginia).
hijo(oscar, antonio).

% Tíos Paternos --------------------

hijo(obsdy, katty).
hijo(obsdy, tonito).
hijo(randall, katty).
hijo(randall, tonito).



% 7. Hija -> Relación: <nombre> es hija de <nombre>

% Abuelos Maternos --------------------

hija(patty, maura).
hija(patty, jose_adan).
hija(elizabeth, maura).
hija(elizabeth, jose_adan).

% Tíos maternos --------------------

hija(lidia, karen).
hija(lidia, luis).
hija(nicole, karen).
hija(nicole, luis).

% Abuelos Paternos --------------------

hija(jocabed, virginia).
hija(jocabed, antonio).

% Tíos Paternos --------------------

hija(narnell, katty).
hija(narnell, tonito).

hija(isabella, jocabed).
hija(isabella, dario).



% 8. Abuelo -> Relación: <nombre> es abuelo de <nombre>

% Abuelos Maternos --------------------

abuelo(jose_adan, lidia).
abuelo(jose_adan, nicole).
abuelo(jose_adan, pablito).
abuelo(jose_adan, connor).
abuelo(jose_adan, asa).
abuelo(jose_adan, daniel).
abuelo(jose_adan, david).

% Abuelos Paternos --------------------

abuelo(antonio, obsdy).
abuelo(antonio, randall).
abuelo(antonio, narnell).
abuelo(antonio, isabella).
abuelo(antonio, daniel).
abuelo(antonio, david).



% 9. Abuela -> Relación: <nombre> es abuela de <nombre>

% Abuelos Maternos --------------------

abuela(maura, lidia).
abuela(maura, nicole).
abuela(maura, pablito).
abuela(maura, connor).
abuela(maura, asa).
abuela(maura, daniel).
abuela(maura, david).

% Abuelos Paternos --------------------

abuela(virginia, obsdy).
abuela(virginia, randall).
abuela(virginia, narnell).
abuela(virginia, isabella).
abuela(virginia, daniel).
abuela(virginia, david).



% 10. Hermano -> Relación: <nombre> es hermano de <nombre>

% Abuelos Maternos --------------------

hermano(luis, pablo).
hermano(luis, patty).
hermano(luis, elizabeth).
hermano(pablo, luis).
hermano(pablo, patty).
hermano(pablo, elizabeth).

% Tíos maternos --------------------

hermano(connor, asa).
hermano(asa, connor).

% Padres ------------------------------

hermano(daniel, david).
hermano(david, daniel).

% Abuelos Paternos --------------------

hermano(tonito, jocabed).
hermano(tonito, oscar).
hermano(oscar, tonito).
hermano(oscar, jocabed).

% Tíos Paternos --------------------

hermano(obsdy, randall).
hermano(obsdy, narnell).
hermano(randall, obsdy).
hermano(randall, narnell).



% 11. Hermana -> Relación: <nombre> es hermana de <nombre>

% Abuelos Maternos --------------------

hermana(patty, luis).
hermana(patty, pablo).
hermana(patty, elizabeth).
hermana(elizabeth, luis).
hermana(elizabeth, pablo).
hermana(elizabeth, patty).

% Tíos maternos --------------------

hermana(lidia, nicole).
hermana(nicole, lidia).

% Abuelos Paternos --------------------

hermana(jocabed, tonito).
hermana(jocabed, oscar).

% Tíos Paternos --------------------

hermana(narnell, obsdy).
hermana(narnell, randall).



% 12. Tío -> Relación: <nombre> es tío de <nombre>

% Tíos maternos --------------------

tio(luis, pablito).
tio(luis, connor).
tio(luis, asa).
tio(luis, daniel).
tio(luis, david).

tio(pablo, lidia).
tio(pablo, nicole).
tio(pablo, connor).
tio(pablo, asa).
tio(pablo, daniel).
tio(pablo, david).

% Padres ------------------------------

tio(oscar, obsdy).
tio(oscar, randall).
tio(oscar, narnell).
tio(oscar, isabella).

% Tíos Paternos --------------------

tio(tonito, isabella).
tio(tonito, daniel).
tio(tonito, david).



% 13. Tía -> Relación: <nombre> es tía de <nombre>

% Tíos maternos --------------------

tia(patty, lidia).
tia(patty, nicole).
tia(patty, pablito).
tia(patty, daniel).
tia(patty, david).

% Padres ------------------------------

tia(elizabeth, lidia).
tia(elizabeth, nicole).
tia(elizabeth, pablito).
tia(elizabeth, connor).
tia(elizabeth, asa).

% Tíos Paternos --------------------

tia(jocabed, obsdy).
tia(jocabed, randall).
tia(jocabed, narnell).
tia(jocabed, daniel).
tia(jocabed, david).



% 14. Primo -> Relación: <nombre> es primo de <nombre>

% Tíos maternos --------------------

primo(pablito, lidia).
primo(pablito, nicole).
primo(pablito, connor).
primo(pablito, asa).
primo(pablito, daniel).
primo(pablito, david).

primo(connor, lidia).
primo(connor, nicole).
primo(connor, pablito).
primo(connor, daniel).
primo(connor, david).
primo(asa, lidia).
primo(asa, nicole).
primo(asa, pablito).
primo(asa, daniel).
primo(asa, david).

% Padres ------------------------------

primo(daniel, lidia).
primo(daniel, nicole).
primo(daniel, pablito).
primo(daniel, connor).
primo(daniel, asa).
primo(david, lidia).
primo(david, nicole).
primo(david, pablito).
primo(david, connor).
primo(david, asa).

primo(daniel, obsdy).
primo(daniel, randall).
primo(daniel, narnell).
primo(daniel, isabella).
primo(david, obsdy).
primo(david, randall).
primo(david, narnell).
primo(david, isabella).

% Tíos Paternos --------------------

primo(obsdy, isabella).
primo(obsdy, daniel).
primo(obsdy, david).
primo(randall, isabella).
primo(randall, daniel).
primo(randall, david).



% 15. Prima -> Relación: <nombre> es prima de <nombre>

% Tíos maternos --------------------

prima(lidia, pablito).
prima(lidia, connor).
prima(lidia, asa).
prima(lidia, daniel).
prima(lidia, david).
prima(nicole, pablito).
prima(nicole, connor).
prima(nicole, asa).
prima(nicole, daniel).
prima(nicole, david).

% Tíos Paternos --------------------

prima(narnell, isabella).
prima(narnell, daniel).
prima(narnell, david).

prima(isabella, obsdy).
prima(isabella, randall).
prima(isabella, narnell).
prima(isabella, daniel).
prima(isabella, david).



% --------------------| COMO REGLAS |--------------------

% padre(X, Y) :- hombre(X), progenitor(X, Y).
% madre(X, Y) :- mujer(X), progenitor(X, Y).

% hijo(X, Y) :- hombre(X), progenitor(Y, X).
% hija(X, Y) :- mujer(X), progenitor(Y, X).

% abuelo(X, Y) :- hombre(X), progenitor(X, Z), progenitor(Z, Y).
% abuela(X, Y) :- mujer(X), progenitor(X, Z), progenitor(Z, Y).

% hermano(X, Y) :- hombre(X), progenitor(Z, X), progenitor(Z, Y), X \= Y.
% hermana(X, Y) :- mujer(X), progenitor(Z, X), progenitor(Z, Y), X \= Y.

% tio(X, Y) :- hermano(X, Z), progenitor(Z, Y).
% tia(X, Y) :- hermana(X, Z), progenitor(Z, Y).

% primo(X, Y) :- tio(Z, Y), progenitor(Z, X).
% prima(X, Y) :-  tia(Z, Y), progenitor(Z, X).
