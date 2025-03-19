# Automata_A01712547
### By: Juan José Goyeneche Sánchez
## Description
De las opciones disponibles en el excel, se selecciono la opción 42 del tipo "Math language", Este legnauaje cuenta con las siguientes reglas: 
- Inputs: A, B, C
- Must not have: AA,  CCB
- Must have: AB
Ej:
- Success: ABA, ACCABA, AB, CCABAC
- Fail: A, CCCCA, ABAA, ACCBABA, ACACB

Apartir de esto sabemos que su universo es  Σ = A, B, C. Conociendo este hecho de que el usuario cuenta con 3 posibles letras de entrada que podran llevar a diferentes estado, esto nos lleva a tener un Automata Finito No Deterministico (AFND). 
![image](https://github.com/user-attachments/assets/e7eeb49d-f243-41d6-ba11-a4cce002d6ef)

### Automana Finito
El automata finito nace como un modelo matematico de una máquina que acepta cadenas de un lenguaje definido, esta maquina tiene un conjunto finito de estados y las cadenas del lenguaje son las que determinaran las transciciones de entre estos estados. La primera aproximación a un modelo parecido la tuvo el matematico Ruso Andrei Markov con la cadena de Markov, donde la ocurrencia de cada evento depende con una cierta probabilidad del evento anterior. Posteriormente en el siglo XX se definieron de mejor manera los automatas finitos, pero lo que pasa en la cadena de Markov donde cada evento depende del anterior se sigue manteniendo de cierta manera. En nuestro caso tenemos solo A, B, C como lenguaje pero las combinaciones de estos son los que nos llevan a los estados, por lo cual la cadena "A" podra llegar a un estados diferente que la cadena "BA". Algo importante para continuar es que los Automatas no cuentan con una memoria por lo cual solo podran realizar lenguajes de tipo A^n B.

#### Estado Terminal
L

## Casos Erroneos (It´s a Trapp): AA, CCB
Para asegurar que cuando existan los casos 'Must not have' deberemos de hacer que siempre que se escriban estas cadenas no se pueda llegar al estado terminal. ¿Como se consigue esto? Bueno pues deberemos crear un bucle donde tras la combinación de cadena AA o CCB se llegue al "Estado Trampa", ya estando en ese estado cualquier cadena que se introduzca (A,B,C), te llevaran de vuelta al mismo "Estado Trampa" asi evitando que se llegue nunca al estado terminal por lo cual fallara.  
![image](https://github.com/user-attachments/assets/2b4e8ff8-5807-42da-881c-acf0ef1dae74)
Imagen ejemplo, Q2 seria el caso trampa (no debera ser terminal).



  
((a(b|c))*((c*a)(c|b))*)*ab((a(b|c))*((c*a)(c|b))*)*
