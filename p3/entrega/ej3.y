/* Numero de practica: 3
* Ejercicio: 3
* NIP: 735576
* Nombre: Patricia Briones Yus
*/
%{
#include <stdio.h>
%}
%token X Y Z
%start s
%%

s : /* epsilon */
	| c X s
b : X c Y
	| X c
c : X b X
	| Z
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
}
main() {
  yyparse();
}