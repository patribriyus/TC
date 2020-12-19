%{
#include <stdio.h>
%}

//S->ab|aSb
%token A B
%start start

%%

s: A B	// Tiene que haber un espacio entre A y B
   | A s B
%%

int yyerror(char* s){
	printf("\n%s\n,s")	// Error si la cadena no pertenece
}
// Si no escribe nada por pantalla significa que la palabra introducida pertenece 

int main(){
	yyparse();		// Es como el yylex();
}