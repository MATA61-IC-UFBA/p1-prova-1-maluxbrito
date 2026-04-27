%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token ERROR
%token PRINT
%token CONCAT
%token LENGHT
%token IDENT
%token STRING
%token NUM
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token LPAREN
%token RPAREN
%token ASSIGN
%token COMMA

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr 
;

exprlist
: exprlist
: expr                
| exprlist COMMA expr 
;

expr
: expnum
| expstr
;

expstr
: acoes
 


expnum
: termo
| expnum PLUS termo
| expnum MINUS termo
;

termo
    : fator
    | termo TIMES fator
    | termo DIV fator
    ;

fator
    : NUM
    | LPAREN expnum RPAREN
    ;

%%


