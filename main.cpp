#include <iostream>
#include <cstdio>

#include "parser.tab.h"

extern int yyparse();
extern int yylex(); 
extern FILE* yyin;
extern char* yytext; 

int main(int argc, char** argv)
{
    if (argc < 2) {
        std::cerr << "TODO: Usage: compiler <file>\n";
        return 1;
    }

    FILE* file = fopen(argv[1], "r");

    if (!file) {
        std::cerr << "Could not open file: " << argv[1] << '\n';
        return 1;
    }

    yyin = file;


    if (yyparse() == 0) {
        std::cout << "Parsing successful!\n";
    } else {
        std::cout << "Parsing failed!\n";
    }

    // int token; 
    // while ((token = yylex()) != 0) {
    //     std::cout << "Token: " << token << std::endl; 
    //     std::cout << "    Text: " << yytext << std::endl; 
    // }

    fclose(file);

    return 0;
}
