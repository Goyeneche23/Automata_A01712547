#include <iostream>
#include <string>
#include <sstream>
using namespace std;

bool Regex(string x) {
    bool mustYes = false;
    if(x.size() <= 0){
        return false;
    }
    string lenguaje[] = {"A", "B", "C"};
    string mustNot[] = {"AA", "CCB"};

    for (int i = 0; i < x.size(); i++) {
        if(x[i] != 'A' && x[i] != 'B' && x[i] != 'C'){
            return false;
        }
        if(x[i] == 'A' & x[i+1] == 'A'){
            return false;
        }
        if(x[i] == 'C' & x[i+1] == 'C' & x[i+2] == 'B'){
            return false;
        }
        if(x[i] == 'A' & x[i+1] == 'B'){
            mustYes = true;
        }
    }
    if(mustYes == false){return false;}
    return true;
}

void valid(string Test, string Lista){
    cout << Test << endl;
    bool result = Regex(Lista);
    if(result == true){
        cout << "Valid" << endl;
    }else{
        cout << "Failed" << endl;
    }
    cout << "-----------------" << endl;
}

int main() {
    valid("Test_1", ("ACACCCABCCCA")); //Exp Valid
    valid("Test_2", ("AACACCCB")); //Exp Failed
    valid("Test_3", ("ACCCCCCCCCCCCAB")); //ExpValid
    valid("Test_4", ("CACACACACACA")); //Exp Failed
    valid("Test_5", ("ABC")); //Exp Valid
    valid("Test_6", ("ACC")); //Exp Failed
    valid("Test_7", ("CCABABABABCA")); //Exp Valid
    valid("Test_8", ("ABCCB")); //ExpFailed

    return 0;
}
