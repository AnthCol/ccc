#include <iostream>
#include <cstdio>

#include "parser.tab.h"

extern int yyparse();
extern FILE* yyin;

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

    fclose(file);

    return 0;
}
