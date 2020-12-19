/* Numero de practica: 4
* Ejercicio: 1
* NIP: 735576
* Nombre: Patricia Briones Yus
*/

%{
#include <stdio.h>
#include <string.h>
int numHojas = 0;
%}

%union {
	struct nodo {
		char* nombre;
		float altura;
	} datos;
}

%token PUNO PDOS NOM NUMERO COMA EOL
%start salida
%type<datos> hoja s2 s3 c NOM NUMERO

%%

salida : /* nada */
		| salida hoja EOL {printf("La altura es %.2f\nLa raiz se llama %s\n",$2.altura,$2.nombre);}
		;
hoja :	s2 s3			{ $$.nombre = $1.nombre ; $$.altura = $2.altura; numHojas++; }
		| PUNO c PDOS s2 s3	{ $$.nombre = $4.nombre ; $$.altura = $2.altura + $5.altura; }
		;
s2 :	/* epsilon */	{ $$.nombre = ""; }
		| NOM			{ $$.nombre = strdup($1.nombre); }
		;
s3 :	/* epsilon */	{ $$.altura = 1;  }
		| NUMERO		{ $$.altura = $1.altura; }
		;
c :		hoja
		| hoja COMA c	{ if($1.altura > $3.altura){ $$.altura = $1.altura; } else{ $$.altura = $3.altura; } }
		;

%%

int yyerror(char* s) {
	printf("%s\n", s);
	return -1;
}

int main() {
	int error = yyparse();
	if (error == 0) {
		printf("El numero de hojas es %d\n", numHojas);
	}
}
