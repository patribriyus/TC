/* calcOrig.y fichero para la practica 3 de Teoria de la Computacion 2016/17 */
%{
#include <stdio.h>
%}
%token NUMBER ADD SUB MUL DIV EOL CP OP
%start calclist
%%

// Bison siempre elige desplazar si tiene pinta de ser una buena opcion para cumplir reglas
// Bison tiene una pila donde mete los tokens recibidos
// Intenta reducir al maximo al final queda: exp-ADD-factor = exp y despues se detecta el final de linea EOL
//																			|	NUMBER		 | (vuelta a empezar)
//|			 |  				  ->|			   |  ->|	  ADD      |  ->|		ADD	     |				--> etc...
//|	NUMBER	 |3 (numero asociado) ->|	 FACTOR    |3 ->|	 EXP       |3 ->|	    EXP      |3
//| calclist |x|  				  ->| calclist   |x|  ->| calclist   |x|  ->| calclist     |x|
//-------------------------
calclist : /* nada (epsilon)*/
	| calclist exp EOL { printf("=%d\n", $2); }	// Cuando se ejecute la regla "calclist exp EOL" imprime por pantalla eso
	//   $1     $2  $3
	// EOL = final de linea
	;
exp : 	factor	// $$ = exp -> numero asociado a esa regla
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }
	;
factor : 	term	// $$ = factor -> numero asociado a la regla
		| exp MUL factor { $$ = $1 * $3; }
		| exp DIV factor { $$ = $1 / $3; }
		;

term : 	NUMBER { printf("number=%d\n", $1); }	// $1 = NUMBER
	| OP exp CP { $$ = $2; }
	;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
main() {
  yyparse();
}

