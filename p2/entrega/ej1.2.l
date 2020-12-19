/* Numero de practica: 2
* Ejercicio: 1.2
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion: flex ej1.2.l
*	       gcc lex.yy.c -lfl -o ej1.2
*	       ./ej1.2 <descompresor.txt >sal.txt
*/
%{
char letra;
%}
ADN 	>.*\n
%s REPETIR
%%
{ADN}			{ECHO;}
<REPETIR>[0-9]+		{for(int i=1;i<atoi(yytext);i++){printf("%c",letra);}}
<*>A|C|T|G		{ECHO;letra=yytext[0];BEGIN(REPETIR);}
%%