/* Numero de practica: 4
* Ejercicio: 1
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion:  bison -yd newick.y
*				flex newick.l
*				gcc -lfl lex.yy.c y.tab.c -o newick
*/
%{
#include "y.tab.h"
%}
NUM [0-9]+"."?[0-9]*
LETRA [a-zA-Z]
NOMBRE ({LETRA}+[0-9|"_"|{LETRA}]*)*
%s PUNTOS

%%

"("			{ return(PUNO); }
")"			{ return(PDOS); }
{NOMBRE}	{ yylval.datos.nombre = strdup(yytext); return(NOM); }
":"			{ BEGIN(PUNTOS); }
<PUNTOS>{NUM}	{ yylval.datos.altura = atof(yytext); return(NUMERO); BEGIN(INITIAL); }
","			{ return(COMA); }
";"			{ return(EOL); }
\n
[ \t]
.			{ return(yytext[0]); }
%%