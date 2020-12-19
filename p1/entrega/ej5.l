/* Numero de practica: 1
* Ejercicio: 5
* NIP: 735576
* Nombre: Patricia Briones Yus
* Compilacion: flex ej5.l
*	       gcc lex.yy.c -lfl -o ej5
*	       ./ej5 <got.txt >sal5.txt
*/
%{
int S = 0;
int L = 0;
int B = 0;
int temporada[7];
%}
TEMP ^[ \t]*[1-7]
CAP [0-9]*
%%
[ \t]*|\n	{}
S		{S++;}
L		{L++;}
B		{B++;}
{TEMP}		{temporada[atoi(yytext)-1]++;}
{CAP}		{}
%%
int main(){
	for (int i=0; i<=6; i++)
		temporada[i] = 0;
	yylex();
	for (int j=0; j<=6; j++)
		printf("T%d:%d\n",j+1,temporada[j]);

	printf("FS:%d\nFL:%d\nFB:%d\n",S,L,B);

	if(S>L && S>B){printf("MM: Stark");}
	else if(L>B && L>S){printf("MM: Lannister");}
	else if(B>S && B>L){printf("MM: Baratheon");}
	else {printf("MM: Hay empate entre alguna de las casas");}	
}