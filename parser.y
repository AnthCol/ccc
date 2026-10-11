%{

#include <iostream>

extern int yylex();
void yyerror(const char* s);

%}

%define api.value.type {int}

%token NUMBER

%token INT
%token FLOAT
%token DOUBLE
%token CHAR
%token LONG
%token SHORT
%token VOID
%token UNSIGNED
%token SIGNED

%token CONST
%token VOLATILE
%token RESTRICT
%token ATOMIC

%token STRUCT
%token UNION
%token ENUM
%token TYPEDEF

%token AUTO
%token REGISTER
%token STATIC
%token EXTERN

%token RETURN
%token IF
%token ELSE
%token SWITCH
%token CASE
%token DEFAULT
%token FOR
%token WHILE
%token DO
%token BREAK
%token CONTINUE

%token SIZEOF

%token PLUS
%token TIMES

%token LCURLY
%token RCURLY
%token LPAREN
%token RPAREN
%token SEMICOLON
%token COMMA

%token IDENTIFIER

%start program

%%

// An expression produces a value. A statement performs an action.

program:
    external_declaration
    {
        std::cout << "Made it to external declaration\n"; 
    }
    ; 

external_declaration:
    function_definition
    {
        std::cout << "In external_declaration -> function_definition\n"; 
    }
    ;

function_definition:
    type_specifier IDENTIFIER LPAREN arg_list RPAREN compound_statement
    {
        std::cout << "Function definition recognized\n"; 
    }
    ;


arg_list: 
    // empty
    {

    }
    | param_list
    ; 

param_list:
    type_specifier IDENTIFIER
    {
        std::cout << "param list identified\n"; 
    }
    | param_list COMMA type_specifier IDENTIFIER
    ; 


type_specifier:
    INT 
    | FLOAT 
    | DOUBLE 
    | CHAR 
    | LONG 
    | SHORT 
    ; 

compound_statement:
    LCURLY return_statement RCURLY
    {
        std::cout << "In return statement from compound statement\n"; 
        // empty
    }
    |
    LCURLY RCURLY
    {
        // nothing to do
    }
    ; 


return_statement: 
    RETURN NUMBER SEMICOLON
    {
        std::cout << "return statement for number recognized" << "\n"; 
    }
    | RETURN SEMICOLON
    ; 

%%

void yyerror(const char* s)
{
    std::cerr << "Error: " << s << std::endl;
}
