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

isIn(must, List) :-
    append(_, RList, List),
    append(must, _, RList).
