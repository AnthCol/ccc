%{

#include <iostream>

extern int yylex();
void yyerror(const char* s);

%}

%define api.value.type {int}

%token NUMBER
%token PLUS 
%token TIMES 
%token LCURLY 
%token RCURLY 
%token LPAREN
%token RPAREN 
%token RETURN 
%token IDENTIFIER 
%token SEMICOLON

%token INT 
%token FLOAT
%token DOUBLE
%token CHAR
%token LONG
%token SHORT

%%

// An expression produces a value. A statement performs an action.

program:
    statement
    {

    }
    ; 


function_definition:
    type_specifier IDENTIFIER LPAREN RPAREN compound_statement

type_specifier:
    INT 
    | FLOAT 
    | DOUBLE 
    | CHAR 
    | LONG 
    | SHORT 
    ; 

compound_statement:
    LCURLY statement_list RCURLY
    {
        // empty
    }
    ; 

statement_list:
    statement 
    {
        // empty
    }
    | statement_list statement 
    {
        // empty
    }

statement:
    function_definition
    {
        // empty
    }
    | return_statement
    {
        // empty
    }
    ; 


return_statement: 
    RETURN INTEGER SEMICOLON
    {
        // empty
    }

%%

void yyerror(const char* s)
{
    std::cerr << "Error: " << s << std::endl;
}
