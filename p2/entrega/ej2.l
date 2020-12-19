/* Numero de practica: 2
* Ejercicio: 2
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion: flex ej2.l
*	       gcc lex.yy.c -lfl -lm -o ej2
*	       ./ej2 <ent2.txt >sal.txt
*/

%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
int comentarios = 0;	// Num de comentarios
int lineas = 0;		// Num de lineas totales (incluyendo comentarios)
int con = 0;		// Num de constantes definidas (fuera de comentarios)
int linf = 0;		// Num de lineas total de funciones
int l = 0;		// Num de lineas de una funcion
int f = 0;		// Num funciones
int desviacion[0];	// Vector de num de lineas de cada funcion
%}
%s COMEN FUNC
%%
[ \t]*
<COMEN>.*"*/"		{comentarios++;BEGIN(INITIAL);}
<COMEN>.*		{comentarios++;}
^"/*"			{BEGIN(COMEN);}
^"//".*			{comentarios++;}
"const"			{con++;}
<FUNC>^"}"		{linf++;l++;desviacion[f-1]=l;BEGIN(INITIAL);}
<FUNC>.*		{linf++;l++;}
^"{"			{f++;linf+=2;l=2;BEGIN(FUNC);}
.
\n			{lineas++;}
%%
int main(){
	desviacion[0] = 0;
	yylex();
	int lineasCodigo = lineas+1-comentarios;
	double media = linf/f*1.0;
	double suma = 0.0;
	for(int i=0;i<f;i++){
		suma += pow(desviacion[i]*1.0-media,2);
	}
	double num = suma/f*1.0;
	double fs = sqrt(num);
	double puntos = 0.0;
	
	if( (comentarios*1.0/lineasCodigo*1.0)*100.0 >= 10.0 && (comentarios*1.0/lineasCodigo*1.0)*100.0 <= 50.0 ){
		puntos += 4.0;
	}

	if( con > 0 ){
		puntos += 1.0;
	}

	if( (f*1.0/lineasCodigo*1.0)*100.0 >= 20.0 && (f*1.0/lineasCodigo*1.0)*100.0 <= 30.0 ){
		puntos += 2.5;
	}

	if( fs < 5.0 ){
		puntos += 2.5;
	}

	printf("T:%d\nC:%d\nCONST:%d\nF:%d\nFM:%.2f\nFS:%.1f\nP:%.1f",lineasCodigo,comentarios,con,f,media,fs,puntos);
}