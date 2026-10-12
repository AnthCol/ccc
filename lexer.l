%{
#include <iostream>
#include <cstdlib>
#include <string>
#include "parser.tab.h"
%}

%option noyywrap

%%

[0-9]+          { yylval = std::stoi(yytext); return NUMBER; }

"int"           { return INT; }
"float"         { return FLOAT; }
"double"        { return DOUBLE; }
"char"          { return CHAR; }
"long"          { return LONG; }
"short"         { return SHORT; }
"void"          { return VOID; }
"unsigned"      { return UNSIGNED; }
"signed"        { return SIGNED; }

"const"         { return CONST; }
"volatile"      { return VOLATILE; }
"restrict"      { return RESTRICT; }
"_Atomic"       { return ATOMIC; }

"struct"        { return STRUCT; }
"union"         { return UNION; } 
"enum"          { return ENUM; }
"typedef"       { return TYPEDEF; }

"auto"          { return AUTO; }
"register"      { return REGISTER; }
"static"        { return STATIC; }
"extern"        { return EXTERN; }


"return"        { return RETURN; }
"if"            { return IF; }
"else"          { return ELSE; }
"switch"        { return SWITCH; }
"case"          { return CASE; }
"default"       { return DEFAULT; }
"for"           { return FOR; }
"while"         { return WHILE; }
"do"            { return DO; }
"break"         { return BREAK; }
"continue"      { return CONTINUE; }

"sizeof"        { return SIZEOF; }

"+"             { return PLUS; }
"*"             { return TIMES; }
"{"             { return LCURLY; }
"}"             { return RCURLY; }
"("             { return LPAREN; }
")"             { return RPAREN; }
";"             { return SEMICOLON; }
","             { return COMMA; }
[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFIER; }
[ \t\n]+        ;

.               {
                    std::cerr << "Unexpected character: " << yytext << std::endl;
                }

%%
