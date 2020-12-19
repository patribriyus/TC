/* Numero de practica: 3
* Ejercicio: 2.2
* NIP: 735576
* Nombre: Patricia Briones Yus
*/
/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion 2016/17 */
%{
#include <stdio.h>
int transformar(int numero){
	if(numero == 0 || numero == 1){
		return numero;
	}
	else{
		return numero%2 + transformar(numero/2)*10;
	}
}
%}
%token NUMBER EOL CP OP BIN
%start calclist
%token ADD SUB
%token MUL DIV
%%

calclist : /* nada */
	| calclist exp EOL { printf("=%d\n", $2); }
	| calclist exp BIN { $2 = transformar($2); printf("=%d\n", $2); }
	;
exp : 	factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	| exp ADD NUMBER { $$ = $1 + $3; }
	| exp SUB NUMBER { $$ = $1 - $3; }
	| NUMBER { $$ = $1; }	
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple MUL factorsimple { $$ = $1 * $3; }
		| factorsimple DIV factorsimple { $$ = $1 / $3; }
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
main() {
  yyparse();
}