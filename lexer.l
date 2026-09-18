%{  
#include <cstdlib>
#include "parser.tab.h"
#include <string>
%}

%option noyywrap

%%

[ \t\n]+        ; 
[0-9]+          { yylval = std::stoi(yytext); return NUMBER; }
"+"             { return PLUS; }
"*"             { return TIMES; }
.               { return yytext[0]; }


%%


