%{
#include <iostream>
#include <cstdlib>
#include <string>
#include "parser.tab.h"
%}

%option noyywrap

%%

[0-9]+          { yylval = std::stoi(yytext); return NUMBER; }

"+"             { return PLUS; }
"*"             { return TIMES; }
"{"             { return LCURLY; }
"}"             { return RCURLY; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"return"        { return RETURN; }

[ \t\n]+        ;

.               {
                    std::cerr << "Unexpected character: " << yytext << std::endl;
                }

%%
