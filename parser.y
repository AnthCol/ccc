%{

#include <iostream>

extern int yylex();
void yyerror(const char* s);

%}

%define api.value.type {int}

%token NUMBER
%token PLUS "+"
%token TIMES "*"

%token LCURLY "{"
%token RCURLY "}"

%token LPAREN "("
%token RPAREN ")"

%token RETURN "return"

%%

input:
    expression
    {
        std::cout << "Result: " << $1 << std::endl;
    }
    ;

expression:
      NUMBER
      {
          $$ = $1;
      }
    | expression PLUS expression
      {
          $$ = $1 + $3;
      }
    | expression TIMES expression
      {
          $$ = $1 * $3;
      }
    ;

%%

void yyerror(const char* s)
{
    std::cerr << "Error: " << s << std::endl;
}
