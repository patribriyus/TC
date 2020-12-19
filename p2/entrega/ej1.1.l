/* Numero de practica: 2
* Ejercicio: 1.1
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion: flex ej1.1.l
*	       gcc lex.yy.c -lfl -o ej1.1
*	       ./ej1.1 <compresor.txt >sal.txt
*/
ADN 	>.*\n
%s REPE_A REPE_C REPE_T REPE_G
%%
{ADN}		{ECHO;}
<REPE_A>A+	{printf("%d",yyleng+1);}
<REPE_C>C+	{printf("%d",yyleng+1);}
<REPE_T>T+	{printf("%d",yyleng+1);}
<REPE_G>G+	{printf("%d",yyleng+1);}
<*>A		{ECHO;BEGIN(REPE_A);}
<*>C		{ECHO;BEGIN(REPE_C);}
<*>T		{ECHO;BEGIN(REPE_T);}
<*>G		{ECHO;BEGIN(REPE_G);}
%%