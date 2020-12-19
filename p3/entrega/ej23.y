/* Numero de practica: 3
* Ejercicio: 2.3
* NIP: 735576
* Nombre: Patricia Briones Yus
*/
/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion 2016/17 */
%{
#include <stdio.h>
int acum;
%}
%token NUMBER EOL CP OP	FUNC ACU
%start calclist
%token ADD SUB
%token MUL DIV
%%

calclist : /* nada */
	| calclist exp EOL { printf("=%d\n", $2); }
	| calclist exp FUNC { acum = $2; }
	;
exp : 	factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }
	| exp ADD numero { $$ = $1 + $3; }
	| exp SUB numero { $$ = $1 - $3; }
	| numero { $$ = $1; }
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple MUL factorsimple { $$ = $1 * $3; }
		| factorsimple DIV factorsimple { $$ = $1 / $3; }
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| numero
		;
numero	: NUMBER
		| ACU { $$ = acum; }
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
main() {
  yyparse();
}