/* Numero de practica: 3
* Ejercicio: 2.3
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion:  bison -yd ej23.y
*				flex ej23.l
*				gcc -lfl lex.yy.c y.tab.c -o ej23
*/
/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion 2016/17 */
%{
#include "y.tab.h"
%}
%s ASIGNACION
%%
<*>"+"	{ return(ADD); }
<*>"-"	{ return(SUB); }
<*>"*"	{ return(MUL); }
<*>"/"	{ return(DIV); }
<*>"("	{ return(OP); }
<*>")"	{ return(CP); }
<*>[0-9]+	{ yylval = atoi(yytext); return(NUMBER); }
"acum:="	{ BEGIN(ASIGNACION); }
<ASIGNACION>\n	{ BEGIN(INITIAL); return(FUNC); }
<*>"acum"	{ return(ACU); }
\n	{ return(EOL); }
<*>[ \t]	{/* ignorar espacios */}
<*>.	{ return(yytext[0]); /* caracter inesperado */ }
%%