/* Numero de practica: 3
* Ejercicio: 2.2
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion:  bison -yd ej22.y
*				flex ej22.l
*				gcc -lfl lex.yy.c y.tab.c -o ej22
*/
/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion 2016/17 */
%{
#include "y.tab.h"
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
";"\n	{return(EOL);}
";b"\n	{return(BIN);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
