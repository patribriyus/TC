/* Numero de practica: 3
* Ejercicio: 2.1
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion:  bison -yd ej21.y
*				flex ej21.l
*				gcc -lfl -lm lex.yy.c y.tab.c -o ej21
*/
/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion 2016/17 */
%{
#include "y.tab.h"
#include "math.h"
int transformar(int numero, int posicion){
	if(numero == 1 || numero == 0){
		return numero * pow(2,posicion);
	}
	else{
		return numero%10 * pow(2,posicion) + transformar(numero/10,posicion+1); 
	}
}
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-1]+b	{yylval = transformar(atoi(yytext),0); return(NUMBER);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
