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

test_1 :-   %Exp True
    regex(['A','B']).
test_2 :-	%Exp True
    regex(['A','B','C']).
test_3 :-	%Exp Fail
    regex(['A','B','B','A','A']).
test_4 :-	%Exp true
    regex(['B','A','B','A']).
test_5 :-	%Exp Fail
    regex(['C','A','C','A','B','C','C','B']).
