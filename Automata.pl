% By: Juan José Goyeneche Sánchez
% A01712547
% No: AA, CCB
% Must: AB
move(q0,q1,a).
move(q0,q0,b).
move(q0,q3,c).
move(q1,q2,a). %Basura AA
move(q1,q5,b). %Entrada a terminales (Se cumple AB)
move(q1,q3,c).
move(q2,q2,a).
move(q2,q2,b).
move(q2,q2,c).
move(q3,q1,a).
move(q3,q0,b).
move(q3,q4,c).
move(q4,q1,a).
move(q4,q2,b). %Basura CCB
move(q4,q4,c).
move(q5,q6,a).
move(q5,q5,b).
move(q5,q7,c).
move(q6,q2,a). %Basura AA
move(q6,q5,b).
move(q6,q7,c).
move(q7,q6,a).
move(q7,q5,b).
move(q7,q8,c).
move(q8,q6,a). %Basura CCB
move(q8,q2,b).
move(q8,q8,c).
terminal(q5).  %Caso Exito
terminal(q6).  %Caso Exito
terminal(q7).  %Caso Exito
terminal(q8).  %Caso Exito

viaje(Lista) :- %Funcion Recorrido
    viajeEstado(Lista, q0). %Posicion Inicial
%If o parecido
viajeEstado([], Estado) :- %Llegaremos a esta funcion cuando lista vacia
    terminal(Estado), %el estado en el que nos encontramos (ultimo)es "terminal"
    write('Accepted'), nl. 
viajeEstado([H|T], Estado) :- %nos
    move(Estado, Destino, H),
    viajeEstado(T, Destino).
