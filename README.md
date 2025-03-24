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

### Casos Erroneos Most Not Have (It´s a Trapp): AA, CCB
Para asegurar que cuando existan los casos 'Must not have' deberemos de hacer que siempre que se escriban estas cadenas no se pueda llegar al estado terminal. ¿Como se consigue esto? Bueno pues deberemos crear un bucle donde tras la combinación de cadena AA o CCB se llegue al "Estado Trampa", ya estando en ese estado cualquier cadena que se introduzca (A,B,C), te llevaran de vuelta al mismo "Estado Trampa" asi evitando que se llegue nunca al estado terminal por lo cual fallara.  
![image](https://github.com/user-attachments/assets/2b4e8ff8-5807-42da-881c-acf0ef1dae74)

Imagen ejemplo, Q2 seria el caso trampa (no debera ser terminal).

### Cadena Most Have (Puente de Khazad-dûm): AB
La cadena debera de tener en algun momento la combinación AB para poder ser aceptada, ¿Como podemos realizar esto? Necesitaremos generar un "puente", el puente de Khazad-dûm le llamaremos. Este sera un puente que si queremos llegar a nuestro destino osease estados terminales lo deberemos de cruzar. La parte de antes y despues del puente deberan ser identicos o almenos equivalentes, porque las demas reglas deberan seguir existiendo, la unica diferencia es que en la sección despues del puente deberemos de incluir los estados terminales.

![image](https://github.com/user-attachments/assets/21873c6e-bee5-4360-a184-ef1ccf0282cc)

Imagen Ejemplo Simbolica.

### Expresion Regular
LAs expresiones regulares (R.E.) son equivalentes de los automatas, por lo cual todo automata puede ser descrito como expresion regular. Estas son una secuencia de caracteres que conforma un patrón de búsqueda. Se utilizan principalmente para la busqueda de patrones de cadenas, caracteres u operaciones de sustituciones. Tiene simbolos como indicaciónes que se podran apreciar en la tabla. 

![image](https://github.com/user-attachments/assets/31f99ed6-b84c-436b-b97f-c959ce0e0ce2)

Al inicio para traducir mi Automata a una expresion regular llegue a lo siguiente: ((a(b|c))*((c*a)(c|b))*)*ab((a(b|c))*((c*a)(c|b))*)*. Esta expersion podria ir bien encaminada, pero, necesitaria mas especificaciones para hacer la expresion correcta, lo cual nos dejaria con una expresion regular bastante larga, razon por la cuale se tuvo que investigar de mas herramienteas para escribir la expresion.

#### Lookahead Positive | Negative
El lookahead es una asersion que se usa para hacer busquedas de coincidencias dentro de la cadena.

X(?= Y)

En este caso en un punto la expreion regular llegara a la X y el lookahead lo que hara sera buscar si depues de la X existe una coincidencia con una Y de manera inmediata, en caso de que no la haya, esta expresion la seguira buscando. Esta expresion encontrara "X" en "XY", pero no "X" en "XZ".

^(?=.*XYY)[XYZ]+$

Esta expresion encontrara toda expreion que en algun punto cuente con la cadena "XYY", y solo se usen palabras del lenguaje XYZ. 

Se hace uso de ".*" para que se siga buscando en toda la cadena, si la primera vez no se encontro.

  punto (.): 
Coincide con cualquier carácter individual, excepto con el carácter de nueva línea (\n).

 asterisco (*): 
Coincide con el carácter o grupo de caracteres anteriores de la expresión regular de cero o más veces.

![image](https://github.com/user-attachments/assets/7b78136d-35cf-4fdd-a8d9-8236e2f91a24)

^(?=.*AB)(?!.*AA)(?!.*CCB)[ABC]+$

![image](https://github.com/user-attachments/assets/f2e31af4-5873-4b05-b251-334291caae94)

![image](https://github.com/user-attachments/assets/8d8aac51-a44f-4bfd-bd56-d390b7e1ed24)


### Referencias
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion

https://blog.fergv.com/js/regex/#condicionales

https://support.google.com/a/answer/1371415?hl=es 

https://www.ibm.com/docs/es/i/7.3?topic=expressions-regular
