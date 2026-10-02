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
"return"        { return RETURN; }
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
