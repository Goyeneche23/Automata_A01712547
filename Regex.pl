% By: Juan José Goyeneche Sánchez
% A01712547
% No: AA, CCB
% Must: AB
% Regex: ^(?=
regex(Lista) :-
    musthaveAB(Lista),
    mustNotAA(Lista),
    mustNotCCB(Lista).

musthaveAB(Lista) :- isIn(['A','B'], Lista).

mustNotAA(Lista) :- \+ isIn(['A','A'], Lista).

mustNotCCB(Lista) :- \+ isIn(['C','C','B'], Lista).

isIn([], _).  % Caso Base
isIn(Must, Lista) :-
    equivalente(Must, Lista).  % Verifica si Sub es prefijo de List
isIn(Must, [_|Cola]) :-      % Si no, sigue buscando en la cola
    isIn(Must, Cola).

equivalente([], _).
equivalente([H|ColaResto], [H|ListaResto]) :-
    equivalente(ColaResto, ListaResto).
