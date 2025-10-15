% ----------------------------------------------
% GOALS (para usar directo en SldDraw)
% ----------------------------------------------
% Objetivo general: todas las X que llegan a d y su camino
goal :- camino(X, d, Y).

% Objetivos específicos (por si quieres árboles separados)
goal_a :- camino(a, d, Y).
goal_c :- camino(c, d, Y).