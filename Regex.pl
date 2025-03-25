% By: Juan José Goyeneche Sánchez
% A01712547
% No: AA, CCB
% Must: AB
% Regex: ^(?=
% Los comentarios se encuentran en el readme.md
% Se espera que el usuario ponga letras de la cadena ABC
regex(Lista) :-
    musthaveAB(Lista),
    mustNotAA(Lista),
    mustNotCCB(Lista).

musthaveAB(Lista) :- 
    isIn(['A','B'], Lista).

mustNotAA(Lista) :- 
    \+ isIn(['A','A'], Lista).

mustNotCCB(Lista) :- 
    \+ isIn(['C','C','B'], Lista).

isIn([], _).  % Caso Base
isIn(Must, Lista) :-
    equivalente(Must, Lista). 
isIn(Must, [_|Cola]) :-      
    isIn(Must, Cola).

equivalente([], _).
equivalente([H|ColaResto], [H|ListaResto]) :-
    equivalente(ColaResto, ListaResto).
