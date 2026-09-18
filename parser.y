%require "3.2"
%language "C++"
%skeleton "lalr1.cc"

%define api.value.type {int}
%define parse.assert

%{
#include <iostream>
#include 
int yylex(); 
void yyerror(const char* s); 
%}

%token NUMBER
%token PLUS "+"
%token TIMES "*"

%%

input:
    NUMBER PLUS NUMBER
    {
        std::cout << $1 + $3 << std::endl; 
    }; 

%%

namespace yy {
    void parser::yyerror(const std::string& msg) {
        std::cerr << "Error: " << msg << std::endl; 
    }
}
