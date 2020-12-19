/* Numero de practica: 3
* Ejercicio: 3
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion:  bison -yd ej3.y
*				flex ej3.l
*				gcc -lfl lex.yy.c y.tab.c -o ej3
*/
%{
#include "y.tab.h"
%}

%%
x	{ return(X); }
y	{ return(Y); }
z	{ return(Z); }
%%