#include <iostream>
#include <string>
#include <sstream>
using namespace std;
/*
By: Juan José Goyeneche Sánchez
Matricula: A01712547
Reglas Expresion: 
    MustNot: AA, CCB
    Must: AB
    Universo: A, B, C
*/

bool Regex(string x) {
    bool mustYes = false; // Para ver si se cruzo el puente
    if(x.size() <= 0){
        return false; //Que no este vacio
    }
    // string lenguaje[] = {"A", "B", "C"}; 
    string mustNot[] = {"AA", "CCB"};

    for (int i = 0; i < x.size(); i++) {
        if(x[i] != 'A' && x[i] != 'B' && x[i] != 'C'){ //Que este en el lenguaje
            return false;
        }
        if(x[i] == 'A' & x[i+1] == 'A'){ //MustNot AA
            return false;
        }
        if(x[i] == 'C' & x[i+1] == 'C' & x[i+2] == 'B'){ //MustNot CCB
            return false;
        }
        if(x[i] == 'A' & x[i+1] == 'B'){ //Must AB
            mustYes = true; //Se avisa que se cruzo el puente
        }
    }
    if(mustYes == false){return false;}
    return true;
}

int main() {
    bool result = Regex("ABAAC");
    if(result == true){
        cout << "Valid" << endl;
    }else{
        cout << "Failed" << endl;
    }
    return 0;
}

