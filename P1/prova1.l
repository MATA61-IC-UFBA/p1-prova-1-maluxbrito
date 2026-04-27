%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%


[ \t]+              ;   

"//".* ; 

"print"     { return PRINT; }
"concat"    { return CONCAT; }
"length"    { return LENGHT; }

[a-zA-Z][a-zA-Z0-9_]{0,255}    { return IDENT; }

\"[a-zA-Z]+"    { return STRING; }

[0-9]+(\.[0-9]+)?   { return NUM; }

"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return TIMES; }
"/"     { return DIV; }
"("     { return LPAREN; }
")"     { return RPAREN; }
"="     { return ASSIGN; }
","     { return COMMA; }


\n      { return EOL; }

.            { return ERROR; }

%%
