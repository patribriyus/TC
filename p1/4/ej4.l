/* Numero de practica: 1
* Ejercicio: 4
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion: flex ej4.l
*	       gcc lex.yy.c -lfl -o ej4
*	       ./ej4 <ent4.txt >sal4.txt
*/
DIGITO [0-9]
%%
{DIGITO}	{printf("%d",atoi(yytext)+1);}
\n		{printf("\n\n");}
%%