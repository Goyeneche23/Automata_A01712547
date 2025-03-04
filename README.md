# Automata_A01712547
### By: Juan José Goyeneche Sánchez
## Description
De las opciones disponibles en el excel, se selecciono la opción 42 del tipo "Math language", Este legnauaje cuenta con las siguientes reglas: 
- Inputs: A, B, C
- Must not have: AA,  CCB
- Must have: AB

Apartir de esto sabemos que su universo es  Σ = A, B, C. Conociendo este hecho de que el usuario cuenta con 3 posibles letras de entrada que podran llevar a diferentes estado, esto nos lleva a tener un Automata Finito No Deterministico (AFND). 
![image](https://github.com/user-attachments/assets/e7eeb49d-f243-41d6-ba11-a4cce002d6ef)

## Casos Erroneos (It´s a Trapp)


  
((a(b|c))*((c*a)(c|b))*)*ab((a(b|c))*((c*a)(c|b))*)*
