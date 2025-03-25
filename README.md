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
Un estado terminal es en un autómata un estado final que se alcanza cuando el autómata lee una cadena de caracteres que cumple con sus especificaciones, cuando un automata termina de leer la cadena y se encuentra en este estado terminal sera un caso de exito, en cambio si termina de leer la cadena y no se encuentra en un estado terminal sera un fallo.

### Casos Erroneos Must Not Have (It´s a Trapp): AA, CCB
Para asegurar que cuando existan los casos 'Must not have' deberemos de hacer que siempre que se escriban estas cadenas no se pueda llegar al estado terminal. ¿Como se consigue esto? Bueno pues deberemos crear un bucle donde tras la combinación de cadena AA o CCB se llegue al "Estado Trampa", ya estando en ese estado cualquier cadena que se introduzca (A,B,C), te llevaran de vuelta al mismo "Estado Trampa" asi evitando que se llegue nunca al estado terminal por lo cual fallara.  

![image](https://github.com/user-attachments/assets/2b4e8ff8-5807-42da-881c-acf0ef1dae74)

Imagen ejemplo, Q2 seria el caso trampa (no debera ser terminal).

### Cadena Must Have (Puente de Khazad-dûm): AB
La cadena debera de tener en algun momento la combinación AB para poder ser aceptada, ¿Como podemos realizar esto? Necesitaremos generar un "puente", el puente de Khazad-dûm le llamaremos. Este sera un puente que si queremos llegar a nuestro destino osease estados terminales lo deberemos de cruzar. La parte de antes y despues del puente deberan ser identicos o almenos equivalentes, porque las demas reglas deberan seguir existiendo, la unica diferencia es que en la sección despues del puente deberemos de incluir los estados terminales.

![image](https://github.com/user-attachments/assets/794832ee-ec74-4437-865c-c868bceea488)

Imagen Ejemplo Simbolica.

### Expresion Regular
LAs expresiones regulares (R.E.) son equivalentes de los automatas, por lo cual todo automata puede ser descrito como expresion regular. Estas son una secuencia de caracteres que conforma un patrón de búsqueda. Se utilizan principalmente para la busqueda de patrones de cadenas, caracteres u operaciones de sustituciones. Tiene simbolos como indicaciónes que se podran apreciar en la tabla. 

![image](https://github.com/user-attachments/assets/31f99ed6-b84c-436b-b97f-c959ce0e0ce2)

Al inicio para traducir mi Automata a una expresion regular llegue a lo siguiente: __((a(b|c))*((c*a)(c|b))*)*ab((a(b|c))*((c*a)(c|b))*)*.__ Esta expersion podria ir bien encaminada, pero, necesitaria mas especificaciones para hacer la expresion correcta, lo cual nos dejaria con una expresion regular bastante larga, razon por la cuale se tuvo que investigar de mas herramienteas para escribir la expresion.

#### Lookahead Positive | Negative
El lookahead es una asersion que se usa para hacer busquedas de coincidencias dentro de la cadena.
```
X(?= Y)
```
En este caso en un punto la expreion regular llegara a la X y el lookahead lo que hara sera buscar si depues de la X existe una coincidencia con una Y de manera inmediata, en caso de que no la haya, esta expresion la seguira buscando. Esta expresion encontrara "X" en "XY", pero no "X" en "XZ".
```
^(?=.*XYY)[XYZ]+$
```
Esta expresion encontrara toda expreion que en algun punto cuente con la cadena "XYY", y solo se usen palabras del lenguaje XYZ. 

Se hace uso de ".*" para que se siga buscando en toda la cadena, si la primera vez no se encontro.


  **punto (.):**
Coincide con cualquier carácter individual, excepto con el carácter de nueva línea (\n).

 **asterisco (*):** 
Coincide con el carácter o grupo de caracteres anteriores de la expresión regular de cero o más veces.

![image](https://github.com/user-attachments/assets/7b78136d-35cf-4fdd-a8d9-8236e2f91a24)

La expresion regular haciendo uso de los lookaheads, donde se especifique que se encuentre AB **"(?=.*AB)"**, y que no se identifique AA **"(?!.*AA)"**, ni CCB, **"(?!.*CCB)"**. Todo esto aceptando solo caracteres ABC, **"[ABC]"**.

```
^(?=.*AB)(?!.*AA)(?!.*CCB)[ABC]+$
```

Esta misma funcion se podria simplificar a lo siguiente: 

```
^(?=.*AB)(?!.*AA|.*CCB)[ABC]+$
```

![image](https://github.com/user-attachments/assets/f2e31af4-5873-4b05-b251-334291caae94)

![image](https://github.com/user-attachments/assets/8d8aac51-a44f-4bfd-bd56-d390b7e1ed24)


### Programación Regex
Se programo esto tanto en C++, como en prolog. El codigo de C++ es bastante simple por lo cual nos centraremos en explicar el codigo de prolog.
```
regex(Lista) :-
    musthaveAB(Lista),
    mustNotAA(Lista),
    mustNotCCB(Lista).
```
Esta función muestra la expresion regular como tal, dando las indicaciones que especifica la problematica.

```
musthaveAB(Lista) :- 
    isIn(['A','B'], Lista).

mustNotAA(Lista) :- 
    \+ isIn(['A','A'], Lista).

mustNotCCB(Lista) :- 
    \+ isIn(['C','C','B'], Lista).
```
Se llamara a la funcion "isIn" para buscar la subCadena que se especifique. En los casos de "AA" y "CCB", se usara **\+** lo cual se denomina como no demostrable, en caso de que se encuentre la subCadena especificada sera una función falsa.

```
isIn([], _).  % Caso Base
isIn(Must, Lista) :-
    equivalente(Must, Lista). %verifica si la subcadena esta en la lista
isIn(Must, [_|Cola]) :-      
    isIn(Must, Cola). %Se quita el primer valor de la lista yse sigue buscando en los siguientes valores de esta.

equivalente([], _). %Caso base para cuando se hayan comparando todos los elementos de la subcadena
equivalente([H|ColaResto], [H|ListaResto]) :- % H==H
    equivalente(ColaResto, ListaResto). %Compara elementos hasta que subcadena este vacia
```
Se explica con los comentarios en el code.

### Complejidad
La complejidad que tiene la función regex, al ejecutrse depende de varios factores, como el input de la lista que se haga asi, como tambien, las demas funciones que se llaman dentro de esta función.
  - **Inisiación:** Se empezara creado la lista que haremos como entrada, esto tendra la complejidad de O(1).
  - **Regex:** La funcion verificara que se cumplan las especificaciónes del regex esto llamara a 3 funciones que comparten complejidad pero son diferentes.
  - **Caso Base**: El caso base isIn([],_) tendra una complejidad de o(1).
  - **Recursividad Completa:** Cada función mustHave... llamara a isIn(), la cual llamara (en caso de no estar vacia) a equivalentes(), y a si misma. La complejidad de esto asi como del codigo entero sera la suma de todo el analisis y la complejidad de esta funcion dependera del tipo de entrada que se le de osea la lista.
```
o(1) + o(1) + o(n) + o(n) + o(n) = o(n)
```
  - **Mejor caso**: o(k * n), k > 1, = o(n).

### Referencias
Mozilla Developer Network. (n.d.). Lookahead assertion. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion

Fernández, G. V. (n.d.). Expresiones regulares en JavaScript. Blog Fergv. https://blog.fergv.com/js/regex/#condicionales

Google. (n.d.). Sintaxis de expresiones regulares. Google Workspace Admin Help. https://support.google.com/a/answer/1371415?hl=es

IBM. (n.d.). Expresiones regulares. IBM Documentation. https://www.ibm.com/docs/es/i/7.3?topic=expressions-regular

Benjaminiva, (n.d). Regular Expresions. https://docs.google.com/document/d/16_TvqEI5BKINc9mcenIDyCFd7nwTW8Kv1upZB4eO27U/edit?tab=t.0
